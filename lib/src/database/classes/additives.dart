import 'package:drift/drift.dart';
import 'package:healthy_food/src/database/database.dart';

part 'additives.g.dart';

@DriftAccessor(tables: [Additives])
class AdditivesDao extends DatabaseAccessor<AppDatabase>
    with _$AdditivesDaoMixin {
  final AppDatabase db;

  // Pass the AppDatabase instance to the DAO
  AdditivesDao(this.db) : super(db);

  // Define your query functions here

  Future<List<Additive>> getAllAdditives() async {
    return await db.select(db.additives).get();
  }

  Future<int> insertAdditives(AdditivesCompanion additive) async {
    return await db.into(db.additives).insert(additive);
  }

  Future<Additive?> getAdditivesById(int id) async {
    return await (select(db.additives)..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
  }

  Future<int> deleteAdditivesById(int id) async {
    return await (delete(db.additives)..where((tbl) => tbl.id.equals(id))).go();
  }
}
