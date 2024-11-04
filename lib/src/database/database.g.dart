// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $NutrientTypesTable extends NutrientTypes
    with TableInfo<$NutrientTypesTable, NutrientType> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NutrientTypesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
      'unit', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 10),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _isGoodMeta = const VerificationMeta('isGood');
  @override
  late final GeneratedColumn<bool> isGood = GeneratedColumn<bool>(
      'is_good', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_good" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [id, name, unit, isGood];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'nutrient_types';
  @override
  VerificationContext validateIntegrity(Insertable<NutrientType> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('unit')) {
      context.handle(
          _unitMeta, unit.isAcceptableOrUnknown(data['unit']!, _unitMeta));
    } else if (isInserting) {
      context.missing(_unitMeta);
    }
    if (data.containsKey('is_good')) {
      context.handle(_isGoodMeta,
          isGood.isAcceptableOrUnknown(data['is_good']!, _isGoodMeta));
    } else if (isInserting) {
      context.missing(_isGoodMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NutrientType map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NutrientType(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      unit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}unit'])!,
      isGood: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_good'])!,
    );
  }

  @override
  $NutrientTypesTable createAlias(String alias) {
    return $NutrientTypesTable(attachedDatabase, alias);
  }
}

class NutrientType extends DataClass implements Insertable<NutrientType> {
  final int id;
  final String name;
  final String unit;
  final bool isGood;
  const NutrientType(
      {required this.id,
      required this.name,
      required this.unit,
      required this.isGood});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['unit'] = Variable<String>(unit);
    map['is_good'] = Variable<bool>(isGood);
    return map;
  }

  NutrientTypesCompanion toCompanion(bool nullToAbsent) {
    return NutrientTypesCompanion(
      id: Value(id),
      name: Value(name),
      unit: Value(unit),
      isGood: Value(isGood),
    );
  }

  factory NutrientType.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NutrientType(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      unit: serializer.fromJson<String>(json['unit']),
      isGood: serializer.fromJson<bool>(json['isGood']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'unit': serializer.toJson<String>(unit),
      'isGood': serializer.toJson<bool>(isGood),
    };
  }

  NutrientType copyWith({int? id, String? name, String? unit, bool? isGood}) =>
      NutrientType(
        id: id ?? this.id,
        name: name ?? this.name,
        unit: unit ?? this.unit,
        isGood: isGood ?? this.isGood,
      );
  NutrientType copyWithCompanion(NutrientTypesCompanion data) {
    return NutrientType(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      unit: data.unit.present ? data.unit.value : this.unit,
      isGood: data.isGood.present ? data.isGood.value : this.isGood,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NutrientType(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('unit: $unit, ')
          ..write('isGood: $isGood')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, unit, isGood);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NutrientType &&
          other.id == this.id &&
          other.name == this.name &&
          other.unit == this.unit &&
          other.isGood == this.isGood);
}

class NutrientTypesCompanion extends UpdateCompanion<NutrientType> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> unit;
  final Value<bool> isGood;
  const NutrientTypesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.unit = const Value.absent(),
    this.isGood = const Value.absent(),
  });
  NutrientTypesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String unit,
    required bool isGood,
  })  : name = Value(name),
        unit = Value(unit),
        isGood = Value(isGood);
  static Insertable<NutrientType> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? unit,
    Expression<bool>? isGood,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (unit != null) 'unit': unit,
      if (isGood != null) 'is_good': isGood,
    });
  }

  NutrientTypesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? unit,
      Value<bool>? isGood}) {
    return NutrientTypesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      unit: unit ?? this.unit,
      isGood: isGood ?? this.isGood,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (isGood.present) {
      map['is_good'] = Variable<bool>(isGood.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NutrientTypesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('unit: $unit, ')
          ..write('isGood: $isGood')
          ..write(')'))
        .toString();
  }
}

class $SavedProductsTable extends SavedProducts
    with TableInfo<$SavedProductsTable, SavedProduct> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SavedProductsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _barcodeMeta =
      const VerificationMeta('barcode');
  @override
  late final GeneratedColumn<String> barcode = GeneratedColumn<String>(
      'barcode', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _brandMeta = const VerificationMeta('brand');
  @override
  late final GeneratedColumn<String> brand = GeneratedColumn<String>(
      'brand', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _ingredientsMeta =
      const VerificationMeta('ingredients');
  @override
  late final GeneratedColumn<String> ingredients = GeneratedColumn<String>(
      'ingredients', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<String> quantity = GeneratedColumn<String>(
      'quantity', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _countriesMeta =
      const VerificationMeta('countries');
  @override
  late final GeneratedColumn<String> countries = GeneratedColumn<String>(
      'countries', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _categoriesMeta =
      const VerificationMeta('categories');
  @override
  late final GeneratedColumn<String> categories = GeneratedColumn<String>(
      'categories', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _novagradeMeta =
      const VerificationMeta('novagrade');
  @override
  late final GeneratedColumn<int> novagrade = GeneratedColumn<int>(
      'novagrade', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _nutriscoreMeta =
      const VerificationMeta('nutriscore');
  @override
  late final GeneratedColumn<int> nutriscore = GeneratedColumn<int>(
      'nutriscore', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _ecoscoreMeta =
      const VerificationMeta('ecoscore');
  @override
  late final GeneratedColumn<int> ecoscore = GeneratedColumn<int>(
      'ecoscore', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _imageUrlMeta =
      const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        barcode,
        name,
        brand,
        ingredients,
        quantity,
        countries,
        categories,
        novagrade,
        nutriscore,
        ecoscore,
        imageUrl,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'saved_products';
  @override
  VerificationContext validateIntegrity(Insertable<SavedProduct> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('barcode')) {
      context.handle(_barcodeMeta,
          barcode.isAcceptableOrUnknown(data['barcode']!, _barcodeMeta));
    } else if (isInserting) {
      context.missing(_barcodeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('brand')) {
      context.handle(
          _brandMeta, brand.isAcceptableOrUnknown(data['brand']!, _brandMeta));
    }
    if (data.containsKey('ingredients')) {
      context.handle(
          _ingredientsMeta,
          ingredients.isAcceptableOrUnknown(
              data['ingredients']!, _ingredientsMeta));
    } else if (isInserting) {
      context.missing(_ingredientsMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    }
    if (data.containsKey('countries')) {
      context.handle(_countriesMeta,
          countries.isAcceptableOrUnknown(data['countries']!, _countriesMeta));
    }
    if (data.containsKey('categories')) {
      context.handle(
          _categoriesMeta,
          categories.isAcceptableOrUnknown(
              data['categories']!, _categoriesMeta));
    }
    if (data.containsKey('novagrade')) {
      context.handle(_novagradeMeta,
          novagrade.isAcceptableOrUnknown(data['novagrade']!, _novagradeMeta));
    } else if (isInserting) {
      context.missing(_novagradeMeta);
    }
    if (data.containsKey('nutriscore')) {
      context.handle(
          _nutriscoreMeta,
          nutriscore.isAcceptableOrUnknown(
              data['nutriscore']!, _nutriscoreMeta));
    } else if (isInserting) {
      context.missing(_nutriscoreMeta);
    }
    if (data.containsKey('ecoscore')) {
      context.handle(_ecoscoreMeta,
          ecoscore.isAcceptableOrUnknown(data['ecoscore']!, _ecoscoreMeta));
    } else if (isInserting) {
      context.missing(_ecoscoreMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {barcode};
  @override
  SavedProduct map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SavedProduct(
      barcode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}barcode'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
      brand: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}brand']),
      ingredients: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ingredients'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}quantity']),
      countries: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}countries']),
      categories: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}categories']),
      novagrade: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}novagrade'])!,
      nutriscore: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}nutriscore'])!,
      ecoscore: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ecoscore'])!,
      imageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_url']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $SavedProductsTable createAlias(String alias) {
    return $SavedProductsTable(attachedDatabase, alias);
  }
}

class SavedProduct extends DataClass implements Insertable<SavedProduct> {
  final String barcode;
  final String? name;
  final String? brand;
  final String ingredients;
  final String? quantity;
  final String? countries;
  final String? categories;
  final int novagrade;
  final int nutriscore;
  final int ecoscore;
  final String? imageUrl;
  final DateTime createdAt;
  const SavedProduct(
      {required this.barcode,
      this.name,
      this.brand,
      required this.ingredients,
      this.quantity,
      this.countries,
      this.categories,
      required this.novagrade,
      required this.nutriscore,
      required this.ecoscore,
      this.imageUrl,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['barcode'] = Variable<String>(barcode);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || brand != null) {
      map['brand'] = Variable<String>(brand);
    }
    map['ingredients'] = Variable<String>(ingredients);
    if (!nullToAbsent || quantity != null) {
      map['quantity'] = Variable<String>(quantity);
    }
    if (!nullToAbsent || countries != null) {
      map['countries'] = Variable<String>(countries);
    }
    if (!nullToAbsent || categories != null) {
      map['categories'] = Variable<String>(categories);
    }
    map['novagrade'] = Variable<int>(novagrade);
    map['nutriscore'] = Variable<int>(nutriscore);
    map['ecoscore'] = Variable<int>(ecoscore);
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  SavedProductsCompanion toCompanion(bool nullToAbsent) {
    return SavedProductsCompanion(
      barcode: Value(barcode),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      brand:
          brand == null && nullToAbsent ? const Value.absent() : Value(brand),
      ingredients: Value(ingredients),
      quantity: quantity == null && nullToAbsent
          ? const Value.absent()
          : Value(quantity),
      countries: countries == null && nullToAbsent
          ? const Value.absent()
          : Value(countries),
      categories: categories == null && nullToAbsent
          ? const Value.absent()
          : Value(categories),
      novagrade: Value(novagrade),
      nutriscore: Value(nutriscore),
      ecoscore: Value(ecoscore),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
      createdAt: Value(createdAt),
    );
  }

  factory SavedProduct.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SavedProduct(
      barcode: serializer.fromJson<String>(json['barcode']),
      name: serializer.fromJson<String?>(json['name']),
      brand: serializer.fromJson<String?>(json['brand']),
      ingredients: serializer.fromJson<String>(json['ingredients']),
      quantity: serializer.fromJson<String?>(json['quantity']),
      countries: serializer.fromJson<String?>(json['countries']),
      categories: serializer.fromJson<String?>(json['categories']),
      novagrade: serializer.fromJson<int>(json['novagrade']),
      nutriscore: serializer.fromJson<int>(json['nutriscore']),
      ecoscore: serializer.fromJson<int>(json['ecoscore']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'barcode': serializer.toJson<String>(barcode),
      'name': serializer.toJson<String?>(name),
      'brand': serializer.toJson<String?>(brand),
      'ingredients': serializer.toJson<String>(ingredients),
      'quantity': serializer.toJson<String?>(quantity),
      'countries': serializer.toJson<String?>(countries),
      'categories': serializer.toJson<String?>(categories),
      'novagrade': serializer.toJson<int>(novagrade),
      'nutriscore': serializer.toJson<int>(nutriscore),
      'ecoscore': serializer.toJson<int>(ecoscore),
      'imageUrl': serializer.toJson<String?>(imageUrl),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  SavedProduct copyWith(
          {String? barcode,
          Value<String?> name = const Value.absent(),
          Value<String?> brand = const Value.absent(),
          String? ingredients,
          Value<String?> quantity = const Value.absent(),
          Value<String?> countries = const Value.absent(),
          Value<String?> categories = const Value.absent(),
          int? novagrade,
          int? nutriscore,
          int? ecoscore,
          Value<String?> imageUrl = const Value.absent(),
          DateTime? createdAt}) =>
      SavedProduct(
        barcode: barcode ?? this.barcode,
        name: name.present ? name.value : this.name,
        brand: brand.present ? brand.value : this.brand,
        ingredients: ingredients ?? this.ingredients,
        quantity: quantity.present ? quantity.value : this.quantity,
        countries: countries.present ? countries.value : this.countries,
        categories: categories.present ? categories.value : this.categories,
        novagrade: novagrade ?? this.novagrade,
        nutriscore: nutriscore ?? this.nutriscore,
        ecoscore: ecoscore ?? this.ecoscore,
        imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
        createdAt: createdAt ?? this.createdAt,
      );
  SavedProduct copyWithCompanion(SavedProductsCompanion data) {
    return SavedProduct(
      barcode: data.barcode.present ? data.barcode.value : this.barcode,
      name: data.name.present ? data.name.value : this.name,
      brand: data.brand.present ? data.brand.value : this.brand,
      ingredients:
          data.ingredients.present ? data.ingredients.value : this.ingredients,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      countries: data.countries.present ? data.countries.value : this.countries,
      categories:
          data.categories.present ? data.categories.value : this.categories,
      novagrade: data.novagrade.present ? data.novagrade.value : this.novagrade,
      nutriscore:
          data.nutriscore.present ? data.nutriscore.value : this.nutriscore,
      ecoscore: data.ecoscore.present ? data.ecoscore.value : this.ecoscore,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SavedProduct(')
          ..write('barcode: $barcode, ')
          ..write('name: $name, ')
          ..write('brand: $brand, ')
          ..write('ingredients: $ingredients, ')
          ..write('quantity: $quantity, ')
          ..write('countries: $countries, ')
          ..write('categories: $categories, ')
          ..write('novagrade: $novagrade, ')
          ..write('nutriscore: $nutriscore, ')
          ..write('ecoscore: $ecoscore, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      barcode,
      name,
      brand,
      ingredients,
      quantity,
      countries,
      categories,
      novagrade,
      nutriscore,
      ecoscore,
      imageUrl,
      createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SavedProduct &&
          other.barcode == this.barcode &&
          other.name == this.name &&
          other.brand == this.brand &&
          other.ingredients == this.ingredients &&
          other.quantity == this.quantity &&
          other.countries == this.countries &&
          other.categories == this.categories &&
          other.novagrade == this.novagrade &&
          other.nutriscore == this.nutriscore &&
          other.ecoscore == this.ecoscore &&
          other.imageUrl == this.imageUrl &&
          other.createdAt == this.createdAt);
}

class SavedProductsCompanion extends UpdateCompanion<SavedProduct> {
  final Value<String> barcode;
  final Value<String?> name;
  final Value<String?> brand;
  final Value<String> ingredients;
  final Value<String?> quantity;
  final Value<String?> countries;
  final Value<String?> categories;
  final Value<int> novagrade;
  final Value<int> nutriscore;
  final Value<int> ecoscore;
  final Value<String?> imageUrl;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const SavedProductsCompanion({
    this.barcode = const Value.absent(),
    this.name = const Value.absent(),
    this.brand = const Value.absent(),
    this.ingredients = const Value.absent(),
    this.quantity = const Value.absent(),
    this.countries = const Value.absent(),
    this.categories = const Value.absent(),
    this.novagrade = const Value.absent(),
    this.nutriscore = const Value.absent(),
    this.ecoscore = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SavedProductsCompanion.insert({
    required String barcode,
    this.name = const Value.absent(),
    this.brand = const Value.absent(),
    required String ingredients,
    this.quantity = const Value.absent(),
    this.countries = const Value.absent(),
    this.categories = const Value.absent(),
    required int novagrade,
    required int nutriscore,
    required int ecoscore,
    this.imageUrl = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  })  : barcode = Value(barcode),
        ingredients = Value(ingredients),
        novagrade = Value(novagrade),
        nutriscore = Value(nutriscore),
        ecoscore = Value(ecoscore),
        createdAt = Value(createdAt);
  static Insertable<SavedProduct> custom({
    Expression<String>? barcode,
    Expression<String>? name,
    Expression<String>? brand,
    Expression<String>? ingredients,
    Expression<String>? quantity,
    Expression<String>? countries,
    Expression<String>? categories,
    Expression<int>? novagrade,
    Expression<int>? nutriscore,
    Expression<int>? ecoscore,
    Expression<String>? imageUrl,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (barcode != null) 'barcode': barcode,
      if (name != null) 'name': name,
      if (brand != null) 'brand': brand,
      if (ingredients != null) 'ingredients': ingredients,
      if (quantity != null) 'quantity': quantity,
      if (countries != null) 'countries': countries,
      if (categories != null) 'categories': categories,
      if (novagrade != null) 'novagrade': novagrade,
      if (nutriscore != null) 'nutriscore': nutriscore,
      if (ecoscore != null) 'ecoscore': ecoscore,
      if (imageUrl != null) 'image_url': imageUrl,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SavedProductsCompanion copyWith(
      {Value<String>? barcode,
      Value<String?>? name,
      Value<String?>? brand,
      Value<String>? ingredients,
      Value<String?>? quantity,
      Value<String?>? countries,
      Value<String?>? categories,
      Value<int>? novagrade,
      Value<int>? nutriscore,
      Value<int>? ecoscore,
      Value<String?>? imageUrl,
      Value<DateTime>? createdAt,
      Value<int>? rowid}) {
    return SavedProductsCompanion(
      barcode: barcode ?? this.barcode,
      name: name ?? this.name,
      brand: brand ?? this.brand,
      ingredients: ingredients ?? this.ingredients,
      quantity: quantity ?? this.quantity,
      countries: countries ?? this.countries,
      categories: categories ?? this.categories,
      novagrade: novagrade ?? this.novagrade,
      nutriscore: nutriscore ?? this.nutriscore,
      ecoscore: ecoscore ?? this.ecoscore,
      imageUrl: imageUrl ?? this.imageUrl,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (barcode.present) {
      map['barcode'] = Variable<String>(barcode.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (brand.present) {
      map['brand'] = Variable<String>(brand.value);
    }
    if (ingredients.present) {
      map['ingredients'] = Variable<String>(ingredients.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<String>(quantity.value);
    }
    if (countries.present) {
      map['countries'] = Variable<String>(countries.value);
    }
    if (categories.present) {
      map['categories'] = Variable<String>(categories.value);
    }
    if (novagrade.present) {
      map['novagrade'] = Variable<int>(novagrade.value);
    }
    if (nutriscore.present) {
      map['nutriscore'] = Variable<int>(nutriscore.value);
    }
    if (ecoscore.present) {
      map['ecoscore'] = Variable<int>(ecoscore.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SavedProductsCompanion(')
          ..write('barcode: $barcode, ')
          ..write('name: $name, ')
          ..write('brand: $brand, ')
          ..write('ingredients: $ingredients, ')
          ..write('quantity: $quantity, ')
          ..write('countries: $countries, ')
          ..write('categories: $categories, ')
          ..write('novagrade: $novagrade, ')
          ..write('nutriscore: $nutriscore, ')
          ..write('ecoscore: $ecoscore, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $NutrimentsTable extends Nutriments
    with TableInfo<$NutrimentsTable, Nutriment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NutrimentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nutrientTypeIdMeta =
      const VerificationMeta('nutrientTypeId');
  @override
  late final GeneratedColumn<int> nutrientTypeId = GeneratedColumn<int>(
      'nutrient_type_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES nutrient_types (id)'));
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<double> value = GeneratedColumn<double>(
      'value', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _productBarcodeMeta =
      const VerificationMeta('productBarcode');
  @override
  late final GeneratedColumn<String> productBarcode = GeneratedColumn<String>(
      'product_barcode', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES saved_products (barcode)'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, nutrientTypeId, value, productBarcode];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'nutriments';
  @override
  VerificationContext validateIntegrity(Insertable<Nutriment> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nutrient_type_id')) {
      context.handle(
          _nutrientTypeIdMeta,
          nutrientTypeId.isAcceptableOrUnknown(
              data['nutrient_type_id']!, _nutrientTypeIdMeta));
    } else if (isInserting) {
      context.missing(_nutrientTypeIdMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('product_barcode')) {
      context.handle(
          _productBarcodeMeta,
          productBarcode.isAcceptableOrUnknown(
              data['product_barcode']!, _productBarcodeMeta));
    } else if (isInserting) {
      context.missing(_productBarcodeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Nutriment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Nutriment(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      nutrientTypeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}nutrient_type_id'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}value'])!,
      productBarcode: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}product_barcode'])!,
    );
  }

  @override
  $NutrimentsTable createAlias(String alias) {
    return $NutrimentsTable(attachedDatabase, alias);
  }
}

class Nutriment extends DataClass implements Insertable<Nutriment> {
  final int id;
  final int nutrientTypeId;
  final double value;
  final String productBarcode;
  const Nutriment(
      {required this.id,
      required this.nutrientTypeId,
      required this.value,
      required this.productBarcode});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nutrient_type_id'] = Variable<int>(nutrientTypeId);
    map['value'] = Variable<double>(value);
    map['product_barcode'] = Variable<String>(productBarcode);
    return map;
  }

  NutrimentsCompanion toCompanion(bool nullToAbsent) {
    return NutrimentsCompanion(
      id: Value(id),
      nutrientTypeId: Value(nutrientTypeId),
      value: Value(value),
      productBarcode: Value(productBarcode),
    );
  }

  factory Nutriment.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Nutriment(
      id: serializer.fromJson<int>(json['id']),
      nutrientTypeId: serializer.fromJson<int>(json['nutrientTypeId']),
      value: serializer.fromJson<double>(json['value']),
      productBarcode: serializer.fromJson<String>(json['productBarcode']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nutrientTypeId': serializer.toJson<int>(nutrientTypeId),
      'value': serializer.toJson<double>(value),
      'productBarcode': serializer.toJson<String>(productBarcode),
    };
  }

  Nutriment copyWith(
          {int? id,
          int? nutrientTypeId,
          double? value,
          String? productBarcode}) =>
      Nutriment(
        id: id ?? this.id,
        nutrientTypeId: nutrientTypeId ?? this.nutrientTypeId,
        value: value ?? this.value,
        productBarcode: productBarcode ?? this.productBarcode,
      );
  Nutriment copyWithCompanion(NutrimentsCompanion data) {
    return Nutriment(
      id: data.id.present ? data.id.value : this.id,
      nutrientTypeId: data.nutrientTypeId.present
          ? data.nutrientTypeId.value
          : this.nutrientTypeId,
      value: data.value.present ? data.value.value : this.value,
      productBarcode: data.productBarcode.present
          ? data.productBarcode.value
          : this.productBarcode,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Nutriment(')
          ..write('id: $id, ')
          ..write('nutrientTypeId: $nutrientTypeId, ')
          ..write('value: $value, ')
          ..write('productBarcode: $productBarcode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nutrientTypeId, value, productBarcode);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Nutriment &&
          other.id == this.id &&
          other.nutrientTypeId == this.nutrientTypeId &&
          other.value == this.value &&
          other.productBarcode == this.productBarcode);
}

class NutrimentsCompanion extends UpdateCompanion<Nutriment> {
  final Value<int> id;
  final Value<int> nutrientTypeId;
  final Value<double> value;
  final Value<String> productBarcode;
  const NutrimentsCompanion({
    this.id = const Value.absent(),
    this.nutrientTypeId = const Value.absent(),
    this.value = const Value.absent(),
    this.productBarcode = const Value.absent(),
  });
  NutrimentsCompanion.insert({
    this.id = const Value.absent(),
    required int nutrientTypeId,
    required double value,
    required String productBarcode,
  })  : nutrientTypeId = Value(nutrientTypeId),
        value = Value(value),
        productBarcode = Value(productBarcode);
  static Insertable<Nutriment> custom({
    Expression<int>? id,
    Expression<int>? nutrientTypeId,
    Expression<double>? value,
    Expression<String>? productBarcode,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nutrientTypeId != null) 'nutrient_type_id': nutrientTypeId,
      if (value != null) 'value': value,
      if (productBarcode != null) 'product_barcode': productBarcode,
    });
  }

  NutrimentsCompanion copyWith(
      {Value<int>? id,
      Value<int>? nutrientTypeId,
      Value<double>? value,
      Value<String>? productBarcode}) {
    return NutrimentsCompanion(
      id: id ?? this.id,
      nutrientTypeId: nutrientTypeId ?? this.nutrientTypeId,
      value: value ?? this.value,
      productBarcode: productBarcode ?? this.productBarcode,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nutrientTypeId.present) {
      map['nutrient_type_id'] = Variable<int>(nutrientTypeId.value);
    }
    if (value.present) {
      map['value'] = Variable<double>(value.value);
    }
    if (productBarcode.present) {
      map['product_barcode'] = Variable<String>(productBarcode.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NutrimentsCompanion(')
          ..write('id: $id, ')
          ..write('nutrientTypeId: $nutrientTypeId, ')
          ..write('value: $value, ')
          ..write('productBarcode: $productBarcode')
          ..write(')'))
        .toString();
  }
}

class $MealTable extends Meal with TableInfo<$MealTable, MealData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MealTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, date, type];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'meal';
  @override
  VerificationContext validateIntegrity(Insertable<MealData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MealData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MealData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
    );
  }

  @override
  $MealTable createAlias(String alias) {
    return $MealTable(attachedDatabase, alias);
  }
}

class MealData extends DataClass implements Insertable<MealData> {
  final int id;
  final DateTime date;
  final String type;
  const MealData({required this.id, required this.date, required this.type});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<DateTime>(date);
    map['type'] = Variable<String>(type);
    return map;
  }

  MealCompanion toCompanion(bool nullToAbsent) {
    return MealCompanion(
      id: Value(id),
      date: Value(date),
      type: Value(type),
    );
  }

  factory MealData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MealData(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      type: serializer.fromJson<String>(json['type']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'type': serializer.toJson<String>(type),
    };
  }

  MealData copyWith({int? id, DateTime? date, String? type}) => MealData(
        id: id ?? this.id,
        date: date ?? this.date,
        type: type ?? this.type,
      );
  MealData copyWithCompanion(MealCompanion data) {
    return MealData(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      type: data.type.present ? data.type.value : this.type,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MealData(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, date, type);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MealData &&
          other.id == this.id &&
          other.date == this.date &&
          other.type == this.type);
}

class MealCompanion extends UpdateCompanion<MealData> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<String> type;
  const MealCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.type = const Value.absent(),
  });
  MealCompanion.insert({
    this.id = const Value.absent(),
    required DateTime date,
    required String type,
  })  : date = Value(date),
        type = Value(type);
  static Insertable<MealData> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<String>? type,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (type != null) 'type': type,
    });
  }

  MealCompanion copyWith(
      {Value<int>? id, Value<DateTime>? date, Value<String>? type}) {
    return MealCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      type: type ?? this.type,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MealCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }
}

class $MealPeriodsTable extends MealPeriods
    with TableInfo<$MealPeriodsTable, MealPeriod> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MealPeriodsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _startTimeMeta =
      const VerificationMeta('startTime');
  @override
  late final GeneratedColumn<DateTime> startTime = GeneratedColumn<DateTime>(
      'start_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _endTimeMeta =
      const VerificationMeta('endTime');
  @override
  late final GeneratedColumn<DateTime> endTime = GeneratedColumn<DateTime>(
      'end_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, type, startTime, endTime];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'meal_periods';
  @override
  VerificationContext validateIntegrity(Insertable<MealPeriod> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('start_time')) {
      context.handle(_startTimeMeta,
          startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta));
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('end_time')) {
      context.handle(_endTimeMeta,
          endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta));
    } else if (isInserting) {
      context.missing(_endTimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MealPeriod map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MealPeriod(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      startTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_time'])!,
      endTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_time'])!,
    );
  }

  @override
  $MealPeriodsTable createAlias(String alias) {
    return $MealPeriodsTable(attachedDatabase, alias);
  }
}

class MealPeriod extends DataClass implements Insertable<MealPeriod> {
  final int id;
  final String type;
  final DateTime startTime;
  final DateTime endTime;
  const MealPeriod(
      {required this.id,
      required this.type,
      required this.startTime,
      required this.endTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['type'] = Variable<String>(type);
    map['start_time'] = Variable<DateTime>(startTime);
    map['end_time'] = Variable<DateTime>(endTime);
    return map;
  }

  MealPeriodsCompanion toCompanion(bool nullToAbsent) {
    return MealPeriodsCompanion(
      id: Value(id),
      type: Value(type),
      startTime: Value(startTime),
      endTime: Value(endTime),
    );
  }

  factory MealPeriod.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MealPeriod(
      id: serializer.fromJson<int>(json['id']),
      type: serializer.fromJson<String>(json['type']),
      startTime: serializer.fromJson<DateTime>(json['startTime']),
      endTime: serializer.fromJson<DateTime>(json['endTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'type': serializer.toJson<String>(type),
      'startTime': serializer.toJson<DateTime>(startTime),
      'endTime': serializer.toJson<DateTime>(endTime),
    };
  }

  MealPeriod copyWith(
          {int? id, String? type, DateTime? startTime, DateTime? endTime}) =>
      MealPeriod(
        id: id ?? this.id,
        type: type ?? this.type,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
      );
  MealPeriod copyWithCompanion(MealPeriodsCompanion data) {
    return MealPeriod(
      id: data.id.present ? data.id.value : this.id,
      type: data.type.present ? data.type.value : this.type,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      endTime: data.endTime.present ? data.endTime.value : this.endTime,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MealPeriod(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, type, startTime, endTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MealPeriod &&
          other.id == this.id &&
          other.type == this.type &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime);
}

class MealPeriodsCompanion extends UpdateCompanion<MealPeriod> {
  final Value<int> id;
  final Value<String> type;
  final Value<DateTime> startTime;
  final Value<DateTime> endTime;
  const MealPeriodsCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
  });
  MealPeriodsCompanion.insert({
    this.id = const Value.absent(),
    required String type,
    required DateTime startTime,
    required DateTime endTime,
  })  : type = Value(type),
        startTime = Value(startTime),
        endTime = Value(endTime);
  static Insertable<MealPeriod> custom({
    Expression<int>? id,
    Expression<String>? type,
    Expression<DateTime>? startTime,
    Expression<DateTime>? endTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
    });
  }

  MealPeriodsCompanion copyWith(
      {Value<int>? id,
      Value<String>? type,
      Value<DateTime>? startTime,
      Value<DateTime>? endTime}) {
    return MealPeriodsCompanion(
      id: id ?? this.id,
      type: type ?? this.type,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<DateTime>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<DateTime>(endTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MealPeriodsCompanion(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime')
          ..write(')'))
        .toString();
  }
}

class $MealToProductTable extends MealToProduct
    with TableInfo<$MealToProductTable, MealToProductData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MealToProductTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _barcodeMeta =
      const VerificationMeta('barcode');
  @override
  late final GeneratedColumn<String> barcode = GeneratedColumn<String>(
      'barcode', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES saved_products (barcode)'));
  static const VerificationMeta _mealIdMeta = const VerificationMeta('mealId');
  @override
  late final GeneratedColumn<int> mealId = GeneratedColumn<int>(
      'meal_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES meal (id)'));
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
      'unit', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 5),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<double> value = GeneratedColumn<double>(
      'value', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [barcode, mealId, unit, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'meal_to_product';
  @override
  VerificationContext validateIntegrity(Insertable<MealToProductData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('barcode')) {
      context.handle(_barcodeMeta,
          barcode.isAcceptableOrUnknown(data['barcode']!, _barcodeMeta));
    } else if (isInserting) {
      context.missing(_barcodeMeta);
    }
    if (data.containsKey('meal_id')) {
      context.handle(_mealIdMeta,
          mealId.isAcceptableOrUnknown(data['meal_id']!, _mealIdMeta));
    } else if (isInserting) {
      context.missing(_mealIdMeta);
    }
    if (data.containsKey('unit')) {
      context.handle(
          _unitMeta, unit.isAcceptableOrUnknown(data['unit']!, _unitMeta));
    } else if (isInserting) {
      context.missing(_unitMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  MealToProductData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MealToProductData(
      barcode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}barcode'])!,
      mealId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}meal_id'])!,
      unit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}unit'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}value'])!,
    );
  }

  @override
  $MealToProductTable createAlias(String alias) {
    return $MealToProductTable(attachedDatabase, alias);
  }
}

class MealToProductData extends DataClass
    implements Insertable<MealToProductData> {
  final String barcode;
  final int mealId;
  final String unit;
  final double value;
  const MealToProductData(
      {required this.barcode,
      required this.mealId,
      required this.unit,
      required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['barcode'] = Variable<String>(barcode);
    map['meal_id'] = Variable<int>(mealId);
    map['unit'] = Variable<String>(unit);
    map['value'] = Variable<double>(value);
    return map;
  }

  MealToProductCompanion toCompanion(bool nullToAbsent) {
    return MealToProductCompanion(
      barcode: Value(barcode),
      mealId: Value(mealId),
      unit: Value(unit),
      value: Value(value),
    );
  }

  factory MealToProductData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MealToProductData(
      barcode: serializer.fromJson<String>(json['barcode']),
      mealId: serializer.fromJson<int>(json['mealId']),
      unit: serializer.fromJson<String>(json['unit']),
      value: serializer.fromJson<double>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'barcode': serializer.toJson<String>(barcode),
      'mealId': serializer.toJson<int>(mealId),
      'unit': serializer.toJson<String>(unit),
      'value': serializer.toJson<double>(value),
    };
  }

  MealToProductData copyWith(
          {String? barcode, int? mealId, String? unit, double? value}) =>
      MealToProductData(
        barcode: barcode ?? this.barcode,
        mealId: mealId ?? this.mealId,
        unit: unit ?? this.unit,
        value: value ?? this.value,
      );
  MealToProductData copyWithCompanion(MealToProductCompanion data) {
    return MealToProductData(
      barcode: data.barcode.present ? data.barcode.value : this.barcode,
      mealId: data.mealId.present ? data.mealId.value : this.mealId,
      unit: data.unit.present ? data.unit.value : this.unit,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MealToProductData(')
          ..write('barcode: $barcode, ')
          ..write('mealId: $mealId, ')
          ..write('unit: $unit, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(barcode, mealId, unit, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MealToProductData &&
          other.barcode == this.barcode &&
          other.mealId == this.mealId &&
          other.unit == this.unit &&
          other.value == this.value);
}

class MealToProductCompanion extends UpdateCompanion<MealToProductData> {
  final Value<String> barcode;
  final Value<int> mealId;
  final Value<String> unit;
  final Value<double> value;
  final Value<int> rowid;
  const MealToProductCompanion({
    this.barcode = const Value.absent(),
    this.mealId = const Value.absent(),
    this.unit = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MealToProductCompanion.insert({
    required String barcode,
    required int mealId,
    required String unit,
    required double value,
    this.rowid = const Value.absent(),
  })  : barcode = Value(barcode),
        mealId = Value(mealId),
        unit = Value(unit),
        value = Value(value);
  static Insertable<MealToProductData> custom({
    Expression<String>? barcode,
    Expression<int>? mealId,
    Expression<String>? unit,
    Expression<double>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (barcode != null) 'barcode': barcode,
      if (mealId != null) 'meal_id': mealId,
      if (unit != null) 'unit': unit,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MealToProductCompanion copyWith(
      {Value<String>? barcode,
      Value<int>? mealId,
      Value<String>? unit,
      Value<double>? value,
      Value<int>? rowid}) {
    return MealToProductCompanion(
      barcode: barcode ?? this.barcode,
      mealId: mealId ?? this.mealId,
      unit: unit ?? this.unit,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (barcode.present) {
      map['barcode'] = Variable<String>(barcode.value);
    }
    if (mealId.present) {
      map['meal_id'] = Variable<int>(mealId.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (value.present) {
      map['value'] = Variable<double>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MealToProductCompanion(')
          ..write('barcode: $barcode, ')
          ..write('mealId: $mealId, ')
          ..write('unit: $unit, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MealPeriodsToMealTable extends MealPeriodsToMeal
    with TableInfo<$MealPeriodsToMealTable, MealPeriodsToMealData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MealPeriodsToMealTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMealPeriodMeta =
      const VerificationMeta('idMealPeriod');
  @override
  late final GeneratedColumn<int> idMealPeriod = GeneratedColumn<int>(
      'id_meal_period', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES meal_periods (id)'));
  static const VerificationMeta _idMealMeta = const VerificationMeta('idMeal');
  @override
  late final GeneratedColumn<int> idMeal = GeneratedColumn<int>(
      'id_meal', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES meal (id)'));
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
      'unit', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 5),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<double> value = GeneratedColumn<double>(
      'value', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [idMealPeriod, idMeal, unit, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'meal_periods_to_meal';
  @override
  VerificationContext validateIntegrity(
      Insertable<MealPeriodsToMealData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_meal_period')) {
      context.handle(
          _idMealPeriodMeta,
          idMealPeriod.isAcceptableOrUnknown(
              data['id_meal_period']!, _idMealPeriodMeta));
    } else if (isInserting) {
      context.missing(_idMealPeriodMeta);
    }
    if (data.containsKey('id_meal')) {
      context.handle(_idMealMeta,
          idMeal.isAcceptableOrUnknown(data['id_meal']!, _idMealMeta));
    } else if (isInserting) {
      context.missing(_idMealMeta);
    }
    if (data.containsKey('unit')) {
      context.handle(
          _unitMeta, unit.isAcceptableOrUnknown(data['unit']!, _unitMeta));
    } else if (isInserting) {
      context.missing(_unitMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  MealPeriodsToMealData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MealPeriodsToMealData(
      idMealPeriod: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_meal_period'])!,
      idMeal: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_meal'])!,
      unit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}unit'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}value'])!,
    );
  }

  @override
  $MealPeriodsToMealTable createAlias(String alias) {
    return $MealPeriodsToMealTable(attachedDatabase, alias);
  }
}

class MealPeriodsToMealData extends DataClass
    implements Insertable<MealPeriodsToMealData> {
  final int idMealPeriod;
  final int idMeal;
  final String unit;
  final double value;
  const MealPeriodsToMealData(
      {required this.idMealPeriod,
      required this.idMeal,
      required this.unit,
      required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_meal_period'] = Variable<int>(idMealPeriod);
    map['id_meal'] = Variable<int>(idMeal);
    map['unit'] = Variable<String>(unit);
    map['value'] = Variable<double>(value);
    return map;
  }

  MealPeriodsToMealCompanion toCompanion(bool nullToAbsent) {
    return MealPeriodsToMealCompanion(
      idMealPeriod: Value(idMealPeriod),
      idMeal: Value(idMeal),
      unit: Value(unit),
      value: Value(value),
    );
  }

  factory MealPeriodsToMealData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MealPeriodsToMealData(
      idMealPeriod: serializer.fromJson<int>(json['idMealPeriod']),
      idMeal: serializer.fromJson<int>(json['idMeal']),
      unit: serializer.fromJson<String>(json['unit']),
      value: serializer.fromJson<double>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idMealPeriod': serializer.toJson<int>(idMealPeriod),
      'idMeal': serializer.toJson<int>(idMeal),
      'unit': serializer.toJson<String>(unit),
      'value': serializer.toJson<double>(value),
    };
  }

  MealPeriodsToMealData copyWith(
          {int? idMealPeriod, int? idMeal, String? unit, double? value}) =>
      MealPeriodsToMealData(
        idMealPeriod: idMealPeriod ?? this.idMealPeriod,
        idMeal: idMeal ?? this.idMeal,
        unit: unit ?? this.unit,
        value: value ?? this.value,
      );
  MealPeriodsToMealData copyWithCompanion(MealPeriodsToMealCompanion data) {
    return MealPeriodsToMealData(
      idMealPeriod: data.idMealPeriod.present
          ? data.idMealPeriod.value
          : this.idMealPeriod,
      idMeal: data.idMeal.present ? data.idMeal.value : this.idMeal,
      unit: data.unit.present ? data.unit.value : this.unit,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MealPeriodsToMealData(')
          ..write('idMealPeriod: $idMealPeriod, ')
          ..write('idMeal: $idMeal, ')
          ..write('unit: $unit, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idMealPeriod, idMeal, unit, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MealPeriodsToMealData &&
          other.idMealPeriod == this.idMealPeriod &&
          other.idMeal == this.idMeal &&
          other.unit == this.unit &&
          other.value == this.value);
}

class MealPeriodsToMealCompanion
    extends UpdateCompanion<MealPeriodsToMealData> {
  final Value<int> idMealPeriod;
  final Value<int> idMeal;
  final Value<String> unit;
  final Value<double> value;
  final Value<int> rowid;
  const MealPeriodsToMealCompanion({
    this.idMealPeriod = const Value.absent(),
    this.idMeal = const Value.absent(),
    this.unit = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MealPeriodsToMealCompanion.insert({
    required int idMealPeriod,
    required int idMeal,
    required String unit,
    required double value,
    this.rowid = const Value.absent(),
  })  : idMealPeriod = Value(idMealPeriod),
        idMeal = Value(idMeal),
        unit = Value(unit),
        value = Value(value);
  static Insertable<MealPeriodsToMealData> custom({
    Expression<int>? idMealPeriod,
    Expression<int>? idMeal,
    Expression<String>? unit,
    Expression<double>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (idMealPeriod != null) 'id_meal_period': idMealPeriod,
      if (idMeal != null) 'id_meal': idMeal,
      if (unit != null) 'unit': unit,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MealPeriodsToMealCompanion copyWith(
      {Value<int>? idMealPeriod,
      Value<int>? idMeal,
      Value<String>? unit,
      Value<double>? value,
      Value<int>? rowid}) {
    return MealPeriodsToMealCompanion(
      idMealPeriod: idMealPeriod ?? this.idMealPeriod,
      idMeal: idMeal ?? this.idMeal,
      unit: unit ?? this.unit,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idMealPeriod.present) {
      map['id_meal_period'] = Variable<int>(idMealPeriod.value);
    }
    if (idMeal.present) {
      map['id_meal'] = Variable<int>(idMeal.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (value.present) {
      map['value'] = Variable<double>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MealPeriodsToMealCompanion(')
          ..write('idMealPeriod: $idMealPeriod, ')
          ..write('idMeal: $idMeal, ')
          ..write('unit: $unit, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MealPeriodsToSavedProductsTable extends MealPeriodsToSavedProducts
    with
        TableInfo<$MealPeriodsToSavedProductsTable, MealPeriodsToSavedProduct> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MealPeriodsToSavedProductsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMealPeriodMeta =
      const VerificationMeta('idMealPeriod');
  @override
  late final GeneratedColumn<int> idMealPeriod = GeneratedColumn<int>(
      'id_meal_period', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES meal_periods (id)'));
  static const VerificationMeta _productBarcodeMeta =
      const VerificationMeta('productBarcode');
  @override
  late final GeneratedColumn<String> productBarcode = GeneratedColumn<String>(
      'product_barcode', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES saved_products (barcode)'));
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
      'unit', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 5),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<double> value = GeneratedColumn<double>(
      'value', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [idMealPeriod, productBarcode, unit, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'meal_periods_to_saved_products';
  @override
  VerificationContext validateIntegrity(
      Insertable<MealPeriodsToSavedProduct> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_meal_period')) {
      context.handle(
          _idMealPeriodMeta,
          idMealPeriod.isAcceptableOrUnknown(
              data['id_meal_period']!, _idMealPeriodMeta));
    } else if (isInserting) {
      context.missing(_idMealPeriodMeta);
    }
    if (data.containsKey('product_barcode')) {
      context.handle(
          _productBarcodeMeta,
          productBarcode.isAcceptableOrUnknown(
              data['product_barcode']!, _productBarcodeMeta));
    } else if (isInserting) {
      context.missing(_productBarcodeMeta);
    }
    if (data.containsKey('unit')) {
      context.handle(
          _unitMeta, unit.isAcceptableOrUnknown(data['unit']!, _unitMeta));
    } else if (isInserting) {
      context.missing(_unitMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  MealPeriodsToSavedProduct map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MealPeriodsToSavedProduct(
      idMealPeriod: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_meal_period'])!,
      productBarcode: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}product_barcode'])!,
      unit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}unit'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}value'])!,
    );
  }

  @override
  $MealPeriodsToSavedProductsTable createAlias(String alias) {
    return $MealPeriodsToSavedProductsTable(attachedDatabase, alias);
  }
}

class MealPeriodsToSavedProduct extends DataClass
    implements Insertable<MealPeriodsToSavedProduct> {
  final int idMealPeriod;
  final String productBarcode;
  final String unit;
  final double value;
  const MealPeriodsToSavedProduct(
      {required this.idMealPeriod,
      required this.productBarcode,
      required this.unit,
      required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_meal_period'] = Variable<int>(idMealPeriod);
    map['product_barcode'] = Variable<String>(productBarcode);
    map['unit'] = Variable<String>(unit);
    map['value'] = Variable<double>(value);
    return map;
  }

  MealPeriodsToSavedProductsCompanion toCompanion(bool nullToAbsent) {
    return MealPeriodsToSavedProductsCompanion(
      idMealPeriod: Value(idMealPeriod),
      productBarcode: Value(productBarcode),
      unit: Value(unit),
      value: Value(value),
    );
  }

  factory MealPeriodsToSavedProduct.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MealPeriodsToSavedProduct(
      idMealPeriod: serializer.fromJson<int>(json['idMealPeriod']),
      productBarcode: serializer.fromJson<String>(json['productBarcode']),
      unit: serializer.fromJson<String>(json['unit']),
      value: serializer.fromJson<double>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idMealPeriod': serializer.toJson<int>(idMealPeriod),
      'productBarcode': serializer.toJson<String>(productBarcode),
      'unit': serializer.toJson<String>(unit),
      'value': serializer.toJson<double>(value),
    };
  }

  MealPeriodsToSavedProduct copyWith(
          {int? idMealPeriod,
          String? productBarcode,
          String? unit,
          double? value}) =>
      MealPeriodsToSavedProduct(
        idMealPeriod: idMealPeriod ?? this.idMealPeriod,
        productBarcode: productBarcode ?? this.productBarcode,
        unit: unit ?? this.unit,
        value: value ?? this.value,
      );
  MealPeriodsToSavedProduct copyWithCompanion(
      MealPeriodsToSavedProductsCompanion data) {
    return MealPeriodsToSavedProduct(
      idMealPeriod: data.idMealPeriod.present
          ? data.idMealPeriod.value
          : this.idMealPeriod,
      productBarcode: data.productBarcode.present
          ? data.productBarcode.value
          : this.productBarcode,
      unit: data.unit.present ? data.unit.value : this.unit,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MealPeriodsToSavedProduct(')
          ..write('idMealPeriod: $idMealPeriod, ')
          ..write('productBarcode: $productBarcode, ')
          ..write('unit: $unit, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idMealPeriod, productBarcode, unit, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MealPeriodsToSavedProduct &&
          other.idMealPeriod == this.idMealPeriod &&
          other.productBarcode == this.productBarcode &&
          other.unit == this.unit &&
          other.value == this.value);
}

class MealPeriodsToSavedProductsCompanion
    extends UpdateCompanion<MealPeriodsToSavedProduct> {
  final Value<int> idMealPeriod;
  final Value<String> productBarcode;
  final Value<String> unit;
  final Value<double> value;
  final Value<int> rowid;
  const MealPeriodsToSavedProductsCompanion({
    this.idMealPeriod = const Value.absent(),
    this.productBarcode = const Value.absent(),
    this.unit = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MealPeriodsToSavedProductsCompanion.insert({
    required int idMealPeriod,
    required String productBarcode,
    required String unit,
    required double value,
    this.rowid = const Value.absent(),
  })  : idMealPeriod = Value(idMealPeriod),
        productBarcode = Value(productBarcode),
        unit = Value(unit),
        value = Value(value);
  static Insertable<MealPeriodsToSavedProduct> custom({
    Expression<int>? idMealPeriod,
    Expression<String>? productBarcode,
    Expression<String>? unit,
    Expression<double>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (idMealPeriod != null) 'id_meal_period': idMealPeriod,
      if (productBarcode != null) 'product_barcode': productBarcode,
      if (unit != null) 'unit': unit,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MealPeriodsToSavedProductsCompanion copyWith(
      {Value<int>? idMealPeriod,
      Value<String>? productBarcode,
      Value<String>? unit,
      Value<double>? value,
      Value<int>? rowid}) {
    return MealPeriodsToSavedProductsCompanion(
      idMealPeriod: idMealPeriod ?? this.idMealPeriod,
      productBarcode: productBarcode ?? this.productBarcode,
      unit: unit ?? this.unit,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idMealPeriod.present) {
      map['id_meal_period'] = Variable<int>(idMealPeriod.value);
    }
    if (productBarcode.present) {
      map['product_barcode'] = Variable<String>(productBarcode.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (value.present) {
      map['value'] = Variable<double>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MealPeriodsToSavedProductsCompanion(')
          ..write('idMealPeriod: $idMealPeriod, ')
          ..write('productBarcode: $productBarcode, ')
          ..write('unit: $unit, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AdditivesTable extends Additives
    with TableInfo<$AdditivesTable, Additive> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AdditivesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'additives';
  @override
  VerificationContext validateIntegrity(Insertable<Additive> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Additive map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Additive(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $AdditivesTable createAlias(String alias) {
    return $AdditivesTable(attachedDatabase, alias);
  }
}

class Additive extends DataClass implements Insertable<Additive> {
  final int id;
  final String name;
  const Additive({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  AdditivesCompanion toCompanion(bool nullToAbsent) {
    return AdditivesCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory Additive.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Additive(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  Additive copyWith({int? id, String? name}) => Additive(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  Additive copyWithCompanion(AdditivesCompanion data) {
    return Additive(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Additive(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Additive && other.id == this.id && other.name == this.name);
}

class AdditivesCompanion extends UpdateCompanion<Additive> {
  final Value<int> id;
  final Value<String> name;
  const AdditivesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  AdditivesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<Additive> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  AdditivesCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return AdditivesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AdditivesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $AllergensTable extends Allergens
    with TableInfo<$AllergensTable, Allergen> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AllergensTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'allergens';
  @override
  VerificationContext validateIntegrity(Insertable<Allergen> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Allergen map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Allergen(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $AllergensTable createAlias(String alias) {
    return $AllergensTable(attachedDatabase, alias);
  }
}

class Allergen extends DataClass implements Insertable<Allergen> {
  final int id;
  final String name;
  const Allergen({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  AllergensCompanion toCompanion(bool nullToAbsent) {
    return AllergensCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory Allergen.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Allergen(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  Allergen copyWith({int? id, String? name}) => Allergen(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  Allergen copyWithCompanion(AllergensCompanion data) {
    return Allergen(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Allergen(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Allergen && other.id == this.id && other.name == this.name);
}

class AllergensCompanion extends UpdateCompanion<Allergen> {
  final Value<int> id;
  final Value<String> name;
  const AllergensCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  AllergensCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<Allergen> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  AllergensCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return AllergensCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AllergensCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $ProductAllergensTable extends ProductAllergens
    with TableInfo<$ProductAllergensTable, ProductAllergen> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductAllergensTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _productBarcodeMeta =
      const VerificationMeta('productBarcode');
  @override
  late final GeneratedColumn<String> productBarcode = GeneratedColumn<String>(
      'product_barcode', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES saved_products (barcode)'));
  static const VerificationMeta _allergenIdMeta =
      const VerificationMeta('allergenId');
  @override
  late final GeneratedColumn<int> allergenId = GeneratedColumn<int>(
      'allergen_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES allergens (id)'));
  @override
  List<GeneratedColumn> get $columns => [productBarcode, allergenId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_allergens';
  @override
  VerificationContext validateIntegrity(Insertable<ProductAllergen> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('product_barcode')) {
      context.handle(
          _productBarcodeMeta,
          productBarcode.isAcceptableOrUnknown(
              data['product_barcode']!, _productBarcodeMeta));
    } else if (isInserting) {
      context.missing(_productBarcodeMeta);
    }
    if (data.containsKey('allergen_id')) {
      context.handle(
          _allergenIdMeta,
          allergenId.isAcceptableOrUnknown(
              data['allergen_id']!, _allergenIdMeta));
    } else if (isInserting) {
      context.missing(_allergenIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  ProductAllergen map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductAllergen(
      productBarcode: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}product_barcode'])!,
      allergenId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}allergen_id'])!,
    );
  }

  @override
  $ProductAllergensTable createAlias(String alias) {
    return $ProductAllergensTable(attachedDatabase, alias);
  }
}

class ProductAllergen extends DataClass implements Insertable<ProductAllergen> {
  final String productBarcode;
  final int allergenId;
  const ProductAllergen(
      {required this.productBarcode, required this.allergenId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['product_barcode'] = Variable<String>(productBarcode);
    map['allergen_id'] = Variable<int>(allergenId);
    return map;
  }

  ProductAllergensCompanion toCompanion(bool nullToAbsent) {
    return ProductAllergensCompanion(
      productBarcode: Value(productBarcode),
      allergenId: Value(allergenId),
    );
  }

  factory ProductAllergen.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductAllergen(
      productBarcode: serializer.fromJson<String>(json['productBarcode']),
      allergenId: serializer.fromJson<int>(json['allergenId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'productBarcode': serializer.toJson<String>(productBarcode),
      'allergenId': serializer.toJson<int>(allergenId),
    };
  }

  ProductAllergen copyWith({String? productBarcode, int? allergenId}) =>
      ProductAllergen(
        productBarcode: productBarcode ?? this.productBarcode,
        allergenId: allergenId ?? this.allergenId,
      );
  ProductAllergen copyWithCompanion(ProductAllergensCompanion data) {
    return ProductAllergen(
      productBarcode: data.productBarcode.present
          ? data.productBarcode.value
          : this.productBarcode,
      allergenId:
          data.allergenId.present ? data.allergenId.value : this.allergenId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductAllergen(')
          ..write('productBarcode: $productBarcode, ')
          ..write('allergenId: $allergenId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(productBarcode, allergenId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductAllergen &&
          other.productBarcode == this.productBarcode &&
          other.allergenId == this.allergenId);
}

class ProductAllergensCompanion extends UpdateCompanion<ProductAllergen> {
  final Value<String> productBarcode;
  final Value<int> allergenId;
  final Value<int> rowid;
  const ProductAllergensCompanion({
    this.productBarcode = const Value.absent(),
    this.allergenId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductAllergensCompanion.insert({
    required String productBarcode,
    required int allergenId,
    this.rowid = const Value.absent(),
  })  : productBarcode = Value(productBarcode),
        allergenId = Value(allergenId);
  static Insertable<ProductAllergen> custom({
    Expression<String>? productBarcode,
    Expression<int>? allergenId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (productBarcode != null) 'product_barcode': productBarcode,
      if (allergenId != null) 'allergen_id': allergenId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductAllergensCompanion copyWith(
      {Value<String>? productBarcode,
      Value<int>? allergenId,
      Value<int>? rowid}) {
    return ProductAllergensCompanion(
      productBarcode: productBarcode ?? this.productBarcode,
      allergenId: allergenId ?? this.allergenId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (productBarcode.present) {
      map['product_barcode'] = Variable<String>(productBarcode.value);
    }
    if (allergenId.present) {
      map['allergen_id'] = Variable<int>(allergenId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductAllergensCompanion(')
          ..write('productBarcode: $productBarcode, ')
          ..write('allergenId: $allergenId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProductAdditivesTable extends ProductAdditives
    with TableInfo<$ProductAdditivesTable, ProductAdditive> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductAdditivesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _productBarcodeMeta =
      const VerificationMeta('productBarcode');
  @override
  late final GeneratedColumn<String> productBarcode = GeneratedColumn<String>(
      'product_barcode', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES saved_products (barcode)'));
  static const VerificationMeta _additiveIdMeta =
      const VerificationMeta('additiveId');
  @override
  late final GeneratedColumn<int> additiveId = GeneratedColumn<int>(
      'additive_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES additives (id)'));
  @override
  List<GeneratedColumn> get $columns => [productBarcode, additiveId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_additives';
  @override
  VerificationContext validateIntegrity(Insertable<ProductAdditive> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('product_barcode')) {
      context.handle(
          _productBarcodeMeta,
          productBarcode.isAcceptableOrUnknown(
              data['product_barcode']!, _productBarcodeMeta));
    } else if (isInserting) {
      context.missing(_productBarcodeMeta);
    }
    if (data.containsKey('additive_id')) {
      context.handle(
          _additiveIdMeta,
          additiveId.isAcceptableOrUnknown(
              data['additive_id']!, _additiveIdMeta));
    } else if (isInserting) {
      context.missing(_additiveIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  ProductAdditive map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductAdditive(
      productBarcode: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}product_barcode'])!,
      additiveId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}additive_id'])!,
    );
  }

  @override
  $ProductAdditivesTable createAlias(String alias) {
    return $ProductAdditivesTable(attachedDatabase, alias);
  }
}

class ProductAdditive extends DataClass implements Insertable<ProductAdditive> {
  final String productBarcode;
  final int additiveId;
  const ProductAdditive(
      {required this.productBarcode, required this.additiveId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['product_barcode'] = Variable<String>(productBarcode);
    map['additive_id'] = Variable<int>(additiveId);
    return map;
  }

  ProductAdditivesCompanion toCompanion(bool nullToAbsent) {
    return ProductAdditivesCompanion(
      productBarcode: Value(productBarcode),
      additiveId: Value(additiveId),
    );
  }

  factory ProductAdditive.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductAdditive(
      productBarcode: serializer.fromJson<String>(json['productBarcode']),
      additiveId: serializer.fromJson<int>(json['additiveId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'productBarcode': serializer.toJson<String>(productBarcode),
      'additiveId': serializer.toJson<int>(additiveId),
    };
  }

  ProductAdditive copyWith({String? productBarcode, int? additiveId}) =>
      ProductAdditive(
        productBarcode: productBarcode ?? this.productBarcode,
        additiveId: additiveId ?? this.additiveId,
      );
  ProductAdditive copyWithCompanion(ProductAdditivesCompanion data) {
    return ProductAdditive(
      productBarcode: data.productBarcode.present
          ? data.productBarcode.value
          : this.productBarcode,
      additiveId:
          data.additiveId.present ? data.additiveId.value : this.additiveId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductAdditive(')
          ..write('productBarcode: $productBarcode, ')
          ..write('additiveId: $additiveId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(productBarcode, additiveId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductAdditive &&
          other.productBarcode == this.productBarcode &&
          other.additiveId == this.additiveId);
}

class ProductAdditivesCompanion extends UpdateCompanion<ProductAdditive> {
  final Value<String> productBarcode;
  final Value<int> additiveId;
  final Value<int> rowid;
  const ProductAdditivesCompanion({
    this.productBarcode = const Value.absent(),
    this.additiveId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductAdditivesCompanion.insert({
    required String productBarcode,
    required int additiveId,
    this.rowid = const Value.absent(),
  })  : productBarcode = Value(productBarcode),
        additiveId = Value(additiveId);
  static Insertable<ProductAdditive> custom({
    Expression<String>? productBarcode,
    Expression<int>? additiveId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (productBarcode != null) 'product_barcode': productBarcode,
      if (additiveId != null) 'additive_id': additiveId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductAdditivesCompanion copyWith(
      {Value<String>? productBarcode,
      Value<int>? additiveId,
      Value<int>? rowid}) {
    return ProductAdditivesCompanion(
      productBarcode: productBarcode ?? this.productBarcode,
      additiveId: additiveId ?? this.additiveId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (productBarcode.present) {
      map['product_barcode'] = Variable<String>(productBarcode.value);
    }
    if (additiveId.present) {
      map['additive_id'] = Variable<int>(additiveId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductAdditivesCompanion(')
          ..write('productBarcode: $productBarcode, ')
          ..write('additiveId: $additiveId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $NutrientTypesTable nutrientTypes = $NutrientTypesTable(this);
  late final $SavedProductsTable savedProducts = $SavedProductsTable(this);
  late final $NutrimentsTable nutriments = $NutrimentsTable(this);
  late final $MealTable meal = $MealTable(this);
  late final $MealPeriodsTable mealPeriods = $MealPeriodsTable(this);
  late final $MealToProductTable mealToProduct = $MealToProductTable(this);
  late final $MealPeriodsToMealTable mealPeriodsToMeal =
      $MealPeriodsToMealTable(this);
  late final $MealPeriodsToSavedProductsTable mealPeriodsToSavedProducts =
      $MealPeriodsToSavedProductsTable(this);
  late final $AdditivesTable additives = $AdditivesTable(this);
  late final $AllergensTable allergens = $AllergensTable(this);
  late final $ProductAllergensTable productAllergens =
      $ProductAllergensTable(this);
  late final $ProductAdditivesTable productAdditives =
      $ProductAdditivesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        nutrientTypes,
        savedProducts,
        nutriments,
        meal,
        mealPeriods,
        mealToProduct,
        mealPeriodsToMeal,
        mealPeriodsToSavedProducts,
        additives,
        allergens,
        productAllergens,
        productAdditives
      ];
}

typedef $$NutrientTypesTableCreateCompanionBuilder = NutrientTypesCompanion
    Function({
  Value<int> id,
  required String name,
  required String unit,
  required bool isGood,
});
typedef $$NutrientTypesTableUpdateCompanionBuilder = NutrientTypesCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<String> unit,
  Value<bool> isGood,
});

final class $$NutrientTypesTableReferences
    extends BaseReferences<_$AppDatabase, $NutrientTypesTable, NutrientType> {
  $$NutrientTypesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$NutrimentsTable, List<Nutriment>>
      _nutrimentsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.nutriments,
              aliasName: $_aliasNameGenerator(
                  db.nutrientTypes.id, db.nutriments.nutrientTypeId));

  $$NutrimentsTableProcessedTableManager get nutrimentsRefs {
    final manager = $$NutrimentsTableTableManager($_db, $_db.nutriments)
        .filter((f) => f.nutrientTypeId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_nutrimentsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$NutrientTypesTableFilterComposer
    extends Composer<_$AppDatabase, $NutrientTypesTable> {
  $$NutrientTypesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get unit => $composableBuilder(
      column: $table.unit, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isGood => $composableBuilder(
      column: $table.isGood, builder: (column) => ColumnFilters(column));

  Expression<bool> nutrimentsRefs(
      Expression<bool> Function($$NutrimentsTableFilterComposer f) f) {
    final $$NutrimentsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.nutriments,
        getReferencedColumn: (t) => t.nutrientTypeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$NutrimentsTableFilterComposer(
              $db: $db,
              $table: $db.nutriments,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$NutrientTypesTableOrderingComposer
    extends Composer<_$AppDatabase, $NutrientTypesTable> {
  $$NutrientTypesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get unit => $composableBuilder(
      column: $table.unit, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isGood => $composableBuilder(
      column: $table.isGood, builder: (column) => ColumnOrderings(column));
}

class $$NutrientTypesTableAnnotationComposer
    extends Composer<_$AppDatabase, $NutrientTypesTable> {
  $$NutrientTypesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<bool> get isGood =>
      $composableBuilder(column: $table.isGood, builder: (column) => column);

  Expression<T> nutrimentsRefs<T extends Object>(
      Expression<T> Function($$NutrimentsTableAnnotationComposer a) f) {
    final $$NutrimentsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.nutriments,
        getReferencedColumn: (t) => t.nutrientTypeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$NutrimentsTableAnnotationComposer(
              $db: $db,
              $table: $db.nutriments,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$NutrientTypesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $NutrientTypesTable,
    NutrientType,
    $$NutrientTypesTableFilterComposer,
    $$NutrientTypesTableOrderingComposer,
    $$NutrientTypesTableAnnotationComposer,
    $$NutrientTypesTableCreateCompanionBuilder,
    $$NutrientTypesTableUpdateCompanionBuilder,
    (NutrientType, $$NutrientTypesTableReferences),
    NutrientType,
    PrefetchHooks Function({bool nutrimentsRefs})> {
  $$NutrientTypesTableTableManager(_$AppDatabase db, $NutrientTypesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NutrientTypesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NutrientTypesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NutrientTypesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> unit = const Value.absent(),
            Value<bool> isGood = const Value.absent(),
          }) =>
              NutrientTypesCompanion(
            id: id,
            name: name,
            unit: unit,
            isGood: isGood,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String unit,
            required bool isGood,
          }) =>
              NutrientTypesCompanion.insert(
            id: id,
            name: name,
            unit: unit,
            isGood: isGood,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$NutrientTypesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({nutrimentsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (nutrimentsRefs) db.nutriments],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (nutrimentsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$NutrientTypesTableReferences
                            ._nutrimentsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$NutrientTypesTableReferences(db, table, p0)
                                .nutrimentsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.nutrientTypeId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$NutrientTypesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $NutrientTypesTable,
    NutrientType,
    $$NutrientTypesTableFilterComposer,
    $$NutrientTypesTableOrderingComposer,
    $$NutrientTypesTableAnnotationComposer,
    $$NutrientTypesTableCreateCompanionBuilder,
    $$NutrientTypesTableUpdateCompanionBuilder,
    (NutrientType, $$NutrientTypesTableReferences),
    NutrientType,
    PrefetchHooks Function({bool nutrimentsRefs})>;
typedef $$SavedProductsTableCreateCompanionBuilder = SavedProductsCompanion
    Function({
  required String barcode,
  Value<String?> name,
  Value<String?> brand,
  required String ingredients,
  Value<String?> quantity,
  Value<String?> countries,
  Value<String?> categories,
  required int novagrade,
  required int nutriscore,
  required int ecoscore,
  Value<String?> imageUrl,
  required DateTime createdAt,
  Value<int> rowid,
});
typedef $$SavedProductsTableUpdateCompanionBuilder = SavedProductsCompanion
    Function({
  Value<String> barcode,
  Value<String?> name,
  Value<String?> brand,
  Value<String> ingredients,
  Value<String?> quantity,
  Value<String?> countries,
  Value<String?> categories,
  Value<int> novagrade,
  Value<int> nutriscore,
  Value<int> ecoscore,
  Value<String?> imageUrl,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

final class $$SavedProductsTableReferences
    extends BaseReferences<_$AppDatabase, $SavedProductsTable, SavedProduct> {
  $$SavedProductsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$NutrimentsTable, List<Nutriment>>
      _nutrimentsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.nutriments,
              aliasName: $_aliasNameGenerator(
                  db.savedProducts.barcode, db.nutriments.productBarcode));

  $$NutrimentsTableProcessedTableManager get nutrimentsRefs {
    final manager = $$NutrimentsTableTableManager($_db, $_db.nutriments)
        .filter((f) => f.productBarcode.barcode($_item.barcode));

    final cache = $_typedResult.readTableOrNull(_nutrimentsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$MealToProductTable, List<MealToProductData>>
      _mealToProductRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.mealToProduct,
              aliasName: $_aliasNameGenerator(
                  db.savedProducts.barcode, db.mealToProduct.barcode));

  $$MealToProductTableProcessedTableManager get mealToProductRefs {
    final manager = $$MealToProductTableTableManager($_db, $_db.mealToProduct)
        .filter((f) => f.barcode.barcode($_item.barcode));

    final cache = $_typedResult.readTableOrNull(_mealToProductRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$MealPeriodsToSavedProductsTable,
      List<MealPeriodsToSavedProduct>> _mealPeriodsToSavedProductsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.mealPeriodsToSavedProducts,
          aliasName: $_aliasNameGenerator(db.savedProducts.barcode,
              db.mealPeriodsToSavedProducts.productBarcode));

  $$MealPeriodsToSavedProductsTableProcessedTableManager
      get mealPeriodsToSavedProductsRefs {
    final manager = $$MealPeriodsToSavedProductsTableTableManager(
            $_db, $_db.mealPeriodsToSavedProducts)
        .filter((f) => f.productBarcode.barcode($_item.barcode));

    final cache = $_typedResult
        .readTableOrNull(_mealPeriodsToSavedProductsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$ProductAllergensTable, List<ProductAllergen>>
      _productAllergensRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.productAllergens,
              aliasName: $_aliasNameGenerator(db.savedProducts.barcode,
                  db.productAllergens.productBarcode));

  $$ProductAllergensTableProcessedTableManager get productAllergensRefs {
    final manager =
        $$ProductAllergensTableTableManager($_db, $_db.productAllergens)
            .filter((f) => f.productBarcode.barcode($_item.barcode));

    final cache =
        $_typedResult.readTableOrNull(_productAllergensRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$ProductAdditivesTable, List<ProductAdditive>>
      _productAdditivesRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.productAdditives,
              aliasName: $_aliasNameGenerator(db.savedProducts.barcode,
                  db.productAdditives.productBarcode));

  $$ProductAdditivesTableProcessedTableManager get productAdditivesRefs {
    final manager =
        $$ProductAdditivesTableTableManager($_db, $_db.productAdditives)
            .filter((f) => f.productBarcode.barcode($_item.barcode));

    final cache =
        $_typedResult.readTableOrNull(_productAdditivesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$SavedProductsTableFilterComposer
    extends Composer<_$AppDatabase, $SavedProductsTable> {
  $$SavedProductsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get barcode => $composableBuilder(
      column: $table.barcode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get brand => $composableBuilder(
      column: $table.brand, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get ingredients => $composableBuilder(
      column: $table.ingredients, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get countries => $composableBuilder(
      column: $table.countries, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get categories => $composableBuilder(
      column: $table.categories, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get novagrade => $composableBuilder(
      column: $table.novagrade, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get nutriscore => $composableBuilder(
      column: $table.nutriscore, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get ecoscore => $composableBuilder(
      column: $table.ecoscore, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  Expression<bool> nutrimentsRefs(
      Expression<bool> Function($$NutrimentsTableFilterComposer f) f) {
    final $$NutrimentsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.barcode,
        referencedTable: $db.nutriments,
        getReferencedColumn: (t) => t.productBarcode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$NutrimentsTableFilterComposer(
              $db: $db,
              $table: $db.nutriments,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> mealToProductRefs(
      Expression<bool> Function($$MealToProductTableFilterComposer f) f) {
    final $$MealToProductTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.barcode,
        referencedTable: $db.mealToProduct,
        getReferencedColumn: (t) => t.barcode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MealToProductTableFilterComposer(
              $db: $db,
              $table: $db.mealToProduct,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> mealPeriodsToSavedProductsRefs(
      Expression<bool> Function(
              $$MealPeriodsToSavedProductsTableFilterComposer f)
          f) {
    final $$MealPeriodsToSavedProductsTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.barcode,
            referencedTable: $db.mealPeriodsToSavedProducts,
            getReferencedColumn: (t) => t.productBarcode,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$MealPeriodsToSavedProductsTableFilterComposer(
                  $db: $db,
                  $table: $db.mealPeriodsToSavedProducts,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<bool> productAllergensRefs(
      Expression<bool> Function($$ProductAllergensTableFilterComposer f) f) {
    final $$ProductAllergensTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.barcode,
        referencedTable: $db.productAllergens,
        getReferencedColumn: (t) => t.productBarcode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductAllergensTableFilterComposer(
              $db: $db,
              $table: $db.productAllergens,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> productAdditivesRefs(
      Expression<bool> Function($$ProductAdditivesTableFilterComposer f) f) {
    final $$ProductAdditivesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.barcode,
        referencedTable: $db.productAdditives,
        getReferencedColumn: (t) => t.productBarcode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductAdditivesTableFilterComposer(
              $db: $db,
              $table: $db.productAdditives,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$SavedProductsTableOrderingComposer
    extends Composer<_$AppDatabase, $SavedProductsTable> {
  $$SavedProductsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get barcode => $composableBuilder(
      column: $table.barcode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get brand => $composableBuilder(
      column: $table.brand, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get ingredients => $composableBuilder(
      column: $table.ingredients, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get countries => $composableBuilder(
      column: $table.countries, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get categories => $composableBuilder(
      column: $table.categories, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get novagrade => $composableBuilder(
      column: $table.novagrade, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get nutriscore => $composableBuilder(
      column: $table.nutriscore, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get ecoscore => $composableBuilder(
      column: $table.ecoscore, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$SavedProductsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SavedProductsTable> {
  $$SavedProductsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get barcode =>
      $composableBuilder(column: $table.barcode, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get brand =>
      $composableBuilder(column: $table.brand, builder: (column) => column);

  GeneratedColumn<String> get ingredients => $composableBuilder(
      column: $table.ingredients, builder: (column) => column);

  GeneratedColumn<String> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<String> get countries =>
      $composableBuilder(column: $table.countries, builder: (column) => column);

  GeneratedColumn<String> get categories => $composableBuilder(
      column: $table.categories, builder: (column) => column);

  GeneratedColumn<int> get novagrade =>
      $composableBuilder(column: $table.novagrade, builder: (column) => column);

  GeneratedColumn<int> get nutriscore => $composableBuilder(
      column: $table.nutriscore, builder: (column) => column);

  GeneratedColumn<int> get ecoscore =>
      $composableBuilder(column: $table.ecoscore, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> nutrimentsRefs<T extends Object>(
      Expression<T> Function($$NutrimentsTableAnnotationComposer a) f) {
    final $$NutrimentsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.barcode,
        referencedTable: $db.nutriments,
        getReferencedColumn: (t) => t.productBarcode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$NutrimentsTableAnnotationComposer(
              $db: $db,
              $table: $db.nutriments,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> mealToProductRefs<T extends Object>(
      Expression<T> Function($$MealToProductTableAnnotationComposer a) f) {
    final $$MealToProductTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.barcode,
        referencedTable: $db.mealToProduct,
        getReferencedColumn: (t) => t.barcode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MealToProductTableAnnotationComposer(
              $db: $db,
              $table: $db.mealToProduct,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> mealPeriodsToSavedProductsRefs<T extends Object>(
      Expression<T> Function(
              $$MealPeriodsToSavedProductsTableAnnotationComposer a)
          f) {
    final $$MealPeriodsToSavedProductsTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.barcode,
            referencedTable: $db.mealPeriodsToSavedProducts,
            getReferencedColumn: (t) => t.productBarcode,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$MealPeriodsToSavedProductsTableAnnotationComposer(
                  $db: $db,
                  $table: $db.mealPeriodsToSavedProducts,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> productAllergensRefs<T extends Object>(
      Expression<T> Function($$ProductAllergensTableAnnotationComposer a) f) {
    final $$ProductAllergensTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.barcode,
        referencedTable: $db.productAllergens,
        getReferencedColumn: (t) => t.productBarcode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductAllergensTableAnnotationComposer(
              $db: $db,
              $table: $db.productAllergens,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> productAdditivesRefs<T extends Object>(
      Expression<T> Function($$ProductAdditivesTableAnnotationComposer a) f) {
    final $$ProductAdditivesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.barcode,
        referencedTable: $db.productAdditives,
        getReferencedColumn: (t) => t.productBarcode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductAdditivesTableAnnotationComposer(
              $db: $db,
              $table: $db.productAdditives,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$SavedProductsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SavedProductsTable,
    SavedProduct,
    $$SavedProductsTableFilterComposer,
    $$SavedProductsTableOrderingComposer,
    $$SavedProductsTableAnnotationComposer,
    $$SavedProductsTableCreateCompanionBuilder,
    $$SavedProductsTableUpdateCompanionBuilder,
    (SavedProduct, $$SavedProductsTableReferences),
    SavedProduct,
    PrefetchHooks Function(
        {bool nutrimentsRefs,
        bool mealToProductRefs,
        bool mealPeriodsToSavedProductsRefs,
        bool productAllergensRefs,
        bool productAdditivesRefs})> {
  $$SavedProductsTableTableManager(_$AppDatabase db, $SavedProductsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SavedProductsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SavedProductsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SavedProductsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> barcode = const Value.absent(),
            Value<String?> name = const Value.absent(),
            Value<String?> brand = const Value.absent(),
            Value<String> ingredients = const Value.absent(),
            Value<String?> quantity = const Value.absent(),
            Value<String?> countries = const Value.absent(),
            Value<String?> categories = const Value.absent(),
            Value<int> novagrade = const Value.absent(),
            Value<int> nutriscore = const Value.absent(),
            Value<int> ecoscore = const Value.absent(),
            Value<String?> imageUrl = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SavedProductsCompanion(
            barcode: barcode,
            name: name,
            brand: brand,
            ingredients: ingredients,
            quantity: quantity,
            countries: countries,
            categories: categories,
            novagrade: novagrade,
            nutriscore: nutriscore,
            ecoscore: ecoscore,
            imageUrl: imageUrl,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String barcode,
            Value<String?> name = const Value.absent(),
            Value<String?> brand = const Value.absent(),
            required String ingredients,
            Value<String?> quantity = const Value.absent(),
            Value<String?> countries = const Value.absent(),
            Value<String?> categories = const Value.absent(),
            required int novagrade,
            required int nutriscore,
            required int ecoscore,
            Value<String?> imageUrl = const Value.absent(),
            required DateTime createdAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              SavedProductsCompanion.insert(
            barcode: barcode,
            name: name,
            brand: brand,
            ingredients: ingredients,
            quantity: quantity,
            countries: countries,
            categories: categories,
            novagrade: novagrade,
            nutriscore: nutriscore,
            ecoscore: ecoscore,
            imageUrl: imageUrl,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$SavedProductsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {nutrimentsRefs = false,
              mealToProductRefs = false,
              mealPeriodsToSavedProductsRefs = false,
              productAllergensRefs = false,
              productAdditivesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (nutrimentsRefs) db.nutriments,
                if (mealToProductRefs) db.mealToProduct,
                if (mealPeriodsToSavedProductsRefs)
                  db.mealPeriodsToSavedProducts,
                if (productAllergensRefs) db.productAllergens,
                if (productAdditivesRefs) db.productAdditives
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (nutrimentsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$SavedProductsTableReferences
                            ._nutrimentsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$SavedProductsTableReferences(db, table, p0)
                                .nutrimentsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.productBarcode == item.barcode),
                        typedResults: items),
                  if (mealToProductRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$SavedProductsTableReferences
                            ._mealToProductRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$SavedProductsTableReferences(db, table, p0)
                                .mealToProductRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.barcode == item.barcode),
                        typedResults: items),
                  if (mealPeriodsToSavedProductsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$SavedProductsTableReferences
                            ._mealPeriodsToSavedProductsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$SavedProductsTableReferences(db, table, p0)
                                .mealPeriodsToSavedProductsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.productBarcode == item.barcode),
                        typedResults: items),
                  if (productAllergensRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$SavedProductsTableReferences
                            ._productAllergensRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$SavedProductsTableReferences(db, table, p0)
                                .productAllergensRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.productBarcode == item.barcode),
                        typedResults: items),
                  if (productAdditivesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$SavedProductsTableReferences
                            ._productAdditivesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$SavedProductsTableReferences(db, table, p0)
                                .productAdditivesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.productBarcode == item.barcode),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$SavedProductsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SavedProductsTable,
    SavedProduct,
    $$SavedProductsTableFilterComposer,
    $$SavedProductsTableOrderingComposer,
    $$SavedProductsTableAnnotationComposer,
    $$SavedProductsTableCreateCompanionBuilder,
    $$SavedProductsTableUpdateCompanionBuilder,
    (SavedProduct, $$SavedProductsTableReferences),
    SavedProduct,
    PrefetchHooks Function(
        {bool nutrimentsRefs,
        bool mealToProductRefs,
        bool mealPeriodsToSavedProductsRefs,
        bool productAllergensRefs,
        bool productAdditivesRefs})>;
typedef $$NutrimentsTableCreateCompanionBuilder = NutrimentsCompanion Function({
  Value<int> id,
  required int nutrientTypeId,
  required double value,
  required String productBarcode,
});
typedef $$NutrimentsTableUpdateCompanionBuilder = NutrimentsCompanion Function({
  Value<int> id,
  Value<int> nutrientTypeId,
  Value<double> value,
  Value<String> productBarcode,
});

final class $$NutrimentsTableReferences
    extends BaseReferences<_$AppDatabase, $NutrimentsTable, Nutriment> {
  $$NutrimentsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $NutrientTypesTable _nutrientTypeIdTable(_$AppDatabase db) =>
      db.nutrientTypes.createAlias($_aliasNameGenerator(
          db.nutriments.nutrientTypeId, db.nutrientTypes.id));

  $$NutrientTypesTableProcessedTableManager? get nutrientTypeId {
    if ($_item.nutrientTypeId == null) return null;
    final manager = $$NutrientTypesTableTableManager($_db, $_db.nutrientTypes)
        .filter((f) => f.id($_item.nutrientTypeId!));
    final item = $_typedResult.readTableOrNull(_nutrientTypeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $SavedProductsTable _productBarcodeTable(_$AppDatabase db) =>
      db.savedProducts.createAlias($_aliasNameGenerator(
          db.nutriments.productBarcode, db.savedProducts.barcode));

  $$SavedProductsTableProcessedTableManager? get productBarcode {
    if ($_item.productBarcode == null) return null;
    final manager = $$SavedProductsTableTableManager($_db, $_db.savedProducts)
        .filter((f) => f.barcode($_item.productBarcode!));
    final item = $_typedResult.readTableOrNull(_productBarcodeTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$NutrimentsTableFilterComposer
    extends Composer<_$AppDatabase, $NutrimentsTable> {
  $$NutrimentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnFilters(column));

  $$NutrientTypesTableFilterComposer get nutrientTypeId {
    final $$NutrientTypesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.nutrientTypeId,
        referencedTable: $db.nutrientTypes,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$NutrientTypesTableFilterComposer(
              $db: $db,
              $table: $db.nutrientTypes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$SavedProductsTableFilterComposer get productBarcode {
    final $$SavedProductsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productBarcode,
        referencedTable: $db.savedProducts,
        getReferencedColumn: (t) => t.barcode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SavedProductsTableFilterComposer(
              $db: $db,
              $table: $db.savedProducts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$NutrimentsTableOrderingComposer
    extends Composer<_$AppDatabase, $NutrimentsTable> {
  $$NutrimentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnOrderings(column));

  $$NutrientTypesTableOrderingComposer get nutrientTypeId {
    final $$NutrientTypesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.nutrientTypeId,
        referencedTable: $db.nutrientTypes,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$NutrientTypesTableOrderingComposer(
              $db: $db,
              $table: $db.nutrientTypes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$SavedProductsTableOrderingComposer get productBarcode {
    final $$SavedProductsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productBarcode,
        referencedTable: $db.savedProducts,
        getReferencedColumn: (t) => t.barcode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SavedProductsTableOrderingComposer(
              $db: $db,
              $table: $db.savedProducts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$NutrimentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $NutrimentsTable> {
  $$NutrimentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  $$NutrientTypesTableAnnotationComposer get nutrientTypeId {
    final $$NutrientTypesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.nutrientTypeId,
        referencedTable: $db.nutrientTypes,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$NutrientTypesTableAnnotationComposer(
              $db: $db,
              $table: $db.nutrientTypes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$SavedProductsTableAnnotationComposer get productBarcode {
    final $$SavedProductsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productBarcode,
        referencedTable: $db.savedProducts,
        getReferencedColumn: (t) => t.barcode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SavedProductsTableAnnotationComposer(
              $db: $db,
              $table: $db.savedProducts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$NutrimentsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $NutrimentsTable,
    Nutriment,
    $$NutrimentsTableFilterComposer,
    $$NutrimentsTableOrderingComposer,
    $$NutrimentsTableAnnotationComposer,
    $$NutrimentsTableCreateCompanionBuilder,
    $$NutrimentsTableUpdateCompanionBuilder,
    (Nutriment, $$NutrimentsTableReferences),
    Nutriment,
    PrefetchHooks Function({bool nutrientTypeId, bool productBarcode})> {
  $$NutrimentsTableTableManager(_$AppDatabase db, $NutrimentsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NutrimentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NutrimentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NutrimentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> nutrientTypeId = const Value.absent(),
            Value<double> value = const Value.absent(),
            Value<String> productBarcode = const Value.absent(),
          }) =>
              NutrimentsCompanion(
            id: id,
            nutrientTypeId: nutrientTypeId,
            value: value,
            productBarcode: productBarcode,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int nutrientTypeId,
            required double value,
            required String productBarcode,
          }) =>
              NutrimentsCompanion.insert(
            id: id,
            nutrientTypeId: nutrientTypeId,
            value: value,
            productBarcode: productBarcode,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$NutrimentsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {nutrientTypeId = false, productBarcode = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (nutrientTypeId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.nutrientTypeId,
                    referencedTable:
                        $$NutrimentsTableReferences._nutrientTypeIdTable(db),
                    referencedColumn:
                        $$NutrimentsTableReferences._nutrientTypeIdTable(db).id,
                  ) as T;
                }
                if (productBarcode) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.productBarcode,
                    referencedTable:
                        $$NutrimentsTableReferences._productBarcodeTable(db),
                    referencedColumn: $$NutrimentsTableReferences
                        ._productBarcodeTable(db)
                        .barcode,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$NutrimentsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $NutrimentsTable,
    Nutriment,
    $$NutrimentsTableFilterComposer,
    $$NutrimentsTableOrderingComposer,
    $$NutrimentsTableAnnotationComposer,
    $$NutrimentsTableCreateCompanionBuilder,
    $$NutrimentsTableUpdateCompanionBuilder,
    (Nutriment, $$NutrimentsTableReferences),
    Nutriment,
    PrefetchHooks Function({bool nutrientTypeId, bool productBarcode})>;
typedef $$MealTableCreateCompanionBuilder = MealCompanion Function({
  Value<int> id,
  required DateTime date,
  required String type,
});
typedef $$MealTableUpdateCompanionBuilder = MealCompanion Function({
  Value<int> id,
  Value<DateTime> date,
  Value<String> type,
});

final class $$MealTableReferences
    extends BaseReferences<_$AppDatabase, $MealTable, MealData> {
  $$MealTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$MealToProductTable, List<MealToProductData>>
      _mealToProductRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.mealToProduct,
              aliasName:
                  $_aliasNameGenerator(db.meal.id, db.mealToProduct.mealId));

  $$MealToProductTableProcessedTableManager get mealToProductRefs {
    final manager = $$MealToProductTableTableManager($_db, $_db.mealToProduct)
        .filter((f) => f.mealId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_mealToProductRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$MealPeriodsToMealTable,
      List<MealPeriodsToMealData>> _mealPeriodsToMealRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.mealPeriodsToMeal,
          aliasName:
              $_aliasNameGenerator(db.meal.id, db.mealPeriodsToMeal.idMeal));

  $$MealPeriodsToMealTableProcessedTableManager get mealPeriodsToMealRefs {
    final manager =
        $$MealPeriodsToMealTableTableManager($_db, $_db.mealPeriodsToMeal)
            .filter((f) => f.idMeal.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_mealPeriodsToMealRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$MealTableFilterComposer extends Composer<_$AppDatabase, $MealTable> {
  $$MealTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  Expression<bool> mealToProductRefs(
      Expression<bool> Function($$MealToProductTableFilterComposer f) f) {
    final $$MealToProductTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.mealToProduct,
        getReferencedColumn: (t) => t.mealId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MealToProductTableFilterComposer(
              $db: $db,
              $table: $db.mealToProduct,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> mealPeriodsToMealRefs(
      Expression<bool> Function($$MealPeriodsToMealTableFilterComposer f) f) {
    final $$MealPeriodsToMealTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.mealPeriodsToMeal,
        getReferencedColumn: (t) => t.idMeal,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MealPeriodsToMealTableFilterComposer(
              $db: $db,
              $table: $db.mealPeriodsToMeal,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$MealTableOrderingComposer extends Composer<_$AppDatabase, $MealTable> {
  $$MealTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));
}

class $$MealTableAnnotationComposer
    extends Composer<_$AppDatabase, $MealTable> {
  $$MealTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  Expression<T> mealToProductRefs<T extends Object>(
      Expression<T> Function($$MealToProductTableAnnotationComposer a) f) {
    final $$MealToProductTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.mealToProduct,
        getReferencedColumn: (t) => t.mealId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MealToProductTableAnnotationComposer(
              $db: $db,
              $table: $db.mealToProduct,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> mealPeriodsToMealRefs<T extends Object>(
      Expression<T> Function($$MealPeriodsToMealTableAnnotationComposer a) f) {
    final $$MealPeriodsToMealTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.mealPeriodsToMeal,
            getReferencedColumn: (t) => t.idMeal,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$MealPeriodsToMealTableAnnotationComposer(
                  $db: $db,
                  $table: $db.mealPeriodsToMeal,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$MealTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MealTable,
    MealData,
    $$MealTableFilterComposer,
    $$MealTableOrderingComposer,
    $$MealTableAnnotationComposer,
    $$MealTableCreateCompanionBuilder,
    $$MealTableUpdateCompanionBuilder,
    (MealData, $$MealTableReferences),
    MealData,
    PrefetchHooks Function(
        {bool mealToProductRefs, bool mealPeriodsToMealRefs})> {
  $$MealTableTableManager(_$AppDatabase db, $MealTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MealTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MealTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MealTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<String> type = const Value.absent(),
          }) =>
              MealCompanion(
            id: id,
            date: date,
            type: type,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required DateTime date,
            required String type,
          }) =>
              MealCompanion.insert(
            id: id,
            date: date,
            type: type,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$MealTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {mealToProductRefs = false, mealPeriodsToMealRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (mealToProductRefs) db.mealToProduct,
                if (mealPeriodsToMealRefs) db.mealPeriodsToMeal
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (mealToProductRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$MealTableReferences._mealToProductRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$MealTableReferences(db, table, p0)
                                .mealToProductRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.mealId == item.id),
                        typedResults: items),
                  if (mealPeriodsToMealRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$MealTableReferences
                            ._mealPeriodsToMealRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$MealTableReferences(db, table, p0)
                                .mealPeriodsToMealRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.idMeal == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$MealTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MealTable,
    MealData,
    $$MealTableFilterComposer,
    $$MealTableOrderingComposer,
    $$MealTableAnnotationComposer,
    $$MealTableCreateCompanionBuilder,
    $$MealTableUpdateCompanionBuilder,
    (MealData, $$MealTableReferences),
    MealData,
    PrefetchHooks Function(
        {bool mealToProductRefs, bool mealPeriodsToMealRefs})>;
typedef $$MealPeriodsTableCreateCompanionBuilder = MealPeriodsCompanion
    Function({
  Value<int> id,
  required String type,
  required DateTime startTime,
  required DateTime endTime,
});
typedef $$MealPeriodsTableUpdateCompanionBuilder = MealPeriodsCompanion
    Function({
  Value<int> id,
  Value<String> type,
  Value<DateTime> startTime,
  Value<DateTime> endTime,
});

final class $$MealPeriodsTableReferences
    extends BaseReferences<_$AppDatabase, $MealPeriodsTable, MealPeriod> {
  $$MealPeriodsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$MealPeriodsToMealTable,
      List<MealPeriodsToMealData>> _mealPeriodsToMealRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.mealPeriodsToMeal,
          aliasName: $_aliasNameGenerator(
              db.mealPeriods.id, db.mealPeriodsToMeal.idMealPeriod));

  $$MealPeriodsToMealTableProcessedTableManager get mealPeriodsToMealRefs {
    final manager =
        $$MealPeriodsToMealTableTableManager($_db, $_db.mealPeriodsToMeal)
            .filter((f) => f.idMealPeriod.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_mealPeriodsToMealRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$MealPeriodsToSavedProductsTable,
      List<MealPeriodsToSavedProduct>> _mealPeriodsToSavedProductsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.mealPeriodsToSavedProducts,
          aliasName: $_aliasNameGenerator(
              db.mealPeriods.id, db.mealPeriodsToSavedProducts.idMealPeriod));

  $$MealPeriodsToSavedProductsTableProcessedTableManager
      get mealPeriodsToSavedProductsRefs {
    final manager = $$MealPeriodsToSavedProductsTableTableManager(
            $_db, $_db.mealPeriodsToSavedProducts)
        .filter((f) => f.idMealPeriod.id($_item.id));

    final cache = $_typedResult
        .readTableOrNull(_mealPeriodsToSavedProductsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$MealPeriodsTableFilterComposer
    extends Composer<_$AppDatabase, $MealPeriodsTable> {
  $$MealPeriodsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startTime => $composableBuilder(
      column: $table.startTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get endTime => $composableBuilder(
      column: $table.endTime, builder: (column) => ColumnFilters(column));

  Expression<bool> mealPeriodsToMealRefs(
      Expression<bool> Function($$MealPeriodsToMealTableFilterComposer f) f) {
    final $$MealPeriodsToMealTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.mealPeriodsToMeal,
        getReferencedColumn: (t) => t.idMealPeriod,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MealPeriodsToMealTableFilterComposer(
              $db: $db,
              $table: $db.mealPeriodsToMeal,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> mealPeriodsToSavedProductsRefs(
      Expression<bool> Function(
              $$MealPeriodsToSavedProductsTableFilterComposer f)
          f) {
    final $$MealPeriodsToSavedProductsTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.mealPeriodsToSavedProducts,
            getReferencedColumn: (t) => t.idMealPeriod,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$MealPeriodsToSavedProductsTableFilterComposer(
                  $db: $db,
                  $table: $db.mealPeriodsToSavedProducts,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$MealPeriodsTableOrderingComposer
    extends Composer<_$AppDatabase, $MealPeriodsTable> {
  $$MealPeriodsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startTime => $composableBuilder(
      column: $table.startTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get endTime => $composableBuilder(
      column: $table.endTime, builder: (column) => ColumnOrderings(column));
}

class $$MealPeriodsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MealPeriodsTable> {
  $$MealPeriodsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<DateTime> get startTime =>
      $composableBuilder(column: $table.startTime, builder: (column) => column);

  GeneratedColumn<DateTime> get endTime =>
      $composableBuilder(column: $table.endTime, builder: (column) => column);

  Expression<T> mealPeriodsToMealRefs<T extends Object>(
      Expression<T> Function($$MealPeriodsToMealTableAnnotationComposer a) f) {
    final $$MealPeriodsToMealTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.mealPeriodsToMeal,
            getReferencedColumn: (t) => t.idMealPeriod,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$MealPeriodsToMealTableAnnotationComposer(
                  $db: $db,
                  $table: $db.mealPeriodsToMeal,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> mealPeriodsToSavedProductsRefs<T extends Object>(
      Expression<T> Function(
              $$MealPeriodsToSavedProductsTableAnnotationComposer a)
          f) {
    final $$MealPeriodsToSavedProductsTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.mealPeriodsToSavedProducts,
            getReferencedColumn: (t) => t.idMealPeriod,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$MealPeriodsToSavedProductsTableAnnotationComposer(
                  $db: $db,
                  $table: $db.mealPeriodsToSavedProducts,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$MealPeriodsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MealPeriodsTable,
    MealPeriod,
    $$MealPeriodsTableFilterComposer,
    $$MealPeriodsTableOrderingComposer,
    $$MealPeriodsTableAnnotationComposer,
    $$MealPeriodsTableCreateCompanionBuilder,
    $$MealPeriodsTableUpdateCompanionBuilder,
    (MealPeriod, $$MealPeriodsTableReferences),
    MealPeriod,
    PrefetchHooks Function(
        {bool mealPeriodsToMealRefs, bool mealPeriodsToSavedProductsRefs})> {
  $$MealPeriodsTableTableManager(_$AppDatabase db, $MealPeriodsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MealPeriodsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MealPeriodsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MealPeriodsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<DateTime> startTime = const Value.absent(),
            Value<DateTime> endTime = const Value.absent(),
          }) =>
              MealPeriodsCompanion(
            id: id,
            type: type,
            startTime: startTime,
            endTime: endTime,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String type,
            required DateTime startTime,
            required DateTime endTime,
          }) =>
              MealPeriodsCompanion.insert(
            id: id,
            type: type,
            startTime: startTime,
            endTime: endTime,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$MealPeriodsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {mealPeriodsToMealRefs = false,
              mealPeriodsToSavedProductsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (mealPeriodsToMealRefs) db.mealPeriodsToMeal,
                if (mealPeriodsToSavedProductsRefs)
                  db.mealPeriodsToSavedProducts
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (mealPeriodsToMealRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$MealPeriodsTableReferences
                            ._mealPeriodsToMealRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$MealPeriodsTableReferences(db, table, p0)
                                .mealPeriodsToMealRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.idMealPeriod == item.id),
                        typedResults: items),
                  if (mealPeriodsToSavedProductsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$MealPeriodsTableReferences
                            ._mealPeriodsToSavedProductsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$MealPeriodsTableReferences(db, table, p0)
                                .mealPeriodsToSavedProductsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.idMealPeriod == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$MealPeriodsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MealPeriodsTable,
    MealPeriod,
    $$MealPeriodsTableFilterComposer,
    $$MealPeriodsTableOrderingComposer,
    $$MealPeriodsTableAnnotationComposer,
    $$MealPeriodsTableCreateCompanionBuilder,
    $$MealPeriodsTableUpdateCompanionBuilder,
    (MealPeriod, $$MealPeriodsTableReferences),
    MealPeriod,
    PrefetchHooks Function(
        {bool mealPeriodsToMealRefs, bool mealPeriodsToSavedProductsRefs})>;
typedef $$MealToProductTableCreateCompanionBuilder = MealToProductCompanion
    Function({
  required String barcode,
  required int mealId,
  required String unit,
  required double value,
  Value<int> rowid,
});
typedef $$MealToProductTableUpdateCompanionBuilder = MealToProductCompanion
    Function({
  Value<String> barcode,
  Value<int> mealId,
  Value<String> unit,
  Value<double> value,
  Value<int> rowid,
});

final class $$MealToProductTableReferences extends BaseReferences<_$AppDatabase,
    $MealToProductTable, MealToProductData> {
  $$MealToProductTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $SavedProductsTable _barcodeTable(_$AppDatabase db) =>
      db.savedProducts.createAlias($_aliasNameGenerator(
          db.mealToProduct.barcode, db.savedProducts.barcode));

  $$SavedProductsTableProcessedTableManager? get barcode {
    if ($_item.barcode == null) return null;
    final manager = $$SavedProductsTableTableManager($_db, $_db.savedProducts)
        .filter((f) => f.barcode($_item.barcode!));
    final item = $_typedResult.readTableOrNull(_barcodeTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $MealTable _mealIdTable(_$AppDatabase db) => db.meal
      .createAlias($_aliasNameGenerator(db.mealToProduct.mealId, db.meal.id));

  $$MealTableProcessedTableManager? get mealId {
    if ($_item.mealId == null) return null;
    final manager = $$MealTableTableManager($_db, $_db.meal)
        .filter((f) => f.id($_item.mealId!));
    final item = $_typedResult.readTableOrNull(_mealIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$MealToProductTableFilterComposer
    extends Composer<_$AppDatabase, $MealToProductTable> {
  $$MealToProductTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get unit => $composableBuilder(
      column: $table.unit, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnFilters(column));

  $$SavedProductsTableFilterComposer get barcode {
    final $$SavedProductsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.barcode,
        referencedTable: $db.savedProducts,
        getReferencedColumn: (t) => t.barcode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SavedProductsTableFilterComposer(
              $db: $db,
              $table: $db.savedProducts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$MealTableFilterComposer get mealId {
    final $$MealTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.mealId,
        referencedTable: $db.meal,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MealTableFilterComposer(
              $db: $db,
              $table: $db.meal,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MealToProductTableOrderingComposer
    extends Composer<_$AppDatabase, $MealToProductTable> {
  $$MealToProductTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get unit => $composableBuilder(
      column: $table.unit, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnOrderings(column));

  $$SavedProductsTableOrderingComposer get barcode {
    final $$SavedProductsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.barcode,
        referencedTable: $db.savedProducts,
        getReferencedColumn: (t) => t.barcode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SavedProductsTableOrderingComposer(
              $db: $db,
              $table: $db.savedProducts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$MealTableOrderingComposer get mealId {
    final $$MealTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.mealId,
        referencedTable: $db.meal,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MealTableOrderingComposer(
              $db: $db,
              $table: $db.meal,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MealToProductTableAnnotationComposer
    extends Composer<_$AppDatabase, $MealToProductTable> {
  $$MealToProductTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<double> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  $$SavedProductsTableAnnotationComposer get barcode {
    final $$SavedProductsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.barcode,
        referencedTable: $db.savedProducts,
        getReferencedColumn: (t) => t.barcode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SavedProductsTableAnnotationComposer(
              $db: $db,
              $table: $db.savedProducts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$MealTableAnnotationComposer get mealId {
    final $$MealTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.mealId,
        referencedTable: $db.meal,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MealTableAnnotationComposer(
              $db: $db,
              $table: $db.meal,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MealToProductTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MealToProductTable,
    MealToProductData,
    $$MealToProductTableFilterComposer,
    $$MealToProductTableOrderingComposer,
    $$MealToProductTableAnnotationComposer,
    $$MealToProductTableCreateCompanionBuilder,
    $$MealToProductTableUpdateCompanionBuilder,
    (MealToProductData, $$MealToProductTableReferences),
    MealToProductData,
    PrefetchHooks Function({bool barcode, bool mealId})> {
  $$MealToProductTableTableManager(_$AppDatabase db, $MealToProductTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MealToProductTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MealToProductTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MealToProductTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> barcode = const Value.absent(),
            Value<int> mealId = const Value.absent(),
            Value<String> unit = const Value.absent(),
            Value<double> value = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MealToProductCompanion(
            barcode: barcode,
            mealId: mealId,
            unit: unit,
            value: value,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String barcode,
            required int mealId,
            required String unit,
            required double value,
            Value<int> rowid = const Value.absent(),
          }) =>
              MealToProductCompanion.insert(
            barcode: barcode,
            mealId: mealId,
            unit: unit,
            value: value,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$MealToProductTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({barcode = false, mealId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (barcode) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.barcode,
                    referencedTable:
                        $$MealToProductTableReferences._barcodeTable(db),
                    referencedColumn: $$MealToProductTableReferences
                        ._barcodeTable(db)
                        .barcode,
                  ) as T;
                }
                if (mealId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.mealId,
                    referencedTable:
                        $$MealToProductTableReferences._mealIdTable(db),
                    referencedColumn:
                        $$MealToProductTableReferences._mealIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$MealToProductTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MealToProductTable,
    MealToProductData,
    $$MealToProductTableFilterComposer,
    $$MealToProductTableOrderingComposer,
    $$MealToProductTableAnnotationComposer,
    $$MealToProductTableCreateCompanionBuilder,
    $$MealToProductTableUpdateCompanionBuilder,
    (MealToProductData, $$MealToProductTableReferences),
    MealToProductData,
    PrefetchHooks Function({bool barcode, bool mealId})>;
typedef $$MealPeriodsToMealTableCreateCompanionBuilder
    = MealPeriodsToMealCompanion Function({
  required int idMealPeriod,
  required int idMeal,
  required String unit,
  required double value,
  Value<int> rowid,
});
typedef $$MealPeriodsToMealTableUpdateCompanionBuilder
    = MealPeriodsToMealCompanion Function({
  Value<int> idMealPeriod,
  Value<int> idMeal,
  Value<String> unit,
  Value<double> value,
  Value<int> rowid,
});

final class $$MealPeriodsToMealTableReferences extends BaseReferences<
    _$AppDatabase, $MealPeriodsToMealTable, MealPeriodsToMealData> {
  $$MealPeriodsToMealTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $MealPeriodsTable _idMealPeriodTable(_$AppDatabase db) =>
      db.mealPeriods.createAlias($_aliasNameGenerator(
          db.mealPeriodsToMeal.idMealPeriod, db.mealPeriods.id));

  $$MealPeriodsTableProcessedTableManager? get idMealPeriod {
    if ($_item.idMealPeriod == null) return null;
    final manager = $$MealPeriodsTableTableManager($_db, $_db.mealPeriods)
        .filter((f) => f.id($_item.idMealPeriod!));
    final item = $_typedResult.readTableOrNull(_idMealPeriodTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $MealTable _idMealTable(_$AppDatabase db) => db.meal.createAlias(
      $_aliasNameGenerator(db.mealPeriodsToMeal.idMeal, db.meal.id));

  $$MealTableProcessedTableManager? get idMeal {
    if ($_item.idMeal == null) return null;
    final manager = $$MealTableTableManager($_db, $_db.meal)
        .filter((f) => f.id($_item.idMeal!));
    final item = $_typedResult.readTableOrNull(_idMealTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$MealPeriodsToMealTableFilterComposer
    extends Composer<_$AppDatabase, $MealPeriodsToMealTable> {
  $$MealPeriodsToMealTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get unit => $composableBuilder(
      column: $table.unit, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnFilters(column));

  $$MealPeriodsTableFilterComposer get idMealPeriod {
    final $$MealPeriodsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idMealPeriod,
        referencedTable: $db.mealPeriods,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MealPeriodsTableFilterComposer(
              $db: $db,
              $table: $db.mealPeriods,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$MealTableFilterComposer get idMeal {
    final $$MealTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idMeal,
        referencedTable: $db.meal,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MealTableFilterComposer(
              $db: $db,
              $table: $db.meal,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MealPeriodsToMealTableOrderingComposer
    extends Composer<_$AppDatabase, $MealPeriodsToMealTable> {
  $$MealPeriodsToMealTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get unit => $composableBuilder(
      column: $table.unit, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnOrderings(column));

  $$MealPeriodsTableOrderingComposer get idMealPeriod {
    final $$MealPeriodsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idMealPeriod,
        referencedTable: $db.mealPeriods,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MealPeriodsTableOrderingComposer(
              $db: $db,
              $table: $db.mealPeriods,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$MealTableOrderingComposer get idMeal {
    final $$MealTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idMeal,
        referencedTable: $db.meal,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MealTableOrderingComposer(
              $db: $db,
              $table: $db.meal,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MealPeriodsToMealTableAnnotationComposer
    extends Composer<_$AppDatabase, $MealPeriodsToMealTable> {
  $$MealPeriodsToMealTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<double> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  $$MealPeriodsTableAnnotationComposer get idMealPeriod {
    final $$MealPeriodsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idMealPeriod,
        referencedTable: $db.mealPeriods,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MealPeriodsTableAnnotationComposer(
              $db: $db,
              $table: $db.mealPeriods,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$MealTableAnnotationComposer get idMeal {
    final $$MealTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idMeal,
        referencedTable: $db.meal,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MealTableAnnotationComposer(
              $db: $db,
              $table: $db.meal,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MealPeriodsToMealTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MealPeriodsToMealTable,
    MealPeriodsToMealData,
    $$MealPeriodsToMealTableFilterComposer,
    $$MealPeriodsToMealTableOrderingComposer,
    $$MealPeriodsToMealTableAnnotationComposer,
    $$MealPeriodsToMealTableCreateCompanionBuilder,
    $$MealPeriodsToMealTableUpdateCompanionBuilder,
    (MealPeriodsToMealData, $$MealPeriodsToMealTableReferences),
    MealPeriodsToMealData,
    PrefetchHooks Function({bool idMealPeriod, bool idMeal})> {
  $$MealPeriodsToMealTableTableManager(
      _$AppDatabase db, $MealPeriodsToMealTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MealPeriodsToMealTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MealPeriodsToMealTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MealPeriodsToMealTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> idMealPeriod = const Value.absent(),
            Value<int> idMeal = const Value.absent(),
            Value<String> unit = const Value.absent(),
            Value<double> value = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MealPeriodsToMealCompanion(
            idMealPeriod: idMealPeriod,
            idMeal: idMeal,
            unit: unit,
            value: value,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int idMealPeriod,
            required int idMeal,
            required String unit,
            required double value,
            Value<int> rowid = const Value.absent(),
          }) =>
              MealPeriodsToMealCompanion.insert(
            idMealPeriod: idMealPeriod,
            idMeal: idMeal,
            unit: unit,
            value: value,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$MealPeriodsToMealTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({idMealPeriod = false, idMeal = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (idMealPeriod) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.idMealPeriod,
                    referencedTable: $$MealPeriodsToMealTableReferences
                        ._idMealPeriodTable(db),
                    referencedColumn: $$MealPeriodsToMealTableReferences
                        ._idMealPeriodTable(db)
                        .id,
                  ) as T;
                }
                if (idMeal) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.idMeal,
                    referencedTable:
                        $$MealPeriodsToMealTableReferences._idMealTable(db),
                    referencedColumn:
                        $$MealPeriodsToMealTableReferences._idMealTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$MealPeriodsToMealTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MealPeriodsToMealTable,
    MealPeriodsToMealData,
    $$MealPeriodsToMealTableFilterComposer,
    $$MealPeriodsToMealTableOrderingComposer,
    $$MealPeriodsToMealTableAnnotationComposer,
    $$MealPeriodsToMealTableCreateCompanionBuilder,
    $$MealPeriodsToMealTableUpdateCompanionBuilder,
    (MealPeriodsToMealData, $$MealPeriodsToMealTableReferences),
    MealPeriodsToMealData,
    PrefetchHooks Function({bool idMealPeriod, bool idMeal})>;
typedef $$MealPeriodsToSavedProductsTableCreateCompanionBuilder
    = MealPeriodsToSavedProductsCompanion Function({
  required int idMealPeriod,
  required String productBarcode,
  required String unit,
  required double value,
  Value<int> rowid,
});
typedef $$MealPeriodsToSavedProductsTableUpdateCompanionBuilder
    = MealPeriodsToSavedProductsCompanion Function({
  Value<int> idMealPeriod,
  Value<String> productBarcode,
  Value<String> unit,
  Value<double> value,
  Value<int> rowid,
});

final class $$MealPeriodsToSavedProductsTableReferences extends BaseReferences<
    _$AppDatabase,
    $MealPeriodsToSavedProductsTable,
    MealPeriodsToSavedProduct> {
  $$MealPeriodsToSavedProductsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $MealPeriodsTable _idMealPeriodTable(_$AppDatabase db) =>
      db.mealPeriods.createAlias($_aliasNameGenerator(
          db.mealPeriodsToSavedProducts.idMealPeriod, db.mealPeriods.id));

  $$MealPeriodsTableProcessedTableManager? get idMealPeriod {
    if ($_item.idMealPeriod == null) return null;
    final manager = $$MealPeriodsTableTableManager($_db, $_db.mealPeriods)
        .filter((f) => f.id($_item.idMealPeriod!));
    final item = $_typedResult.readTableOrNull(_idMealPeriodTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $SavedProductsTable _productBarcodeTable(_$AppDatabase db) =>
      db.savedProducts.createAlias($_aliasNameGenerator(
          db.mealPeriodsToSavedProducts.productBarcode,
          db.savedProducts.barcode));

  $$SavedProductsTableProcessedTableManager? get productBarcode {
    if ($_item.productBarcode == null) return null;
    final manager = $$SavedProductsTableTableManager($_db, $_db.savedProducts)
        .filter((f) => f.barcode($_item.productBarcode!));
    final item = $_typedResult.readTableOrNull(_productBarcodeTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$MealPeriodsToSavedProductsTableFilterComposer
    extends Composer<_$AppDatabase, $MealPeriodsToSavedProductsTable> {
  $$MealPeriodsToSavedProductsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get unit => $composableBuilder(
      column: $table.unit, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnFilters(column));

  $$MealPeriodsTableFilterComposer get idMealPeriod {
    final $$MealPeriodsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idMealPeriod,
        referencedTable: $db.mealPeriods,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MealPeriodsTableFilterComposer(
              $db: $db,
              $table: $db.mealPeriods,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$SavedProductsTableFilterComposer get productBarcode {
    final $$SavedProductsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productBarcode,
        referencedTable: $db.savedProducts,
        getReferencedColumn: (t) => t.barcode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SavedProductsTableFilterComposer(
              $db: $db,
              $table: $db.savedProducts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MealPeriodsToSavedProductsTableOrderingComposer
    extends Composer<_$AppDatabase, $MealPeriodsToSavedProductsTable> {
  $$MealPeriodsToSavedProductsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get unit => $composableBuilder(
      column: $table.unit, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnOrderings(column));

  $$MealPeriodsTableOrderingComposer get idMealPeriod {
    final $$MealPeriodsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idMealPeriod,
        referencedTable: $db.mealPeriods,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MealPeriodsTableOrderingComposer(
              $db: $db,
              $table: $db.mealPeriods,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$SavedProductsTableOrderingComposer get productBarcode {
    final $$SavedProductsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productBarcode,
        referencedTable: $db.savedProducts,
        getReferencedColumn: (t) => t.barcode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SavedProductsTableOrderingComposer(
              $db: $db,
              $table: $db.savedProducts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MealPeriodsToSavedProductsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MealPeriodsToSavedProductsTable> {
  $$MealPeriodsToSavedProductsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<double> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  $$MealPeriodsTableAnnotationComposer get idMealPeriod {
    final $$MealPeriodsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idMealPeriod,
        referencedTable: $db.mealPeriods,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MealPeriodsTableAnnotationComposer(
              $db: $db,
              $table: $db.mealPeriods,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$SavedProductsTableAnnotationComposer get productBarcode {
    final $$SavedProductsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productBarcode,
        referencedTable: $db.savedProducts,
        getReferencedColumn: (t) => t.barcode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SavedProductsTableAnnotationComposer(
              $db: $db,
              $table: $db.savedProducts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MealPeriodsToSavedProductsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MealPeriodsToSavedProductsTable,
    MealPeriodsToSavedProduct,
    $$MealPeriodsToSavedProductsTableFilterComposer,
    $$MealPeriodsToSavedProductsTableOrderingComposer,
    $$MealPeriodsToSavedProductsTableAnnotationComposer,
    $$MealPeriodsToSavedProductsTableCreateCompanionBuilder,
    $$MealPeriodsToSavedProductsTableUpdateCompanionBuilder,
    (MealPeriodsToSavedProduct, $$MealPeriodsToSavedProductsTableReferences),
    MealPeriodsToSavedProduct,
    PrefetchHooks Function({bool idMealPeriod, bool productBarcode})> {
  $$MealPeriodsToSavedProductsTableTableManager(
      _$AppDatabase db, $MealPeriodsToSavedProductsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MealPeriodsToSavedProductsTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$MealPeriodsToSavedProductsTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MealPeriodsToSavedProductsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> idMealPeriod = const Value.absent(),
            Value<String> productBarcode = const Value.absent(),
            Value<String> unit = const Value.absent(),
            Value<double> value = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MealPeriodsToSavedProductsCompanion(
            idMealPeriod: idMealPeriod,
            productBarcode: productBarcode,
            unit: unit,
            value: value,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int idMealPeriod,
            required String productBarcode,
            required String unit,
            required double value,
            Value<int> rowid = const Value.absent(),
          }) =>
              MealPeriodsToSavedProductsCompanion.insert(
            idMealPeriod: idMealPeriod,
            productBarcode: productBarcode,
            unit: unit,
            value: value,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$MealPeriodsToSavedProductsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {idMealPeriod = false, productBarcode = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (idMealPeriod) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.idMealPeriod,
                    referencedTable: $$MealPeriodsToSavedProductsTableReferences
                        ._idMealPeriodTable(db),
                    referencedColumn:
                        $$MealPeriodsToSavedProductsTableReferences
                            ._idMealPeriodTable(db)
                            .id,
                  ) as T;
                }
                if (productBarcode) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.productBarcode,
                    referencedTable: $$MealPeriodsToSavedProductsTableReferences
                        ._productBarcodeTable(db),
                    referencedColumn:
                        $$MealPeriodsToSavedProductsTableReferences
                            ._productBarcodeTable(db)
                            .barcode,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$MealPeriodsToSavedProductsTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $MealPeriodsToSavedProductsTable,
        MealPeriodsToSavedProduct,
        $$MealPeriodsToSavedProductsTableFilterComposer,
        $$MealPeriodsToSavedProductsTableOrderingComposer,
        $$MealPeriodsToSavedProductsTableAnnotationComposer,
        $$MealPeriodsToSavedProductsTableCreateCompanionBuilder,
        $$MealPeriodsToSavedProductsTableUpdateCompanionBuilder,
        (
          MealPeriodsToSavedProduct,
          $$MealPeriodsToSavedProductsTableReferences
        ),
        MealPeriodsToSavedProduct,
        PrefetchHooks Function({bool idMealPeriod, bool productBarcode})>;
typedef $$AdditivesTableCreateCompanionBuilder = AdditivesCompanion Function({
  Value<int> id,
  required String name,
});
typedef $$AdditivesTableUpdateCompanionBuilder = AdditivesCompanion Function({
  Value<int> id,
  Value<String> name,
});

final class $$AdditivesTableReferences
    extends BaseReferences<_$AppDatabase, $AdditivesTable, Additive> {
  $$AdditivesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ProductAdditivesTable, List<ProductAdditive>>
      _productAdditivesRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.productAdditives,
              aliasName: $_aliasNameGenerator(
                  db.additives.id, db.productAdditives.additiveId));

  $$ProductAdditivesTableProcessedTableManager get productAdditivesRefs {
    final manager =
        $$ProductAdditivesTableTableManager($_db, $_db.productAdditives)
            .filter((f) => f.additiveId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_productAdditivesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$AdditivesTableFilterComposer
    extends Composer<_$AppDatabase, $AdditivesTable> {
  $$AdditivesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  Expression<bool> productAdditivesRefs(
      Expression<bool> Function($$ProductAdditivesTableFilterComposer f) f) {
    final $$ProductAdditivesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.productAdditives,
        getReferencedColumn: (t) => t.additiveId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductAdditivesTableFilterComposer(
              $db: $db,
              $table: $db.productAdditives,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$AdditivesTableOrderingComposer
    extends Composer<_$AppDatabase, $AdditivesTable> {
  $$AdditivesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));
}

class $$AdditivesTableAnnotationComposer
    extends Composer<_$AppDatabase, $AdditivesTable> {
  $$AdditivesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> productAdditivesRefs<T extends Object>(
      Expression<T> Function($$ProductAdditivesTableAnnotationComposer a) f) {
    final $$ProductAdditivesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.productAdditives,
        getReferencedColumn: (t) => t.additiveId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductAdditivesTableAnnotationComposer(
              $db: $db,
              $table: $db.productAdditives,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$AdditivesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AdditivesTable,
    Additive,
    $$AdditivesTableFilterComposer,
    $$AdditivesTableOrderingComposer,
    $$AdditivesTableAnnotationComposer,
    $$AdditivesTableCreateCompanionBuilder,
    $$AdditivesTableUpdateCompanionBuilder,
    (Additive, $$AdditivesTableReferences),
    Additive,
    PrefetchHooks Function({bool productAdditivesRefs})> {
  $$AdditivesTableTableManager(_$AppDatabase db, $AdditivesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AdditivesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AdditivesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AdditivesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
          }) =>
              AdditivesCompanion(
            id: id,
            name: name,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
          }) =>
              AdditivesCompanion.insert(
            id: id,
            name: name,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$AdditivesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({productAdditivesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (productAdditivesRefs) db.productAdditives
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (productAdditivesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$AdditivesTableReferences
                            ._productAdditivesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$AdditivesTableReferences(db, table, p0)
                                .productAdditivesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.additiveId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$AdditivesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AdditivesTable,
    Additive,
    $$AdditivesTableFilterComposer,
    $$AdditivesTableOrderingComposer,
    $$AdditivesTableAnnotationComposer,
    $$AdditivesTableCreateCompanionBuilder,
    $$AdditivesTableUpdateCompanionBuilder,
    (Additive, $$AdditivesTableReferences),
    Additive,
    PrefetchHooks Function({bool productAdditivesRefs})>;
typedef $$AllergensTableCreateCompanionBuilder = AllergensCompanion Function({
  Value<int> id,
  required String name,
});
typedef $$AllergensTableUpdateCompanionBuilder = AllergensCompanion Function({
  Value<int> id,
  Value<String> name,
});

final class $$AllergensTableReferences
    extends BaseReferences<_$AppDatabase, $AllergensTable, Allergen> {
  $$AllergensTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ProductAllergensTable, List<ProductAllergen>>
      _productAllergensRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.productAllergens,
              aliasName: $_aliasNameGenerator(
                  db.allergens.id, db.productAllergens.allergenId));

  $$ProductAllergensTableProcessedTableManager get productAllergensRefs {
    final manager =
        $$ProductAllergensTableTableManager($_db, $_db.productAllergens)
            .filter((f) => f.allergenId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_productAllergensRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$AllergensTableFilterComposer
    extends Composer<_$AppDatabase, $AllergensTable> {
  $$AllergensTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  Expression<bool> productAllergensRefs(
      Expression<bool> Function($$ProductAllergensTableFilterComposer f) f) {
    final $$ProductAllergensTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.productAllergens,
        getReferencedColumn: (t) => t.allergenId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductAllergensTableFilterComposer(
              $db: $db,
              $table: $db.productAllergens,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$AllergensTableOrderingComposer
    extends Composer<_$AppDatabase, $AllergensTable> {
  $$AllergensTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));
}

class $$AllergensTableAnnotationComposer
    extends Composer<_$AppDatabase, $AllergensTable> {
  $$AllergensTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> productAllergensRefs<T extends Object>(
      Expression<T> Function($$ProductAllergensTableAnnotationComposer a) f) {
    final $$ProductAllergensTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.productAllergens,
        getReferencedColumn: (t) => t.allergenId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductAllergensTableAnnotationComposer(
              $db: $db,
              $table: $db.productAllergens,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$AllergensTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AllergensTable,
    Allergen,
    $$AllergensTableFilterComposer,
    $$AllergensTableOrderingComposer,
    $$AllergensTableAnnotationComposer,
    $$AllergensTableCreateCompanionBuilder,
    $$AllergensTableUpdateCompanionBuilder,
    (Allergen, $$AllergensTableReferences),
    Allergen,
    PrefetchHooks Function({bool productAllergensRefs})> {
  $$AllergensTableTableManager(_$AppDatabase db, $AllergensTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AllergensTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AllergensTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AllergensTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
          }) =>
              AllergensCompanion(
            id: id,
            name: name,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
          }) =>
              AllergensCompanion.insert(
            id: id,
            name: name,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$AllergensTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({productAllergensRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (productAllergensRefs) db.productAllergens
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (productAllergensRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$AllergensTableReferences
                            ._productAllergensRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$AllergensTableReferences(db, table, p0)
                                .productAllergensRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.allergenId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$AllergensTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AllergensTable,
    Allergen,
    $$AllergensTableFilterComposer,
    $$AllergensTableOrderingComposer,
    $$AllergensTableAnnotationComposer,
    $$AllergensTableCreateCompanionBuilder,
    $$AllergensTableUpdateCompanionBuilder,
    (Allergen, $$AllergensTableReferences),
    Allergen,
    PrefetchHooks Function({bool productAllergensRefs})>;
typedef $$ProductAllergensTableCreateCompanionBuilder
    = ProductAllergensCompanion Function({
  required String productBarcode,
  required int allergenId,
  Value<int> rowid,
});
typedef $$ProductAllergensTableUpdateCompanionBuilder
    = ProductAllergensCompanion Function({
  Value<String> productBarcode,
  Value<int> allergenId,
  Value<int> rowid,
});

final class $$ProductAllergensTableReferences extends BaseReferences<
    _$AppDatabase, $ProductAllergensTable, ProductAllergen> {
  $$ProductAllergensTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $SavedProductsTable _productBarcodeTable(_$AppDatabase db) =>
      db.savedProducts.createAlias($_aliasNameGenerator(
          db.productAllergens.productBarcode, db.savedProducts.barcode));

  $$SavedProductsTableProcessedTableManager? get productBarcode {
    if ($_item.productBarcode == null) return null;
    final manager = $$SavedProductsTableTableManager($_db, $_db.savedProducts)
        .filter((f) => f.barcode($_item.productBarcode!));
    final item = $_typedResult.readTableOrNull(_productBarcodeTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $AllergensTable _allergenIdTable(_$AppDatabase db) =>
      db.allergens.createAlias($_aliasNameGenerator(
          db.productAllergens.allergenId, db.allergens.id));

  $$AllergensTableProcessedTableManager? get allergenId {
    if ($_item.allergenId == null) return null;
    final manager = $$AllergensTableTableManager($_db, $_db.allergens)
        .filter((f) => f.id($_item.allergenId!));
    final item = $_typedResult.readTableOrNull(_allergenIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ProductAllergensTableFilterComposer
    extends Composer<_$AppDatabase, $ProductAllergensTable> {
  $$ProductAllergensTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$SavedProductsTableFilterComposer get productBarcode {
    final $$SavedProductsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productBarcode,
        referencedTable: $db.savedProducts,
        getReferencedColumn: (t) => t.barcode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SavedProductsTableFilterComposer(
              $db: $db,
              $table: $db.savedProducts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$AllergensTableFilterComposer get allergenId {
    final $$AllergensTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.allergenId,
        referencedTable: $db.allergens,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AllergensTableFilterComposer(
              $db: $db,
              $table: $db.allergens,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ProductAllergensTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductAllergensTable> {
  $$ProductAllergensTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$SavedProductsTableOrderingComposer get productBarcode {
    final $$SavedProductsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productBarcode,
        referencedTable: $db.savedProducts,
        getReferencedColumn: (t) => t.barcode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SavedProductsTableOrderingComposer(
              $db: $db,
              $table: $db.savedProducts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$AllergensTableOrderingComposer get allergenId {
    final $$AllergensTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.allergenId,
        referencedTable: $db.allergens,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AllergensTableOrderingComposer(
              $db: $db,
              $table: $db.allergens,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ProductAllergensTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductAllergensTable> {
  $$ProductAllergensTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$SavedProductsTableAnnotationComposer get productBarcode {
    final $$SavedProductsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productBarcode,
        referencedTable: $db.savedProducts,
        getReferencedColumn: (t) => t.barcode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SavedProductsTableAnnotationComposer(
              $db: $db,
              $table: $db.savedProducts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$AllergensTableAnnotationComposer get allergenId {
    final $$AllergensTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.allergenId,
        referencedTable: $db.allergens,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AllergensTableAnnotationComposer(
              $db: $db,
              $table: $db.allergens,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ProductAllergensTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ProductAllergensTable,
    ProductAllergen,
    $$ProductAllergensTableFilterComposer,
    $$ProductAllergensTableOrderingComposer,
    $$ProductAllergensTableAnnotationComposer,
    $$ProductAllergensTableCreateCompanionBuilder,
    $$ProductAllergensTableUpdateCompanionBuilder,
    (ProductAllergen, $$ProductAllergensTableReferences),
    ProductAllergen,
    PrefetchHooks Function({bool productBarcode, bool allergenId})> {
  $$ProductAllergensTableTableManager(
      _$AppDatabase db, $ProductAllergensTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductAllergensTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductAllergensTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductAllergensTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> productBarcode = const Value.absent(),
            Value<int> allergenId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ProductAllergensCompanion(
            productBarcode: productBarcode,
            allergenId: allergenId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String productBarcode,
            required int allergenId,
            Value<int> rowid = const Value.absent(),
          }) =>
              ProductAllergensCompanion.insert(
            productBarcode: productBarcode,
            allergenId: allergenId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ProductAllergensTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {productBarcode = false, allergenId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (productBarcode) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.productBarcode,
                    referencedTable: $$ProductAllergensTableReferences
                        ._productBarcodeTable(db),
                    referencedColumn: $$ProductAllergensTableReferences
                        ._productBarcodeTable(db)
                        .barcode,
                  ) as T;
                }
                if (allergenId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.allergenId,
                    referencedTable:
                        $$ProductAllergensTableReferences._allergenIdTable(db),
                    referencedColumn: $$ProductAllergensTableReferences
                        ._allergenIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$ProductAllergensTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ProductAllergensTable,
    ProductAllergen,
    $$ProductAllergensTableFilterComposer,
    $$ProductAllergensTableOrderingComposer,
    $$ProductAllergensTableAnnotationComposer,
    $$ProductAllergensTableCreateCompanionBuilder,
    $$ProductAllergensTableUpdateCompanionBuilder,
    (ProductAllergen, $$ProductAllergensTableReferences),
    ProductAllergen,
    PrefetchHooks Function({bool productBarcode, bool allergenId})>;
typedef $$ProductAdditivesTableCreateCompanionBuilder
    = ProductAdditivesCompanion Function({
  required String productBarcode,
  required int additiveId,
  Value<int> rowid,
});
typedef $$ProductAdditivesTableUpdateCompanionBuilder
    = ProductAdditivesCompanion Function({
  Value<String> productBarcode,
  Value<int> additiveId,
  Value<int> rowid,
});

final class $$ProductAdditivesTableReferences extends BaseReferences<
    _$AppDatabase, $ProductAdditivesTable, ProductAdditive> {
  $$ProductAdditivesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $SavedProductsTable _productBarcodeTable(_$AppDatabase db) =>
      db.savedProducts.createAlias($_aliasNameGenerator(
          db.productAdditives.productBarcode, db.savedProducts.barcode));

  $$SavedProductsTableProcessedTableManager? get productBarcode {
    if ($_item.productBarcode == null) return null;
    final manager = $$SavedProductsTableTableManager($_db, $_db.savedProducts)
        .filter((f) => f.barcode($_item.productBarcode!));
    final item = $_typedResult.readTableOrNull(_productBarcodeTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $AdditivesTable _additiveIdTable(_$AppDatabase db) =>
      db.additives.createAlias($_aliasNameGenerator(
          db.productAdditives.additiveId, db.additives.id));

  $$AdditivesTableProcessedTableManager? get additiveId {
    if ($_item.additiveId == null) return null;
    final manager = $$AdditivesTableTableManager($_db, $_db.additives)
        .filter((f) => f.id($_item.additiveId!));
    final item = $_typedResult.readTableOrNull(_additiveIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ProductAdditivesTableFilterComposer
    extends Composer<_$AppDatabase, $ProductAdditivesTable> {
  $$ProductAdditivesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$SavedProductsTableFilterComposer get productBarcode {
    final $$SavedProductsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productBarcode,
        referencedTable: $db.savedProducts,
        getReferencedColumn: (t) => t.barcode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SavedProductsTableFilterComposer(
              $db: $db,
              $table: $db.savedProducts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$AdditivesTableFilterComposer get additiveId {
    final $$AdditivesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.additiveId,
        referencedTable: $db.additives,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AdditivesTableFilterComposer(
              $db: $db,
              $table: $db.additives,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ProductAdditivesTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductAdditivesTable> {
  $$ProductAdditivesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$SavedProductsTableOrderingComposer get productBarcode {
    final $$SavedProductsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productBarcode,
        referencedTable: $db.savedProducts,
        getReferencedColumn: (t) => t.barcode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SavedProductsTableOrderingComposer(
              $db: $db,
              $table: $db.savedProducts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$AdditivesTableOrderingComposer get additiveId {
    final $$AdditivesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.additiveId,
        referencedTable: $db.additives,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AdditivesTableOrderingComposer(
              $db: $db,
              $table: $db.additives,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ProductAdditivesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductAdditivesTable> {
  $$ProductAdditivesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$SavedProductsTableAnnotationComposer get productBarcode {
    final $$SavedProductsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productBarcode,
        referencedTable: $db.savedProducts,
        getReferencedColumn: (t) => t.barcode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SavedProductsTableAnnotationComposer(
              $db: $db,
              $table: $db.savedProducts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$AdditivesTableAnnotationComposer get additiveId {
    final $$AdditivesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.additiveId,
        referencedTable: $db.additives,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AdditivesTableAnnotationComposer(
              $db: $db,
              $table: $db.additives,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ProductAdditivesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ProductAdditivesTable,
    ProductAdditive,
    $$ProductAdditivesTableFilterComposer,
    $$ProductAdditivesTableOrderingComposer,
    $$ProductAdditivesTableAnnotationComposer,
    $$ProductAdditivesTableCreateCompanionBuilder,
    $$ProductAdditivesTableUpdateCompanionBuilder,
    (ProductAdditive, $$ProductAdditivesTableReferences),
    ProductAdditive,
    PrefetchHooks Function({bool productBarcode, bool additiveId})> {
  $$ProductAdditivesTableTableManager(
      _$AppDatabase db, $ProductAdditivesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductAdditivesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductAdditivesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductAdditivesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> productBarcode = const Value.absent(),
            Value<int> additiveId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ProductAdditivesCompanion(
            productBarcode: productBarcode,
            additiveId: additiveId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String productBarcode,
            required int additiveId,
            Value<int> rowid = const Value.absent(),
          }) =>
              ProductAdditivesCompanion.insert(
            productBarcode: productBarcode,
            additiveId: additiveId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ProductAdditivesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {productBarcode = false, additiveId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (productBarcode) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.productBarcode,
                    referencedTable: $$ProductAdditivesTableReferences
                        ._productBarcodeTable(db),
                    referencedColumn: $$ProductAdditivesTableReferences
                        ._productBarcodeTable(db)
                        .barcode,
                  ) as T;
                }
                if (additiveId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.additiveId,
                    referencedTable:
                        $$ProductAdditivesTableReferences._additiveIdTable(db),
                    referencedColumn: $$ProductAdditivesTableReferences
                        ._additiveIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$ProductAdditivesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ProductAdditivesTable,
    ProductAdditive,
    $$ProductAdditivesTableFilterComposer,
    $$ProductAdditivesTableOrderingComposer,
    $$ProductAdditivesTableAnnotationComposer,
    $$ProductAdditivesTableCreateCompanionBuilder,
    $$ProductAdditivesTableUpdateCompanionBuilder,
    (ProductAdditive, $$ProductAdditivesTableReferences),
    ProductAdditive,
    PrefetchHooks Function({bool productBarcode, bool additiveId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$NutrientTypesTableTableManager get nutrientTypes =>
      $$NutrientTypesTableTableManager(_db, _db.nutrientTypes);
  $$SavedProductsTableTableManager get savedProducts =>
      $$SavedProductsTableTableManager(_db, _db.savedProducts);
  $$NutrimentsTableTableManager get nutriments =>
      $$NutrimentsTableTableManager(_db, _db.nutriments);
  $$MealTableTableManager get meal => $$MealTableTableManager(_db, _db.meal);
  $$MealPeriodsTableTableManager get mealPeriods =>
      $$MealPeriodsTableTableManager(_db, _db.mealPeriods);
  $$MealToProductTableTableManager get mealToProduct =>
      $$MealToProductTableTableManager(_db, _db.mealToProduct);
  $$MealPeriodsToMealTableTableManager get mealPeriodsToMeal =>
      $$MealPeriodsToMealTableTableManager(_db, _db.mealPeriodsToMeal);
  $$MealPeriodsToSavedProductsTableTableManager
      get mealPeriodsToSavedProducts =>
          $$MealPeriodsToSavedProductsTableTableManager(
              _db, _db.mealPeriodsToSavedProducts);
  $$AdditivesTableTableManager get additives =>
      $$AdditivesTableTableManager(_db, _db.additives);
  $$AllergensTableTableManager get allergens =>
      $$AllergensTableTableManager(_db, _db.allergens);
  $$ProductAllergensTableTableManager get productAllergens =>
      $$ProductAllergensTableTableManager(_db, _db.productAllergens);
  $$ProductAdditivesTableTableManager get productAdditives =>
      $$ProductAdditivesTableTableManager(_db, _db.productAdditives);
}
