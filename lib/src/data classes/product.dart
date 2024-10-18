import 'dart:async';
import 'dart:convert';

import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:healthy_food/src/data%20classes/nutriment.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

final log = Logger();
const List<String> problematicTags = [
  "en:sandwiches",
  "en:fish-and-meat-and-eggs",
  "en:unpasteurised-products",
];
const TIMEOUT_DURATION = 30;

//!!! TODO: handle the status error thing
//!!! TODO: timeout cancel conflict (forgot what it was)
//TODO: need to eliminate incomplete products from search
//TODO: scanbar implementation
class Product {
  // * these are categories selected from openFoodFacts
  // ? note that they are likely to ignore some products
  // ? or to be more than needed from the python thing
  //! if you change something here, you need to change it in the getCategoriesMap for
  //! label consistency in different languages
  static const List<String> genericCategories = [
    "en:baby-foods",
    "en:desserts",
    "en:dairies",
    "en:breaded-products",
    "en:meals",
    "en:artisan-products",
    "en:seafood",
    //1 "en:sandwiches",
    "en:meats-and-their-products",
    "en:fresh-foods",
    "en:snacks",
    "en:canned-foods",
    "en:biscuits-and-crackers",
    "en:farming-products",
    //"en:fish-and-meat-and-eggs", // fish
    "en:cooking-helpers",
    //? these two are subdivied from the commented parent category
    "en:beverages", // +
    "en:beverage-preparations", // =
    // "en:beverages-and-beverages-preparations",
    "en:fermented-foods",
    "en:pasteurised-products",
    //"en:unpasteurised-products",
    //"en:skewers", // brochettes
  ];

//TODO: add translated categories
  static const Map<String, AppLocalizations> categoriesTranslated = {};

  static CancelableOperation<void>? _operation;

  final int? novaGroup;
  final int? nutritionScoreFr;

  static const String _baseUrl =
      'https://world.openfoodfacts.org/cgi/search.pl';
  final String? price;
  final String productName;
  final String brand;
  final List<String> ingredients;
  final List<Nutriment> nutrients;
  final List<String> countries;
  final String packaging;
  final String quantity;
  final String imageUrl;
  final String url;
  final String? ecoScore;

  Product({
    required this.price,
    required this.productName,
    required this.brand,
    required this.ingredients,
    required this.nutrients,
    required this.countries,
    required this.packaging,
    required this.quantity,
    required this.imageUrl,
    required this.url,
    required this.novaGroup,
    required this.nutritionScoreFr,
    required this.ecoScore,
  });

  // Convert JSON to Product object
  factory Product.fromJson(Map<String, dynamic> json) {
    //this is the default when there is no basic infos

    // if (json['product_name'] == null ||
    //     json['brands'] == null ||
    //     json['nutriments'] == null) {
    //   // Return null if the product is incomplete
    //   return Product(
    //       price: null,
    //       productName: json['product_name'] ?? "null",
    //       brand: json['brands'] ?? "unknown",
    //       ingredients: [],
    //       nutrients: [],
    //       countries: [],
    //       packaging: "",
    //       quantity: "",
    //       imageUrl: "",
    //       url: "",
    //       novaGroup: null,
    //       nutritionScoreFr: null);
    // }

    // Ensure nutriments is not null and is a map
    Map<String, dynamic> nutrimentsJson = (json['nutriments'] is Map)
        ? json['nutriments'] as Map<String, dynamic>
        : {};

    String bran = json['brands'] ?? 'Unknown Brand';
    bran = bran.replaceFirst(RegExp(r'\s\d+da', caseSensitive: false), '');

    return Product(
      ecoScore: json['ecoscore_grade'] as String? ?? "",
      price: getPrice(json['brands'] ?? 'unknown'),
      productName: json['product_name'] ?? 'Unknown Product',
      brand: bran,
      ingredients: (json['ingredients_text'] as String?)
              ?.split(', ')
              .map((ingredient) => ingredient.trim())
              .toList() ??
          [],
      nutrients: _parseNutrients(nutrimentsJson), // Use safe nutrimentsJson
      countries: (json['countries_tags'] as List<dynamic>?)
              ?.map((country) => country.toString())
              .toList() ??
          [],
      packaging: json['packaging'] ?? 'Unknown Packaging',
      quantity: json['quantity'] ?? 'Unknown Quantity',
      imageUrl: json['image_url'] ?? '',
      url: json['url'] ?? '',
      novaGroup: (json['nova_group'] is int)
          ? json['nova_group'] as int
          : null, // Safe parsing
      nutritionScoreFr: (json['nutriscore_score'] is int)
          ? json['nutriscore_score'] as int
          : null, // Safe parsing
    );
  }

  // Convert Product object to JSON
  Map<String, dynamic> toJson() {
    return {
      'product_name': productName,
      'brands': brand,
      'ingredients_text': ingredients.join(', '),
      'nutrients': {
        for (var nutriment in nutrients) nutriment.name: nutriment.value,
      },
      'countries_tags': countries,
      'packaging': packaging,
      'quantity': quantity,
      'image_url': imageUrl,
      'url': url,
    };
  }

  static List<Nutriment> _parseNutrients(Map<String, dynamic> json) {
    List<Nutriment> nutriments = [];

    json.forEach((key, value) {
      if (Nutriment.isRelevantNutrient(key)) {
        try {
          Nutriment nutrient = Nutriment.fromJson(key, json);
          nutriments.add(nutrient);
        } catch (e) {
          log.e('Ignored nutrient key: $key');
        }
      }
    });

    return nutriments;
  }

  static Future<List<Product>> fetchFoodProducts({
    String country = "algeria",
    required List<String> categories,
    required int limit,
    String? searchTerm, // Optional search term
  }) async {
    List<Product> products = [];
    // Build the URL with optional search term
    String url =
        '$_baseUrl?action=process&tagtype_0=countries&tag_contains_0=contains&tag_0=$country&page_size=$limit&json=1';

    if (categories.isNotEmpty) {
      for (int i = 0; i < categories.length; i++) {
        url +=
            '&tagtype_${i + 1}=categories&tag_contains_${i + 1}=contains&tag_${i + 1}=${categories[i]}';
      }
    }

    if (searchTerm != null && searchTerm.isNotEmpty) {
      url += '&search_terms=$searchTerm';
    }

    _operation = CancelableOperation.fromFuture(
      http.get(Uri.parse(url)).timeout(
        const Duration(seconds: TIMEOUT_DURATION),
        onTimeout: () {
          Fluttertoast.showToast(
              msg: "request timeout, check your internet connection");
          throw TimeoutException('The request has timed out');
        },
      ).then((response) {
        log.d("$url HTTP response: \n${response.body}");

        if (response.statusCode == 200) {
          products = parseResponse(response.body);

          if (products.isNotEmpty) {
            for (var product in products) {
              log.i(product.toString());
            }
          } else {
            log.i("No products available");
          }
          return products;
        } else {
          if (response.statusCode == 429) {
            Fluttertoast.showToast(msg: 'Too many requests');
          } else {
            Fluttertoast.showToast(msg: 'Failed to load food products');
          }
          return [];
        }
      }).catchError((e) {
        log.e("Exception $e with response status: ");
        Fluttertoast.showToast(msg: e.toString());
        return [];
      }),
    );
    await _operation!.value;
    // * use that log for further testing
    // log.f("i am jumping in code, fonction is buggie Xd");
    return products;

    //? this also maybe garbage
    //   try {
    //   final response = await http.get(Uri.parse(url));
    //   log.d("$url HTTP response: \n${response.body}");

    //   if (response.statusCode == 200) {
    //     List<Product> products = parseResponse(response.body);
    //     //for print tests
    //     if (products.isNotEmpty) {
    //       for (var product in products) {
    //         log.i(product);
    //       }
    //     } else {
    //       log.i("No products available");
    //     }
    //     return products;
    //   } else {
    //     if (response.statusCode == 429) {
    //       Fluttertoast.showToast(msg: 'Too many requests');
    //     } else {
    //       Fluttertoast.showToast(msg: 'Failed to load food products');
    //     }
    //   }
    //   log.d("url HTTP response: ${response.body}");
    // } catch (e) {
    //   log.e("Exception $e with response status: ");
    //   Fluttertoast.showToast(msg: e.toString());
    // }
    // return [];
  }

  static List<Product> parseResponse(String jsonResponse) {
    final Map<String, dynamic> decodedJson = json.decode(jsonResponse);
    final List<dynamic> productsJson = decodedJson['products'];

    if (productsJson.isEmpty) {
      log.i("No products found");
      return [];
    }

    return productsJson
        .map((productJson) => Product.fromJson(productJson))
        .toList();
  }
  // ! this may be garbage
  // static Future<List<Product>> startFetching({required List<String> categories,
  //   required int limit,
  //   String? searchTerm,}) async{
  //     List<Product> result=[];
  //   _operation = CancelableOperation.fromFuture(
  //     fetchFoodProducts(categories: categories, limit: limit,searchTerm: searchTerm).then((value)  {result= value;} ,)
  //   ,onCancel: () {
  //       log.i("Operation canceled");
  //     },).then();

  // }
  static Future<void> cancelFetching() async {
    if (_operation != null && !_operation!.isCanceled) {
      await _operation!.cancel();
      log.d('Operation has been canceled');
    }
  }

  static Map<String, String> getCategoriesMap(BuildContext context) {
    return {
      "en:baby-foods": AppLocalizations.of(context)!.baby_foods,
      // "en:fried-foods": AppLocalizations.of(context)!.fried_foods,
      "en:desserts": AppLocalizations.of(context)!.desserts,
      "en:breaded-products": AppLocalizations.of(context)!.breaded_products,
      "en:dairies": AppLocalizations.of(context)!.dairies,
      "en:meals": AppLocalizations.of(context)!.meals,
      "en:artisan-products": AppLocalizations.of(context)!.artisan_products,
      "en:seafood": AppLocalizations.of(context)!.seafood,
      //1 "en:sandwiches": AppLocalizations.of(context)!.sandwiches,
      "en:meats-and-their-products":
          AppLocalizations.of(context)!.meats_and_their_products,
      "en:fresh-foods": AppLocalizations.of(context)!.fresh_foods,
      "en:snacks": AppLocalizations.of(context)!.snacks,
      "en:canned-foods": AppLocalizations.of(context)!.canned_foods,
      "en:biscuits-and-crackers":
          AppLocalizations.of(context)!.buiscuits_and_crackers,
      "en:farming-products": AppLocalizations.of(context)!.farming_products,
      //2"en:fish-and-meat-and-eggs":
      //2  AppLocalizations.of(context)!.fish_and_meat_and_eggs,
      "en:fermented-foods": AppLocalizations.of(context)!.fermented_foods,
      "en:cooking-helpers": AppLocalizations.of(context)!.cooking_helpers,
      "en:beverages": AppLocalizations.of(context)!.beverages,
      "en:beverage-preparations":
          AppLocalizations.of(context)!.beverage_preparations,
      "en:pasteurised-products":
          AppLocalizations.of(context)!.pasteurised_products,
      //3"en:unpasteurised-products":
      //3  AppLocalizations.of(context)!.unpasteurised_products,
      //"en:skewers": "Skewers"
    };
  }

  @override
  String toString() {
    return """  productName: $productName
    brand: $brand
    ingredients: $ingredients
    nutrients: $nutrients
    countries: $countries
    packaging: $packaging
    quantity: $quantity
    imageUrl: $imageUrl
    url: $url
    nova: $novaGroup
    nutri: $nutritionScoreFr
    ****eco-score: $ecoScore****
    """;
  }

  static String? getPrice(String input) {
    RegExp regExp = RegExp(r'\s\d+da', caseSensitive: false);
    bool containsMatch;
    final RegExpMatch? matches;
    //   if(input==null){
    //    containsMatch = regExp.hasMatch(brand);
    //  matches = regExp.firstMatch(brand);
    //   }
    // else{
    containsMatch = regExp.hasMatch(input);
    matches = regExp.firstMatch(input);
    // }
    if (containsMatch) {
      return matches![0];
    }
    return null;
  }

  static final novaIconsPaths = [
    "assets/badges/nova-score/NOVA_group_1.png",
    "assets/badges/nova-score/NOVA_group_2.png",
    "assets/badges/nova-score/NOVA_group_3.png",
    "assets/badges/nova-score/NOVA_group_4.png",
    "assets/badges/nova-score/NOVA_group_unknown.png"
  ];
  static final nutriIconsPaths = [
    "assets/badges/nutri-score/Nutri-score-A.png",
    "assets/badges/nutri-score/Nutri-score-B.png",
    "assets/badges/nutri-score/Nutri-score-C.png",
    "assets/badges/nutri-score/Nutri-score-D.png",
    "assets/badges/nutri-score/Nutri-score-E.png",
    "assets/badges/nutri-score/Nutri-score-unknown.png",
  ];
  static final ecoIconsPaths = [
    "assets/badges/eco-score/eco-score-A.png",
    "assets/badges/eco-score/eco-score-B.png",
    "assets/badges/eco-score/eco-score-C.png",
    "assets/badges/eco-score/eco-score-D.png",
    "assets/badges/eco-score/eco-score-E.png",
    "assets/badges/eco-score/eco-score-unknown.png",
    "assets/badges/eco-score/eco-score-not_applicable.png",
  ];
  String getNovaIconPath() {
    if (novaGroup != null) {
      if (novaGroup! >= 1 && novaGroup! <= 4) {
        return novaIconsPaths[
            novaGroup! - 1]; // Adjust index to match the array
      } else {
        return novaIconsPaths[4]; // Fallback path
      }
    } else {
      return novaIconsPaths[4];
    }
  }

  String getNutriScoreIconPath() {
    if (nutritionScoreFr != null) {
      if (nutritionScoreFr! <= -1) {
        return nutriIconsPaths[0]; // Nutri-Score A
      } else if (nutritionScoreFr! <= 2) {
        return nutriIconsPaths[1]; // Nutri-Score B
      } else if (nutritionScoreFr! <= 10) {
        return nutriIconsPaths[2]; // Nutri-Score C
      } else if (nutritionScoreFr! <= 18) {
        return nutriIconsPaths[3]; // Nutri-Score D
      } else if (nutritionScoreFr! > 18) {
        return nutriIconsPaths[4]; // Nutri-Score E
      } else {
        return nutriIconsPaths[5]; // Fallback path
      }
    } else {
      return nutriIconsPaths[5];
    }
  }

  String getEcoScoreBadge() {
    switch (ecoScore?.toUpperCase()) {
      case 'A':
        return ecoIconsPaths[0];
      case 'B':
        return ecoIconsPaths[1];
      case 'C':
        return ecoIconsPaths[2];
      case 'D':
        return ecoIconsPaths[3];
      case 'E':
        return ecoIconsPaths[4];
      case "UNKNOWN":
        return ecoIconsPaths[5]; // Unknown eco score
      default:
        return ecoIconsPaths[6]; // Not applicable
      //case not applicable
      //case "NOT-APPLICABLE"
    }
  }
}
