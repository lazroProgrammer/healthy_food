import 'package:drift/drift.dart';
import 'package:healthy_food/src/database/database.dart';

part 'saved_products.g.dart';

@DriftAccessor(tables: [SavedProducts])
class SavedProductsDao extends DatabaseAccessor<AppDatabase>
    with _$SavedProductsDaoMixin {
  final AppDatabase db;

  // Pass the AppDatabase instance to the DAO
  SavedProductsDao(this.db) : super(db);

  // Define your query functions here

  Future<List<SavedProduct>> getAllMSavedProducts() async {
    return await db.select(db.savedProducts).get();
  }

  Future<int> insertMSavedProducts(SavedProductsCompanion savedProduct) async {
    return await db.into(db.savedProducts).insert(savedProduct);
  }

  Future<SavedProduct?> getMSavedProductsByBarcode(String barcode) async {
    return await (select(db.savedProducts)
          ..where((tbl) => tbl.barcode.equals(barcode)))
        .getSingleOrNull();
  }

  Future<int> deleteMSavedProductsById(String barcode) async {
    return await (delete(db.savedProducts)
          ..where((tbl) => tbl.barcode.equals(barcode)))
        .go();
  }
}
