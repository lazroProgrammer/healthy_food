import 'package:healthy_food/src/database/classes/meal_period.dart';
import 'package:healthy_food/src/database/database.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final mealPeriodsNotifier =
    StateNotifierProvider<MealPeriodNotifier, Map<int, MealPeriod>>((ref) {
  return MealPeriodNotifier();
});

class MealPeriodNotifier extends StateNotifier<Map<int, MealPeriod>> {
  MealPeriodNotifier() : super({});

  Future<void> insert(MealPeriodsCompanion p) async {
    int id = await MealPeriodsDao(AppDatabase()).insertMealPeriod(p);
    if (id > 0) {
      state = {
        ...state,
        id: MealPeriod(
          id: id,
          type: p.type.value,
          startTime: p.startTime.value,
          endTime: p.endTime.value,
        ),
      };
    }
  }

  Future<void> get() async {
    final mealPeriods = await MealPeriodsDao(AppDatabase()).getAllMealPeriods();
    state = {for (var meal in mealPeriods) meal.id: meal};
  }

  Future<void> delete(int id) async {
    await MealPeriodsDao(AppDatabase()).deleteMealPeriodById(id);
    final newState = Map<int, MealPeriod>.from(state);
    newState.remove(id);
    state = newState;
  }
}
