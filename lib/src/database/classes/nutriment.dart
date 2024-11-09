import 'package:drift/drift.dart';
import 'package:healthy_food/src/database/database.dart';

part 'nutriment.g.dart';

@DriftAccessor(tables: [Nutriments, NutrientTypes])
class NutrimentsDao extends DatabaseAccessor<AppDatabase>
    with _$NutrimentsDaoMixin {
  final AppDatabase db;

  // Pass the AppDatabase instance to the DAO
  NutrimentsDao(this.db) : super(db);

  // Define your query functions here
  Future<int> insertNutrientTypeIfNotExists(NutrientTypesCompanion nt) async {
    final existingType = await (select(nutrientTypes)
          ..where((t) => t.name.equals(nt.name.value)))
        .getSingleOrNull();

    if (existingType != null) {
      return existingType.id; // Return existing ID if found
    }

    // Insert new nutrient type and return its ID
    return await into(nutrientTypes).insert(
      nt,
    );
  }

  Future<int> insertNutriments(
      String productBarcode, double value, NutrientTypesCompanion nType) async {
    int nutrientTypeId = await insertNutrientTypeIfNotExists(nType);
    return await into(nutriments).insert(NutrimentsCompanion.insert(
        nutrientTypeId: nutrientTypeId,
        value: value,
        productBarcode: productBarcode));
  }

  Future<List<Nutriment>> getAllNutriments() async {
    return await db.select(db.nutriments).get();
  }

  Future<Nutriment?> getNutrimentsById(int id) async {
    return await (select(db.nutriments)..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
  }

  Future<int> deleteNutrimentsById(int id) async {
    return await (delete(db.nutriments)..where((tbl) => tbl.id.equals(id)))
        .go();
  }
}
