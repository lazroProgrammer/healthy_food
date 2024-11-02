import 'package:drift/drift.dart';

part 'database.g.dart';

//TODO: need to add the veggies and other organic food data

//*verified 2/11/2024
class NutrientTypes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().unique().withLength(min: 1, max: 20)();
  TextColumn get unit => text().withLength(min: 1, max: 10)();
  BoolColumn get isGood => boolean()();
}

//*verified 2/11/2024
class Nutriments extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get nutrientTypeId => integer().references(NutrientTypes, #id)();
  RealColumn get value => real()();
  TextColumn get productBarcode => text().references(SavedProducts, #barcode)();
}

//*verified 2/11/2024
class SavedProducts extends Table {
  TextColumn get barcode => text().unique()();
  TextColumn get name => text().nullable()();
  TextColumn get brand => text().nullable()();
  TextColumn get ingredients => text().named("ingredients")();
  TextColumn get quantity => text().nullable()();
  TextColumn get countries => text().nullable()();
  TextColumn get categories => text().nullable()();
  IntColumn get novagrade => integer().nullable()();
  IntColumn get nutriscore => integer().nullable()();
  IntColumn get ecoscore => integer().nullable()();
  TextColumn get imageUrl => text().nullable()();
  DateTimeColumn get createdAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {barcode};
}

// class ProductAllergens extends Table {
//   TextColumn get productBarcode => text().references(SavedProducts, #barcode)();
//   IntColumn get allergenId => integer().references(Allergens, #id)();
// }

// class ProductAdditives extends Table {
//   TextColumn get productBarcode => text().references(SavedProducts, #barcode)();
//   IntColumn get additiveId => integer().references(Additives, #id)();
// }

// class Allergens extends Table {
//   IntColumn get id => integer().autoIncrement()();
//   TextColumn get name => text().withLength(min: 1, max: 50)();
// }

// class Additives extends Table {
//   IntColumn get id => integer().autoIncrement()();
//   TextColumn get name => text().withLength(min: 1, max: 50)();
// }

//*verified 2/11/2024
class MealPeriods extends Table {
  IntColumn get id => integer().autoIncrement()();

  // Use customConstraint to limit values to meal group types
  TextColumn get type => text().withLength(min: 1, max: 20).customConstraint(
      "CHECK (type IN ('Breakfast','Brunch', 'Lunch', 'Dinner', 'Evening tea', 'snack'))")();
  DateTimeColumn get startTime => dateTime()();
  DateTimeColumn get endTime => dateTime()();
}

//*verified 2/11/2024
class Meal extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime()();

  // Use customConstraint to define allowed meal types
  TextColumn get type => text().withLength(min: 1, max: 20).customConstraint(
      "CHECK (type IN ('Main dish', 'Side dish', 'Appetizer', 'Dessert', 'Drink'))")();
}

//*verified 2/11/2024
class MealToProduct extends Table {
  TextColumn get barcode => text().references(SavedProducts, #barcode)();
  IntColumn get mealId => integer().references(Meal, #id)();
  TextColumn get unit => text().withLength(max: 5)();
  RealColumn get value => real()();
}

//*verified 2/11/2024
class MealPeriodsToMeal extends Table {
  IntColumn get idMealPeriod => integer().references(MealPeriods, #id)();
  IntColumn get idMeal => integer().references(Meal, #id)();
  TextColumn get unit => text().withLength(max: 5)();
  RealColumn get value => real()();
}

//*verified 2/11/2024
class MealPeriodsToSavedProducts extends Table {
  IntColumn get idMealPeriod => integer().references(MealPeriods, #id)();
  TextColumn get productBarcode => text().references(SavedProducts, #barcode)();
  TextColumn get unit => text().withLength(max: 5)();
  RealColumn get value => real()();
}

@DriftDatabase(tables: [
  NutrientTypes,
  Nutriments,
  SavedProducts,
  Meal,
  MealPeriods,
  MealToProduct,
  MealPeriodsToMeal,
  MealPeriodsToSavedProducts,
//   Additives,
//   Allergens,
//   ProductAllergens,
//   ProductAdditives
])
class AppDatabase extends _$AppDatabase {}
