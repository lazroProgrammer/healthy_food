import 'package:drift/drift.dart';
import 'package:healthy_food/src/database/database.dart';

part 'allergens.g.dart';

@DriftAccessor(tables: [Allergens])
class AllergensDao extends DatabaseAccessor<AppDatabase>
    with _$AllergensDaoMixin {
  final AppDatabase db;

  // Pass the AppDatabase instance to the DAO
  AllergensDao(this.db) : super(db);

  // Define your query functions here

  Future<List<Allergen>> getAllAllergens() async {
    return await db.select(db.allergens).get();
  }

  Future<int> insertAllergens(AllergensCompanion allergen) async {
    return await db.into(db.allergens).insert(allergen);
  }

  Future<Allergen?> getAllergensById(int id) async {
    return await (select(db.allergens)..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
  }

  Future<int> deleteAllergensById(int id) async {
    return await (delete(db.allergens)..where((tbl) => tbl.id.equals(id))).go();
  }
}
