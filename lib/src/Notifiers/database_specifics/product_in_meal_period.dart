import 'package:healthy_food/src/database/classes/meal_period_to_product.dart';
import 'package:healthy_food/src/database/database.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final productsOfPeriodsNotifier = StateNotifierProvider<
    ProductsInMealPeriodNotifier, List<MealPeriodsToSavedProduct>>((ref) {
  return ProductsInMealPeriodNotifier();
});

class ProductsInMealPeriodNotifier
    extends StateNotifier<List<MealPeriodsToSavedProduct>> {
  ProductsInMealPeriodNotifier() : super([]);
  Future<void> insert(MealPeriodsToSavedProductsCompanion p) async {
    int id = await MealPeriodsToSavedProductsDao(AppDatabase())
        .insertMealPeriodsToSavedProducts(p);
    if (id > 0) {
      state = [
        ...state,
        MealPeriodsToSavedProduct(
          id: id,
          idMealPeriod: p.idMealPeriod.value,
          productBarcode: p.productBarcode.value,
          unit: p.unit.value,
          value: p.value.value,
        ),
      ];
    }
  }

  Future<void> getByPeriodId(int periodId) async {
    state = await MealPeriodsToSavedProductsDao(AppDatabase())
        .getMealPeriodsToSavedProductsByMealId(periodId);
  }

  Future<void> deleteInstance(int id) async {
    await MealPeriodsToSavedProductsDao(AppDatabase())
        .deleteMealPeriodsToSavedProductsById(id);
    state = state.where((element) => element.id == id).toList();
  }
}
