import 'dart:async';

import 'package:healthy_food/src/data%20classes/open_food_pub/nutriment.dart';
import 'package:logger/logger.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

//TODO: vitamins needs to be converted to micrograms
class ProductHandler {
  static Logger log = Logger();
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

  static Future<ProductHandler> fetchProductDataByCode(String barcode) async {
    try {
      ProductHandler p = ProductHandler();
      ProductResultV3 result = await OpenFoodAPIClient.getProductV3(
          ProductQueryConfiguration(barcode, version: ProductQueryVersion.v3));

      p.barcode = result.product?.barcode;
      p.productName = result.product?.productName;
      p.ingredients = result.product?.ingredientsText;
      // nutrients = result.product?.nutriments;
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
    } catch (e) {
      log.e('Error fetching product data: $e');
      throw Exception();
    }
  }

  static Future<SearchResult> searchProducts({
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
        // Nutriments information
      ],
      parametersList: [
        if (name != null) SearchTerms(terms: [name]),
        for (var i in categories)
          TagFilter.fromType(
              tagFilterType: TagFilterType.CATEGORIES,
              tagName: i), // Search by product name
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
        if (country != null) SearchTerms(terms: [country]), // Search by country
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
    p.allergens = product.allergens?.names;
    p.nutriScore = product.nutriscore;
    p.novaGroup = product.novaGroup;
    p.ecoScore = product.ecoscoreGrade;
    p.brand = product.brands;
    p.quantity = product.quantity;
    p.categories = product.categories;
    p.origins = product.origins;
    p.additives = product.additives?.names;
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
      {String? name, required List<String> categories}) async {
    final responce = await searchProducts(name: name, categories: categories);
    final result = retrieveProducts(responce);
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
          if (_isMineralInGrams(nutrient)) {
            value = (value * 1000); // Convert to mg
          }

          nutrimentList.add(NutrimentHandler(
              label: _getNutrientLabel(nutrient), // Get appropriate label
              unit: _getNutrientUnit(nutrient), // Get appropriate unit
              value: value.toStringAsFixed(2),
              isGood: _IsGoodNutrient(nutrient),
              conversionRate: conversionRate(nutrient)));
        }
      }
    }

    return nutrimentList;
  }

// Helper function to check if the nutrient is a mineral and in grams
  static bool _isMineralInGrams(Nutrient nutrient) {
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
      case Nutrient.cholesterol:
        return 'mg';
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
