import 'package:drift/drift.dart';
import 'package:healthy_food/src/database/database.dart';

part 'meal_to_product.g.dart';

@DriftAccessor(tables: [MealToProduct, Meal, SavedProducts])
class MealToProductsDao extends DatabaseAccessor<AppDatabase>
    with _$MealToProductsDaoMixin {
  final AppDatabase db;

  MealToProductsDao(this.db) : super(db);

  // Insert a meal period - product relationship
  Future<int> insertMealToProduct(MealToProductCompanion entry) {
    return into(db.mealToProduct).insert(entry);
  }

  // Get all products associated with a specific meal period
  Future<List<SavedProduct>> getProductsForMeal(int mealId) {
    return (select(db.savedProducts)
          ..where((product) => existsQuery(select(db.mealToProduct)
            ..where((mealToProduct) =>
                mealToProduct.mealId.equals(mealId) &
                mealToProduct.productBarcode.equalsExp(product.barcode)))))
        .get();
  }

  //? Get all meal periods associated with a specific product
  //? will be implemented later
  Future<List<MealData>> getMealForProduct(String barcode) {
    return (select(db.meal)
          ..where((meal) => existsQuery(select(db.mealToProduct)
            ..where((mealToProduct) =>
                mealToProduct.productBarcode.equals(barcode) &
                mealToProduct.mealId.equalsExp(meal.id)))))
        .get();
  }

  // Remove a specific meal - product relationship
  Future<int> deleteMealProductRelation(int mealId, String barcode) {
    return (delete(db.mealToProduct)
          ..where((tbl) =>
              tbl.mealId.equals(mealId) & tbl.productBarcode.equals(barcode)))
        .go();
  }
}
