import 'package:drift/drift.dart';
import 'package:healthy_food/src/database/database.dart';

part 'meal_period_to_product.g.dart';

@DriftAccessor(tables: [MealPeriodsToSavedProducts])
class MealPeriodsToSavedProductsDao extends DatabaseAccessor<AppDatabase>
    with _$MealPeriodsToSavedProductsDaoMixin {
  final AppDatabase db;

  // Pass the AppDatabase instance to the DAO
  MealPeriodsToSavedProductsDao(this.db) : super(db);

  // Define your query functions here

  Future<List<MealPeriodsToSavedProduct>>
      getAllMealPeriodsToSavedProducts() async {
    return await db.select(db.mealPeriodsToSavedProducts).get();
  }

  Future<int> insertMealPeriodsToSavedProducts(
      MealPeriodsToSavedProductsCompanion mealPeriodsToSavedProduct) async {
    return await db
        .into(db.mealPeriodsToSavedProducts)
        .insert(mealPeriodsToSavedProduct);
  }

  Future<MealPeriodsToSavedProduct?> getMealPeriodsToSavedProductsById(
      String barcode, int mealPeriodId) async {
    return await (select(db.mealPeriodsToSavedProducts)
          ..where((tbl) =>
              tbl.productBarcode.equals(barcode) &
              tbl.idMealPeriod.equals(mealPeriodId)))
        .getSingleOrNull();
  }

  Future<List<MealPeriodsToSavedProduct>> getMealPeriodsToSavedProductsByMealId(
      int mealPeriodId) async {
    return await (select(db.mealPeriodsToSavedProducts)
          ..where((tbl) => tbl.idMealPeriod.equals(mealPeriodId)))
        .get();
  }

  Future<int> deleteMealPeriodsToSavedProductsByRelation(
      String barcode, int mealPeriodId) async {
    return await (delete(db.mealPeriodsToSavedProducts)
          ..where((tbl) =>
              tbl.productBarcode.equals(barcode) &
              tbl.idMealPeriod.equals(mealPeriodId)))
        .go();
  }

  Future<int> deleteMealPeriodsToSavedProductsById(int id) async {
    return await (delete(db.mealPeriodsToSavedProducts)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }
}
