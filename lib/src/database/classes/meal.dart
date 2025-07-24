import 'package:drift/drift.dart';
import 'package:healthy_food/src/database/database.dart';

part 'meal.g.dart';

@DriftAccessor(tables: [Meal])
class MealDao extends DatabaseAccessor<AppDatabase> with _$MealDaoMixin {
  final AppDatabase db;

  // Pass the AppDatabase instance to the DAO
  MealDao(this.db) : super(db);

  // Define your query functions here

  Future<List<MealData>> getAllMeals() async {
    return await db.select(db.meal).get();
  }

  Future<int> insertMeals(MealCompanion meal) async {
    return await db.into(db.meal).insert(meal);
  }

  Future<MealData?> getMealsById(int id) async {
    return await (select(db.meal)..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
  }

  Future<int> deleteMealsById(int id) async {
    return await (delete(db.meal)..where((tbl) => tbl.id.equals(id))).go();
  }
}
