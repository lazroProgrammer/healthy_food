import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:healthy_food/src/data%20classes/open_food_pub/nutriment.dart';
import 'package:logger/logger.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

const int TIMEOUT_NORMAL = 15;
const int TIMEOUT_DATASAVER = 20;
//TODO: fetch the same values on search and remove the detailed search and search branching (make searchDetailed the normal search)

class ProductHandler {
  static Logger log = Logger();
  static const countriesList = [
    "World",
    "Albania",
    "Algeria",
    "Andorra",
    "Argentina",
    "Australia",
    "Austria",
    "Belarus",
    "Belgium",
    "Bolivia",
    "Bosnia and Herzegovina",
    "Brazil",
    "Bulgaria",
    "Canada",
    "Chile",
    "China",
    "Colombia",
    "Costa Rica",
    "Croatia",
    "Cuba",
    "Cyprus",
    "Czech Republic",
    "Côte d'Ivoire",
    "Denmark",
    "Deutschland",
    "Dominican Republic",
    "Ecuador",
    "Egypt",
    "El Salvador",
    "Estonia",
    "Finland",
    "France",
    "French Polynesia",
    "Georgia",
    "Germany",
    "Greece",
    "Guadeloupe",
    "Hong Kong",
    "Hungary",
    "Iceland",
    "India",
    "Indonesia",
    "Iraq",
    "Ireland",
    "Israel",
    "Italy",
    "Japan",
    "Jordan",
    "Kuwait",
    "Latvia",
    "Lebanon",
    "Lithuania",
    "Luxembourg",
    "Malaysia",
    "Malta",
    "Martinique",
    "Mauritius",
    "Mexico",
    "Moldova",
    "Morocco",
    "Netherlands",
    "New Caledonia",
    "New Zealand",
    "North Macedonia",
    "Norway",
    "Pakistan",
    "Panama",
    "Paraguay",
    "Peru",
    "Philippines",
    "Poland",
    "Portugal",
    "Puerto Rico",
    "Qatar",
    "Romania",
    "Russia",
    "Réunion",
    "Saudi Arabia",
    "Senegal",
    "Serbia",
    "Singapore",
    "Slovakia",
    "Slovenia",
    "South Africa",
    "South Korea",
    "Spain",
    "Sweden",
    "Switzerland",
    "Taiwan",
    "Thailand",
    "Tunisia",
    "Turkey",
    "Turkiye",
    "Ukraine",
    "United Arab Emirates",
    "United Kingdom",
    "United States",
    "Uruguay",
    "Venezuela",
    "Vietnam"
  ];
  String? barcode;
  String? productName;
  String? ingredients;
  List<NutrimentHandler> nutriments = [];
  String? packagingInfo;
  List<String>? allergens;
  String? nutriScore;
  int? novaGroup;
  String? ecoScore;
  String? brand;
  String? quantity;
  String? categories;
  String? origins;
  List<String>? additives;
  List<String>? labels;
  String? servingSize;
  String? stores;
  String? countries;
  String imageUrl = "";

  static Future<ProductHandler?> fetchProductDataByCode(String barcode) async {
    try {
      ProductHandler p = ProductHandler();

      ProductResultV3 result = await OpenFoodAPIClient.getProductV3(
              ProductQueryConfiguration(barcode,
                  version: ProductQueryVersion.v3))
          .timeout(const Duration(seconds: TIMEOUT_NORMAL), onTimeout: () {
        throw TimeoutException("Request to fetch product data timed out");
      });

      p.barcode = result.product?.barcode;
      p.productName = result.product?.productName;
      p.ingredients = result.product?.ingredientsText;
      p.packagingInfo = result.product?.packaging;
      p.allergens = result.product?.allergens?.names;
      p.nutriScore = result.product?.nutriscore;
      p.novaGroup = result.product?.novaGroup;
      p.ecoScore = result.product?.ecoscoreGrade;
      p.brand = result.product?.brands;
      p.quantity = result.product?.quantity;
      p.categories = result.product?.categories;
      p.origins = result.product?.origins;
      p.additives = result.product?.additives?.names;
      p.labels = result.product?.labelsTags;
      p.servingSize = result.product?.servingSize;
      p.stores = result.product?.stores;
      p.countries = result.product?.countries;
      p.imageUrl = result.product?.imageFrontUrl ?? "";
      p.nutriments = getNutrimentsFromProduct(result.product!);

      return p;
    } on TimeoutException catch (_) {
      Fluttertoast.showToast(msg: "Request to fetch product data timed out");
      return null;
    } catch (e) {
      log.e('Error fetching product data: $e');
      return null;
      // throw Exception();
    }
  }

  static Future<SearchResult?> searchProducts({
    String? name, // Search by product name
    String? brand, // Search by brand name
    String? store, // Search by store
    String? ingredient, // Search by ingredients
    required List<String> categories, // Search by category (Pnns2)
    String? nutritionGrade, // Search by nutrition grade (A, B, C, etc.)
    String? additive, // Search by additives (e.g., E numbers)
    String? label, // Search by product labels (e.g., organic, fair-trade)
    String? allergen, // Search by allergens (e.g., gluten, nuts)
    String? packaging, // Search by packaging (e.g., bottle, box)
    String? country, // Search by country (e.g., France, USA)
    String? trace, // Search by traces (e.g., traces of nuts)
  }) async {
    // Create a search configuration based on the provided consumer-oriented filters
    try {
      ProductSearchQueryConfiguration searchConfig =
          ProductSearchQueryConfiguration(
        fields: [
          ProductField.BARCODE,
          ProductField.NAME, // Product name
          ProductField.BRANDS, // Brand information
          ProductField.IMAGE_FRONT_URL, // Product photo
          ProductField.INGREDIENTS_TEXT, // Ingredients
          ProductField.NUTRIMENTS,
          ProductField.ECOSCORE_GRADE,
          ProductField.NOVA_GROUP,
          ProductField.NUTRISCORE,
          ProductField.QUANTITY,
          ProductField.CATEGORIES
          // Nutriments information
        ],
        parametersList: [
          if (name != null) SearchTerms(terms: [name]),
          for (var i in categories)
            TagFilter.fromType(
                tagFilterType: TagFilterType.CATEGORIES, tagName: i),
          if (country != null && country != "world")
            TagFilter.fromType(
                tagFilterType: TagFilterType.COUNTRIES,
                tagName: country), // Search by product name
          if (brand != null) SearchTerms(terms: [brand]), // Search by brand
          if (store != null) SearchTerms(terms: [store]), // Search by store
          if (ingredient != null)
            SearchTerms(terms: [ingredient]), // Search by ingredient
          if (nutritionGrade != null)
            SearchTerms(terms: [nutritionGrade]), // Search by nutrition grade
          if (additive != null)
            SearchTerms(terms: [additive]), // Search by additives
          if (label != null)
            SearchTerms(terms: [label]), // Search by product labels
          if (allergen != null)
            SearchTerms(terms: [allergen]), // Search by allergens
          if (packaging != null)
            SearchTerms(terms: [packaging]), // Search by packaging type
          if (trace != null)
            SearchTerms(
                terms: [trace]), // Search by traces (e.g., traces of nuts)
        ],
        version: ProductQueryVersion.v3, // Specify the version of the API
      );

      // Perform the search request
      SearchResult result =
          await OpenFoodAPIClient.searchProducts(null, searchConfig);
      for (var element in retrieveProducts(result)) {
        log.i(element);
      }
      return result;
    } on Exception catch (e) {
      log.e("Error fetching products: $e");
    }
    return null;
  }

  static Future<SearchResult?> searchProductsDetailed({
    String? name, // Search by product name
    String? brand, // Search by brand name
    String? store, // Search by store
    String? ingredient, // Search by ingredients
    required List<String> categories, // Search by category (Pnns2)
    String? nutritionGrade, // Search by nutrition grade (A, B, C, etc.)
    String? additive, // Search by additives (e.g., E numbers)
    String? label, // Search by product labels (e.g., organic, fair-trade)
    String? allergen, // Search by allergens (e.g., gluten, nuts)
    String? packaging, // Search by packaging (e.g., bottle, box)
    String? country, // Search by country (e.g., France, USA)
    String? trace, // Search by traces (e.g., traces of nuts)
  }) async {
    // Create a search configuration based on the provided consumer-oriented filters
    try {
      ProductSearchQueryConfiguration searchConfig =
          ProductSearchQueryConfiguration(
        fields: [
          ProductField.BARCODE,
          ProductField.NAME, // Product name
          ProductField.BRANDS, // Brand information
          ProductField.IMAGE_FRONT_URL, // Product photo
          ProductField.INGREDIENTS_TEXT, // Ingredients
          ProductField.NUTRIMENTS,
          ProductField.ECOSCORE_GRADE,
          ProductField.NOVA_GROUP,
          ProductField.NUTRISCORE,
          ProductField.QUANTITY,
          ProductField.ADDITIVES,
          ProductField.ALLERGENS,
          ProductField.PACKAGING,
          ProductField.CATEGORIES,
          ProductField.ORIGINS,
          // Nutriments information
        ],
        parametersList: [
          if (name != null) SearchTerms(terms: [name]),
          for (var i in categories)
            TagFilter.fromType(
                tagFilterType: TagFilterType.CATEGORIES, tagName: i),
          if (country != null && country != "world")
            TagFilter.fromType(
                tagFilterType: TagFilterType.COUNTRIES,
                tagName: country), // Search by product name
          if (brand != null) SearchTerms(terms: [brand]), // Search by brand
          if (store != null) SearchTerms(terms: [store]), // Search by store
          if (ingredient != null)
            SearchTerms(terms: [ingredient]), // Search by ingredient
          if (nutritionGrade != null)
            SearchTerms(terms: [nutritionGrade]), // Search by nutrition grade
          if (additive != null)
            SearchTerms(terms: [additive]), // Search by additives
          if (label != null)
            SearchTerms(terms: [label]), // Search by product labels
          if (allergen != null)
            SearchTerms(terms: [allergen]), // Search by allergens
          if (packaging != null)
            SearchTerms(terms: [packaging]), // Search by packaging type
          if (trace != null)
            SearchTerms(
                terms: [trace]), // Search by traces (e.g., traces of nuts)
        ],
        version: ProductQueryVersion.v3, // Specify the version of the API
      );

      // Perform the search request
      SearchResult result =
          await OpenFoodAPIClient.searchProducts(null, searchConfig);
      for (var element in retrieveProducts(result)) {
        log.i(element);
      }
      return result;
    } on Exception catch (e) {
      log.e("Error fetching products: $e");
    }
    return null;
  }

  static List<ProductHandler> retrieveProducts(SearchResult searchResult) {
    List<ProductHandler> results = [];
    // Check if searchResult is not null and has products
    if (searchResult.products == null || searchResult.products!.isEmpty) {
      return []; // Return an empty list if no products found
    }

    // Return the list of products from searchResult

    for (var p in searchResult.products!) {
      results.add(retrieveProductInfo(p));
    }
    return results;
  }

  static ProductHandler retrieveProductInfo(Product product) {
    ProductHandler p = ProductHandler();
    p.productName = product.productName;
    p.ingredients = product.ingredientsText;
    // nutrients = product.nutriments;
    p.barcode = product.barcode;
    p.packagingInfo = product.packaging;
    p.allergens = (product.allergens != null)
        ? List.from(product.allergens!.names)
        : null;
    p.nutriScore = product.nutriscore;
    p.novaGroup = product.novaGroup;
    p.ecoScore = product.ecoscoreGrade;
    p.brand = product.brands;
    p.quantity = product.quantity;
    p.categories = product.categories;
    p.origins = product.origins;
    p.additives = (product.additives != null)
        ? List.from(product.additives!.names)
        : null;
    p.labels = product.labelsTags;
    p.servingSize = product.servingSize;
    p.stores = product.stores;
    p.countries = product.countries;
    p.imageUrl = product.imageFrontUrl ?? "";
    // p.nutriments = getNutrimentsFromProduct(product);
    p.nutriments = getNonZeroNutrients(product);

    return p;
  }

  static Future<List<ProductHandler>> search(
      {String? name,
      required List<String> categories,
      required String? country,
      bool? detailed}) async {
    SearchResult? responce;
    if (detailed == null || !detailed) {
      responce = await searchProducts(
          name: name, categories: categories, country: country);
    } else {
      responce = await searchProductsDetailed(
          name: name, categories: categories, country: country);
    }
    List<ProductHandler> result = [];
    if (responce != null) {
      result = retrieveProducts(responce);
    }
    return result;
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
    switch (nutriScore?.toUpperCase()) {
      case 'A':
        return nutriIconsPaths[0];
      case 'B':
        return nutriIconsPaths[1];
      case 'C':
        return nutriIconsPaths[2];
      case 'D':
        return nutriIconsPaths[3];
      case 'E':
        return nutriIconsPaths[4];
      case "UNKNOWN":
        return nutriIconsPaths[5]; // Unknown eco score
      default:
        return nutriIconsPaths[5]; // Not applicable
      //case not applicable
      //case "NOT-APPLICABLE"
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

  static List<NutrimentHandler> getNutrimentsFromProduct(Product product) {
    List<NutrimentHandler> nutrimentList = [];

    Nutriments? nutriments = product.nutriments;

    if (nutriments != null) {
      // Map of Nutrient keys and their labels + units
      Map<Nutrient, String> nutrientLabels = {
        Nutrient.energyKJ: 'Energy (kJ)',
        Nutrient.proteins: 'Proteins',
        Nutrient.carbohydrates: 'Carbohydrates',
        Nutrient.sugars: 'Sugars',
        Nutrient.fat: 'Fat',
        Nutrient.saturatedFat: 'Saturated Fat',
        Nutrient.fiber: 'Fiber',
        Nutrient.salt: 'Salt',
      };

      Map<Nutrient, String> nutrientUnits = {
        Nutrient.energyKJ: 'kJ',
        Nutrient.proteins: 'g',
        Nutrient.carbohydrates: 'g',
        Nutrient.sugars: 'g',
        Nutrient.fat: 'g',
        Nutrient.saturatedFat: 'g',
        Nutrient.fiber: 'g',
        Nutrient.salt: 'g',
      };

      // Loop through each nutrient
      for (Nutrient nutrient in nutrientLabels.keys) {
        double? value = nutriments.getValue(nutrient, PerSize.oneHundredGrams);
        if (value != null) {
          nutrimentList.add(NutrimentHandler(
              label: nutrientLabels[nutrient]!,
              unit: nutrientUnits[nutrient]!,
              value: value.toString(),
              isGood: _IsGoodNutrient(nutrient),
              conversionRate: conversionRate(nutrient)));
        }
      }
    } else {
      print("No nutriments found for this product.");
    }

    return nutrimentList;
  }

  static List<NutrimentHandler> getNonZeroNutrients(Product product) {
    List<NutrimentHandler> nutrimentList = [];
    Nutriments? nutriments = product.nutriments;

    if (nutriments != null) {
      // Loop through each nutrient in Nutrient.values
      for (var nutrient in Nutrient.values) {
        double? value = nutriments.getValue(nutrient, PerSize.oneHundredGrams);

        // Only add to the list if value is non-null and greater than zero
        if (value != null && value > 0) {
          // Convert to mg if it's a mineral in grams
          if (_isMineralInMg(nutrient)) {
            value = (value * 1000); // Convert to mg
          } else {
            if (_isMineralInMicroGram(nutrient)) {
              value = (value * 1000000);
            }
          }

          nutrimentList.add(NutrimentHandler(
              label: _getNutrientLabel(nutrient), // Get appropriate label
              unit: _getNutrientUnit(nutrient), // Get appropriate unit
              value: (value > 1000)
                  ? value.toStringAsFixed(0)
                  : value.toStringAsFixed(2),
              isGood: _IsGoodNutrient(nutrient),
              conversionRate: conversionRate(nutrient)));
        }
      }
    }

    return nutrimentList;
  }

// Helper function to check if the nutrient is a mineral and in grams
  static bool _isMineralInMg(Nutrient nutrient) {
    // List of nutrients that should be in milligrams but may be stored as grams
    return nutrient == Nutrient.calcium ||
        nutrient == Nutrient.sodium ||
        nutrient == Nutrient.fluoride ||
        nutrient == Nutrient.bicarbonate ||
        nutrient == Nutrient.chloride ||
        nutrient == Nutrient.iron ||
        nutrient == Nutrient.magnesium ||
        nutrient == Nutrient.potassium ||
        nutrient == Nutrient.zinc ||
        nutrient == Nutrient.copper ||
        nutrient == Nutrient.manganese ||
        nutrient == Nutrient.selenium;
  }

  static bool _isMineralInMicroGram(Nutrient nutrient) {
    // List of nutrients that should be in milligrams but may be stored as grams
    return nutrient == Nutrient.vitaminA ||
        nutrient == Nutrient.vitaminC ||
        nutrient == Nutrient.vitaminD ||
        nutrient == Nutrient.vitaminE ||
        nutrient == Nutrient.vitaminK ||
        nutrient == Nutrient.vitaminB1 ||
        nutrient == Nutrient.vitaminB2 ||
        nutrient == Nutrient.vitaminPP ||
        nutrient == Nutrient.vitaminB6 ||
        nutrient == Nutrient.vitaminB12 ||
        nutrient == Nutrient.cholesterol;
  }

// Helper function to get the appropriate label for each nutrient
  static String _getNutrientLabel(Nutrient nutrient) {
    // You can customize the label if needed or keep it as is
    return nutrient.toString().split('.').last.replaceAllMapped(
        RegExp(r'([a-z])([A-Z])'),
        (Match match) => '${match.group(1)} ${match.group(2)}');
  }

// Helper function to get the appropriate unit for each nutrient
  static String _getNutrientUnit(Nutrient nutrient) {
    switch (nutrient) {
      case Nutrient.energyKJ:
      case Nutrient.energyKCal:
        return nutrient == Nutrient.energyKJ ? 'kJ' : 'kcal';
      case Nutrient.salt:
      // case Nutrient.sodium:
      case Nutrient.alcohol:
      case Nutrient.fat:
      case Nutrient.saturatedFat:
      case Nutrient.polyunsaturatedFat:
      case Nutrient.monounsaturatedFat:
      case Nutrient.transFat:
      case Nutrient.omega3:
      case Nutrient.omega6:
      case Nutrient.omega9:
      case Nutrient.sugars:
      case Nutrient.carbohydrates:
      case Nutrient.fiber:
      case Nutrient.proteins:
        return 'g';
      case Nutrient.vitaminA:
      case Nutrient.vitaminC:
      case Nutrient.vitaminD:
      case Nutrient.vitaminE:
      case Nutrient.vitaminK:
      case Nutrient.vitaminB1:
      case Nutrient.vitaminB2:
      case Nutrient.vitaminPP:
      case Nutrient.vitaminB6:
      case Nutrient.vitaminB12:
      case Nutrient.cholesterol:
        return 'µg';
      case Nutrient.calcium:
      case Nutrient.iron:
      case Nutrient.magnesium:
      case Nutrient.phosphorus:
      case Nutrient.potassium:
      case Nutrient.zinc:
      case Nutrient.copper:
      case Nutrient.manganese:
      case Nutrient.selenium:
      case Nutrient.sodium:
      case Nutrient.fluoride:
      case Nutrient.chloride:
      case Nutrient.bicarbonate:
        return 'mg'; // Minerals will be converted to mg

      default:
        return ''; // Default case if unit is not defined
    }
  }

  static bool? _IsGoodNutrient(Nutrient nutrient) {
    switch (nutrient) {
      case Nutrient.energyKJ:
      case Nutrient.energyKCal:
        return false;
      // case Nutrient.sodium:
      case Nutrient.alcohol:
      case Nutrient.fat:
      case Nutrient.saturatedFat:
      case Nutrient.polyunsaturatedFat:
      case Nutrient.monounsaturatedFat:
      case Nutrient.transFat:
      case Nutrient.omega6:
      case Nutrient.omega9:
      case Nutrient.sugars:
      case Nutrient.carbohydrates:
      case Nutrient.salt:
        return false;
      case Nutrient.omega3:
      case Nutrient.fiber:
      case Nutrient.proteins:
      case Nutrient.vitaminA:
      case Nutrient.vitaminC:
      case Nutrient.vitaminD:
      case Nutrient.vitaminE:
      case Nutrient.vitaminK:
      case Nutrient.vitaminB1:
      case Nutrient.vitaminB2:
      case Nutrient.vitaminPP:
      case Nutrient.vitaminB6:
      case Nutrient.vitaminB12:
      case Nutrient.calcium:
      case Nutrient.iron:
      case Nutrient.magnesium:
      case Nutrient.phosphorus:
      case Nutrient.potassium:
      case Nutrient.zinc:
      case Nutrient.copper:
      case Nutrient.manganese:
      case Nutrient.selenium:
      case Nutrient.sodium:
      case Nutrient.fluoride:
      case Nutrient.chloride:
      case Nutrient.bicarbonate:
        return true; // Minerals will be converted to mg
      case Nutrient.cholesterol:
        return false;
      default:
        return null; // Default case if unit is not defined
    }
  }

  static double conversionRate(Nutrient nutrient) {
    switch (nutrient) {
      case Nutrient.energyKJ:
      case Nutrient.energyKCal:
        return 0.0;
      // case Nutrient.sodium:
      case Nutrient.alcohol:
      case Nutrient.fiber:
      case Nutrient.fat:
      case Nutrient.saturatedFat:
      case Nutrient.carbohydrates:
      case Nutrient.sugars:
      case Nutrient.proteins:
        return 0.2;
      case Nutrient.polyunsaturatedFat:
      case Nutrient.monounsaturatedFat:
      case Nutrient.transFat:
      case Nutrient.omega6:
      case Nutrient.omega9:
      case Nutrient.salt:
        return 0.02;
      case Nutrient.omega3:
      case Nutrient.vitaminA:
      case Nutrient.vitaminC:
      case Nutrient.vitaminD:
      case Nutrient.vitaminE:
      case Nutrient.vitaminK:
      case Nutrient.vitaminB1:
      case Nutrient.vitaminB2:
      case Nutrient.vitaminPP:
      case Nutrient.vitaminB6:
      case Nutrient.vitaminB12:
      case Nutrient.calcium:
      case Nutrient.iron:
      case Nutrient.magnesium:
      case Nutrient.phosphorus:
      case Nutrient.potassium:
      case Nutrient.zinc:
      case Nutrient.copper:
      case Nutrient.manganese:
      case Nutrient.selenium:
      case Nutrient.sodium:
      case Nutrient.fluoride:
      case Nutrient.chloride:
        return 0; // Minerals will be converted to mg
      case Nutrient.bicarbonate:
        return 0.02;
      case Nutrient.cholesterol:
      default:
        return 0.0; // Default case if unit is not defined
    }
  }

// Function to return color based on nutrient amount, handling both energy kcal and kJ
  static Color getNutrientColor(String nutrientType, double value) {
    switch (nutrientType.toLowerCase().trim()) {
      case 'fat':
        if (value <= 3.0) return Colors.green; // Low fat
        if (value <= 10.25) return Colors.yellow; // First half of moderate fat
        if (value <= 17.5) return Colors.orange; // Second half of moderate fat
        return Colors.red; // High fat

      case 'saturated fat':
        if (value <= 1.5) return Colors.green; // Low saturated fat
        if (value <= 3.25)
          return Colors.yellow; // First half of moderate sat. fat
        if (value <= 5.0)
          return Colors.orange; // Second half of moderate sat. fat
        return Colors.red; // High sat. fat

      case 'sugars':
      case 'carbohydrates':
        if (value <= 5.0) return Colors.green; // Low sugar
        if (value <= 13.75)
          return Colors.yellow; // First half of moderate sugar
        if (value <= 22.5)
          return Colors.orange; // Second half of moderate sugar
        return Colors.red; // High sugar

      case 'salt':
        if (value <= 0.3) return Colors.green; // Low salt
        if (value <= 0.6) return Colors.yellow; // First half of moderate salt
        if (value <= 0.9) return Colors.orange; // Second half of moderate salt
        if (value <= 1.5) return Colors.red; // High salt
        return Colors.red[800]!; // Very high salt
      case 'proteins':
        if (value <= 2.5) return Colors.grey;
        if (value <= 5.0) return Colors.lightGreen;
        return Colors.green;
      case 'fiber':
        if (value < 3.0) return Colors.grey; // Low fiber (undesirable)
        if (value < 6.0) return Colors.green; // Moderate fiber (good)
        return Colors.green[800]!; // High fiber (excellent)

      case 'energy kcal':
        if (value <= 40) return Colors.green; // Low energy (good)
        if (value <= 120) return Colors.yellow; // First half of moderate energy
        if (value <= 200)
          return Colors.orange; // Second half of moderate energy
        return Colors.red; // High energy (high calorie)

      case 'energy kj':
        if (value <= 167) return Colors.green; // Low energy (~40 kcal)
        if (value <= 502)
          return Colors.yellow; // First half of moderate energy (~120 kcal)
        if (value <= 836)
          return Colors.orange; // Second half of moderate energy (~200 kcal)
        return Colors.red; // High energy (high calorie)

      default:
        return Colors.grey[400]!; // Default color for unknown nutrient
    }
  }

// Function to interpolate between two colors
  static Color interpolateColor(Color color1, Color color2, double fraction) {
    return Color.lerp(color1, color2, fraction)!;
  }

// Gradient-based danger color function for nutrients
  static Color getDangerGradientColor(String nutrientType, double value) {
    switch (nutrientType.toLowerCase().trim()) {
      case 'fat':
        return getGradientColor(value, 3.0, 17.5, Colors.green, Colors.red);

      case 'saturated fat':
        return getGradientColor(value, 1.5, 5.0, Colors.green, Colors.red);

      case 'sugars':
      case 'carbohydrates':
        return getGradientColor(value, 5.0, 22.5, Colors.green, Colors.red);

      case 'salt':
        return getGradientColor(value, 0.3, 1.5, Colors.green, Colors.red);

      case 'fiber':
        // Since fiber is "good" in higher amounts, we reverse the gradient
        return getGradientColor(
            value, 0, 12.0, Colors.grey[400]!, Colors.green[900]!);
      case 'proteins':
        return getGradientColor(
            value, 0, 10.0, Colors.grey[400]!, Colors.green[900]!);
      case 'energy kcal':
        return getGradientColor(value, 40, 200, Colors.green, Colors.red);

      case 'energy kj':
        return getGradientColor(value, 167, 836, Colors.green, Colors.red);

      default:
        return Colors.grey; // Default for unknown nutrients
    }
  }

  // Function to get a gradient color based on nutrient amount, using getNutrientColor logic
  static Color? getNutrientGradientColor(
      String nutrientType, double value, bool dark) {
    final Color green = (dark) ? Colors.green[700]! : Colors.green;
    final Color red = (dark) ? Colors.red[700]! : Colors.red;
    final Color grey = (dark) ? Colors.grey[700]! : Colors.grey;
    final Color yellow = (dark) ? Colors.yellow[800]! : Colors.yellow[700]!;
    final Color orange = (dark) ? Colors.orange[700]! : Colors.orange;

    switch (nutrientType.toLowerCase()) {
      case 'fat':
        return getGradientColor(value, 3.0, 17.5, green, red, yellow, orange);

      case 'saturated fat':
        return getGradientColor(value, 1.5, 5.0, green, red, yellow, orange);

      case 'carbohydrates':
      case 'sugars':
        return getGradientColor(value, 5.0, 22.5, green, red, yellow, orange);

      case 'salt':
        return getGradientColor(value, 0.3, 1.5, green, red, yellow, orange);

      case 'fiber':
        return getGradientColor(
            value, 3.0, 6.0, grey, green); // Grey to green for fiber

      case 'proteins':
        return getGradientColor(
            value, 3.0, 5.0, grey, green); // Grey to green for protein

      case 'energy kcal':
        return getGradientColor(value, 40, 200, green, red, yellow, orange);

      case 'energy kj':
        return getGradientColor(value, 167, 836, green, red, yellow, orange);

      default:
        return (dark)
            ? Colors.grey[900]!
            : Colors.grey; // Default for unknown nutrients
    }
  }

  // Helper function to compute gradient color based on value and thresholds
  static Color getGradientColor(
    double value,
    double minThreshold,
    double maxThreshold,
    Color safeColor,
    Color dangerColor, [
    Color? middleColor1,
    Color? middleColor2,
  ]) {
    if (value <= minThreshold) return safeColor; // Lower bound: safe color
    if (value >= maxThreshold) return dangerColor; // Upper bound: danger color

    // Calculate the fraction between minThreshold and maxThreshold
    double range = maxThreshold - minThreshold;
    double fraction = (value - minThreshold) / range;

    // Determine the color based on the defined middle colors
    if (middleColor1 != null && middleColor2 != null) {
      // Three intervals now exist
      if (fraction <= 0.33) {
        // Interpolate between safeColor and middleColor1
        return interpolateColor(safeColor, middleColor1,
            fraction * 3); // Multiply by 3 to stretch the fraction
      } else if (fraction <= 0.67) {
        // Interpolate between middleColor1 and middleColor2
        return interpolateColor(middleColor1, middleColor2,
            (fraction - 0.33) * 3); // Adjust fraction to range from 0 to 1
      } else {
        // Interpolate between middleColor2 and dangerColor
        return interpolateColor(middleColor2, dangerColor,
            (fraction - 0.67) * 3); // Adjust fraction to range from 0 to 1
      }
    } else {
      // No middle colors; interpolate directly between safeColor and dangerColor
      return interpolateColor(safeColor, dangerColor, fraction);
    }
  }

  @override
  String toString() {
    return """ProductHandler(
        productName: $productName, 
        ingredients: $ingredients, 
        nutrients: $nutriments, 
        packagingInfo: $packagingInfo, 
        allergens: $allergens, 
        nutriScore: $nutriScore, 
        novaGroup: $novaGroup, 
        ecoScore: $ecoScore, 
        brand: $brand, 
        quantity: $quantity, 
        categories: $categories, 
        origins: $origins, 
        additives: $additives, 
        labels: $labels, 
        servingSize: $servingSize, 
        stores: $stores, 
        countries: $countries
        imageUrl: $imageUrl
        )""";
  }
}
