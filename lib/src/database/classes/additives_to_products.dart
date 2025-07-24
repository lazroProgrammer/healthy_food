import 'package:drift/drift.dart';
import 'package:healthy_food/src/database/database.dart';

part 'additives_to_products.g.dart';

@DriftAccessor(tables: [ProductAdditives])
class ProductsAdditivesDao extends DatabaseAccessor<AppDatabase>
    with _$ProductsAdditivesDaoMixin {
  final AppDatabase db;

  // Pass the AppDatabase instance to the DAO
  ProductsAdditivesDao(this.db) : super(db);

  // Define your query functions here

  Future<List<ProductAdditive>> getAllProductsAdditives() async {
    return await db.select(db.productAdditives).get();
  }

  Future<int> insertProductsAdditives(
      ProductAdditivesCompanion productAdditive) async {
    return await db.into(db.productAdditives).insert(productAdditive);
  }

  Future<ProductAdditive?> getProductsAdditivesById(
      String barcode, int additiveId) async {
    return await (select(db.productAdditives)
          ..where((tbl) =>
              tbl.productBarcode.equals(barcode) &
              tbl.additiveId.equals(additiveId)))
        .getSingleOrNull();
  }

  Future<int> deleteProductsAdditivesById(
      String barcode, int additiveId) async {
    return await (delete(db.productAdditives)
          ..where((tbl) =>
              tbl.productBarcode.equals(barcode) &
              tbl.additiveId.equals(additiveId)))
        .go();
  }
}
