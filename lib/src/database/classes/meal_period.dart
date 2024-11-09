import 'package:drift/drift.dart';
import 'package:healthy_food/src/database/database.dart';

part 'meal_period.g.dart';

@DriftAccessor(tables: [MealPeriods])
class MealPeriodsDao extends DatabaseAccessor<AppDatabase>
    with _$MealPeriodsDaoMixin {
  final AppDatabase db;

  // Pass the AppDatabase instance to the DAO
  MealPeriodsDao(this.db) : super(db);

  // Define your query functions here

  Future<List<MealPeriod>> getAllMealPeriods() async {
    return await db.select(db.mealPeriods).get();
  }

  Future<int> insertMealPeriod(MealPeriodsCompanion mealPeriod) async {
    return await db.into(db.mealPeriods).insert(mealPeriod);
  }

  Future<MealPeriod?> getMealPeriodById(int id) async {
    return await (select(db.mealPeriods)..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
  }

  Future<int> deleteMealPeriodById(int id) async {
    return await (delete(db.mealPeriods)..where((tbl) => tbl.id.equals(id)))
        .go();
  }
}
