import 'package:drift/drift.dart';
import 'package:healthy_food/src/database/database.dart';

part 'allergens_to_product.g.dart';

@DriftAccessor(tables: [ProductAllergens])
class ProductAllergensDao extends DatabaseAccessor<AppDatabase>
    with _$ProductAllergensDaoMixin {
  final AppDatabase db;

  // Pass the AppDatabase instance to the DAO
  ProductAllergensDao(this.db) : super(db);

  // Define your query functions here

  Future<List<ProductAllergen>> getAllProductAllergens() async {
    return await db.select(db.productAllergens).get();
  }

  Future<int> insertProductAllergens(ProductAllergensCompanion additive) async {
    return await db.into(db.productAllergens).insert(additive);
  }

  Future<ProductAllergen?> getProductAllergensById(
      String barcode, int allergenId) async {
    return await (select(db.productAllergens)
          ..where((tbl) =>
              tbl.productBarcode.equals(barcode) &
              tbl.allergenId.equals(allergenId)))
        .getSingleOrNull();
  }

  Future<int> deleteProductAllergensById(String barcode, int allergenId) async {
    return await (delete(db.productAllergens)
          ..where((tbl) =>
              tbl.productBarcode.equals(barcode) &
              tbl.allergenId.equals(allergenId)))
        .go();
  }
}
