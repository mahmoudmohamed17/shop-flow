// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ProductsTableTable extends ProductsTable
    with TableInfo<$ProductsTableTable, ProductsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _productMeta =
      const VerificationMeta('product');
  @override
  late final GeneratedColumnWithTypeConverter<ProductEntity, String> product =
      GeneratedColumn<String>('product', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<ProductEntity>($ProductsTableTable.$converterproduct);
  @override
  List<GeneratedColumn> get $columns => [id, product];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'products_table';
  @override
  VerificationContext validateIntegrity(Insertable<ProductsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    context.handle(_productMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      product: $ProductsTableTable.$converterproduct.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product'])!),
    );
  }

  @override
  $ProductsTableTable createAlias(String alias) {
    return $ProductsTableTable(attachedDatabase, alias);
  }

  static TypeConverter<ProductEntity, String> $converterproduct =
      ProductConverter();
}

class ProductsTableData extends DataClass
    implements Insertable<ProductsTableData> {
  final int id;
  final ProductEntity product;
  const ProductsTableData({required this.id, required this.product});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    {
      map['product'] = Variable<String>(
          $ProductsTableTable.$converterproduct.toSql(product));
    }
    return map;
  }

  ProductsTableCompanion toCompanion(bool nullToAbsent) {
    return ProductsTableCompanion(
      id: Value(id),
      product: Value(product),
    );
  }

  factory ProductsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductsTableData(
      id: serializer.fromJson<int>(json['id']),
      product: serializer.fromJson<ProductEntity>(json['product']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'product': serializer.toJson<ProductEntity>(product),
    };
  }

  ProductsTableData copyWith({int? id, ProductEntity? product}) =>
      ProductsTableData(
        id: id ?? this.id,
        product: product ?? this.product,
      );
  ProductsTableData copyWithCompanion(ProductsTableCompanion data) {
    return ProductsTableData(
      id: data.id.present ? data.id.value : this.id,
      product: data.product.present ? data.product.value : this.product,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductsTableData(')
          ..write('id: $id, ')
          ..write('product: $product')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, product);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductsTableData &&
          other.id == this.id &&
          other.product == this.product);
}

class ProductsTableCompanion extends UpdateCompanion<ProductsTableData> {
  final Value<int> id;
  final Value<ProductEntity> product;
  const ProductsTableCompanion({
    this.id = const Value.absent(),
    this.product = const Value.absent(),
  });
  ProductsTableCompanion.insert({
    this.id = const Value.absent(),
    required ProductEntity product,
  }) : product = Value(product);
  static Insertable<ProductsTableData> custom({
    Expression<int>? id,
    Expression<String>? product,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (product != null) 'product': product,
    });
  }

  ProductsTableCompanion copyWith(
      {Value<int>? id, Value<ProductEntity>? product}) {
    return ProductsTableCompanion(
      id: id ?? this.id,
      product: product ?? this.product,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (product.present) {
      map['product'] = Variable<String>(
          $ProductsTableTable.$converterproduct.toSql(product.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsTableCompanion(')
          ..write('id: $id, ')
          ..write('product: $product')
          ..write(')'))
        .toString();
  }
}

class $BeautyProductsTableTable extends BeautyProductsTable
    with TableInfo<$BeautyProductsTableTable, BeautyProductsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BeautyProductsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _productMeta =
      const VerificationMeta('product');
  @override
  late final GeneratedColumnWithTypeConverter<ProductEntity, String> product =
      GeneratedColumn<String>('product', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<ProductEntity>(
              $BeautyProductsTableTable.$converterproduct);
  @override
  List<GeneratedColumn> get $columns => [id, product];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'beauty_products_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<BeautyProductsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    context.handle(_productMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BeautyProductsTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BeautyProductsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      product: $BeautyProductsTableTable.$converterproduct.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.string, data['${effectivePrefix}product'])!),
    );
  }

  @override
  $BeautyProductsTableTable createAlias(String alias) {
    return $BeautyProductsTableTable(attachedDatabase, alias);
  }

  static TypeConverter<ProductEntity, String> $converterproduct =
      ProductConverter();
}

class BeautyProductsTableData extends DataClass
    implements Insertable<BeautyProductsTableData> {
  final int id;
  final ProductEntity product;
  const BeautyProductsTableData({required this.id, required this.product});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    {
      map['product'] = Variable<String>(
          $BeautyProductsTableTable.$converterproduct.toSql(product));
    }
    return map;
  }

  BeautyProductsTableCompanion toCompanion(bool nullToAbsent) {
    return BeautyProductsTableCompanion(
      id: Value(id),
      product: Value(product),
    );
  }

  factory BeautyProductsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BeautyProductsTableData(
      id: serializer.fromJson<int>(json['id']),
      product: serializer.fromJson<ProductEntity>(json['product']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'product': serializer.toJson<ProductEntity>(product),
    };
  }

  BeautyProductsTableData copyWith({int? id, ProductEntity? product}) =>
      BeautyProductsTableData(
        id: id ?? this.id,
        product: product ?? this.product,
      );
  BeautyProductsTableData copyWithCompanion(BeautyProductsTableCompanion data) {
    return BeautyProductsTableData(
      id: data.id.present ? data.id.value : this.id,
      product: data.product.present ? data.product.value : this.product,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BeautyProductsTableData(')
          ..write('id: $id, ')
          ..write('product: $product')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, product);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BeautyProductsTableData &&
          other.id == this.id &&
          other.product == this.product);
}

class BeautyProductsTableCompanion
    extends UpdateCompanion<BeautyProductsTableData> {
  final Value<int> id;
  final Value<ProductEntity> product;
  const BeautyProductsTableCompanion({
    this.id = const Value.absent(),
    this.product = const Value.absent(),
  });
  BeautyProductsTableCompanion.insert({
    this.id = const Value.absent(),
    required ProductEntity product,
  }) : product = Value(product);
  static Insertable<BeautyProductsTableData> custom({
    Expression<int>? id,
    Expression<String>? product,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (product != null) 'product': product,
    });
  }

  BeautyProductsTableCompanion copyWith(
      {Value<int>? id, Value<ProductEntity>? product}) {
    return BeautyProductsTableCompanion(
      id: id ?? this.id,
      product: product ?? this.product,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (product.present) {
      map['product'] = Variable<String>(
          $BeautyProductsTableTable.$converterproduct.toSql(product.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BeautyProductsTableCompanion(')
          ..write('id: $id, ')
          ..write('product: $product')
          ..write(')'))
        .toString();
  }
}

class $PerfumesProductsTableTable extends PerfumesProductsTable
    with TableInfo<$PerfumesProductsTableTable, PerfumesProductsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PerfumesProductsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _productMeta =
      const VerificationMeta('product');
  @override
  late final GeneratedColumnWithTypeConverter<ProductEntity, String> product =
      GeneratedColumn<String>('product', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<ProductEntity>(
              $PerfumesProductsTableTable.$converterproduct);
  @override
  List<GeneratedColumn> get $columns => [id, product];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'perfumes_products_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<PerfumesProductsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    context.handle(_productMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PerfumesProductsTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PerfumesProductsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      product: $PerfumesProductsTableTable.$converterproduct.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.string, data['${effectivePrefix}product'])!),
    );
  }

  @override
  $PerfumesProductsTableTable createAlias(String alias) {
    return $PerfumesProductsTableTable(attachedDatabase, alias);
  }

  static TypeConverter<ProductEntity, String> $converterproduct =
      ProductConverter();
}

class PerfumesProductsTableData extends DataClass
    implements Insertable<PerfumesProductsTableData> {
  final int id;
  final ProductEntity product;
  const PerfumesProductsTableData({required this.id, required this.product});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    {
      map['product'] = Variable<String>(
          $PerfumesProductsTableTable.$converterproduct.toSql(product));
    }
    return map;
  }

  PerfumesProductsTableCompanion toCompanion(bool nullToAbsent) {
    return PerfumesProductsTableCompanion(
      id: Value(id),
      product: Value(product),
    );
  }

  factory PerfumesProductsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PerfumesProductsTableData(
      id: serializer.fromJson<int>(json['id']),
      product: serializer.fromJson<ProductEntity>(json['product']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'product': serializer.toJson<ProductEntity>(product),
    };
  }

  PerfumesProductsTableData copyWith({int? id, ProductEntity? product}) =>
      PerfumesProductsTableData(
        id: id ?? this.id,
        product: product ?? this.product,
      );
  PerfumesProductsTableData copyWithCompanion(
      PerfumesProductsTableCompanion data) {
    return PerfumesProductsTableData(
      id: data.id.present ? data.id.value : this.id,
      product: data.product.present ? data.product.value : this.product,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PerfumesProductsTableData(')
          ..write('id: $id, ')
          ..write('product: $product')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, product);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PerfumesProductsTableData &&
          other.id == this.id &&
          other.product == this.product);
}

class PerfumesProductsTableCompanion
    extends UpdateCompanion<PerfumesProductsTableData> {
  final Value<int> id;
  final Value<ProductEntity> product;
  const PerfumesProductsTableCompanion({
    this.id = const Value.absent(),
    this.product = const Value.absent(),
  });
  PerfumesProductsTableCompanion.insert({
    this.id = const Value.absent(),
    required ProductEntity product,
  }) : product = Value(product);
  static Insertable<PerfumesProductsTableData> custom({
    Expression<int>? id,
    Expression<String>? product,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (product != null) 'product': product,
    });
  }

  PerfumesProductsTableCompanion copyWith(
      {Value<int>? id, Value<ProductEntity>? product}) {
    return PerfumesProductsTableCompanion(
      id: id ?? this.id,
      product: product ?? this.product,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (product.present) {
      map['product'] = Variable<String>(
          $PerfumesProductsTableTable.$converterproduct.toSql(product.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PerfumesProductsTableCompanion(')
          ..write('id: $id, ')
          ..write('product: $product')
          ..write(')'))
        .toString();
  }
}

class $FurnituresProductsTableTable extends FurnituresProductsTable
    with TableInfo<$FurnituresProductsTableTable, FurnituresProductsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FurnituresProductsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _productMeta =
      const VerificationMeta('product');
  @override
  late final GeneratedColumnWithTypeConverter<ProductEntity, String> product =
      GeneratedColumn<String>('product', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<ProductEntity>(
              $FurnituresProductsTableTable.$converterproduct);
  @override
  List<GeneratedColumn> get $columns => [id, product];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'furnitures_products_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<FurnituresProductsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    context.handle(_productMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FurnituresProductsTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FurnituresProductsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      product: $FurnituresProductsTableTable.$converterproduct.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.string, data['${effectivePrefix}product'])!),
    );
  }

  @override
  $FurnituresProductsTableTable createAlias(String alias) {
    return $FurnituresProductsTableTable(attachedDatabase, alias);
  }

  static TypeConverter<ProductEntity, String> $converterproduct =
      ProductConverter();
}

class FurnituresProductsTableData extends DataClass
    implements Insertable<FurnituresProductsTableData> {
  final int id;
  final ProductEntity product;
  const FurnituresProductsTableData({required this.id, required this.product});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    {
      map['product'] = Variable<String>(
          $FurnituresProductsTableTable.$converterproduct.toSql(product));
    }
    return map;
  }

  FurnituresProductsTableCompanion toCompanion(bool nullToAbsent) {
    return FurnituresProductsTableCompanion(
      id: Value(id),
      product: Value(product),
    );
  }

  factory FurnituresProductsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FurnituresProductsTableData(
      id: serializer.fromJson<int>(json['id']),
      product: serializer.fromJson<ProductEntity>(json['product']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'product': serializer.toJson<ProductEntity>(product),
    };
  }

  FurnituresProductsTableData copyWith({int? id, ProductEntity? product}) =>
      FurnituresProductsTableData(
        id: id ?? this.id,
        product: product ?? this.product,
      );
  FurnituresProductsTableData copyWithCompanion(
      FurnituresProductsTableCompanion data) {
    return FurnituresProductsTableData(
      id: data.id.present ? data.id.value : this.id,
      product: data.product.present ? data.product.value : this.product,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FurnituresProductsTableData(')
          ..write('id: $id, ')
          ..write('product: $product')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, product);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FurnituresProductsTableData &&
          other.id == this.id &&
          other.product == this.product);
}

class FurnituresProductsTableCompanion
    extends UpdateCompanion<FurnituresProductsTableData> {
  final Value<int> id;
  final Value<ProductEntity> product;
  const FurnituresProductsTableCompanion({
    this.id = const Value.absent(),
    this.product = const Value.absent(),
  });
  FurnituresProductsTableCompanion.insert({
    this.id = const Value.absent(),
    required ProductEntity product,
  }) : product = Value(product);
  static Insertable<FurnituresProductsTableData> custom({
    Expression<int>? id,
    Expression<String>? product,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (product != null) 'product': product,
    });
  }

  FurnituresProductsTableCompanion copyWith(
      {Value<int>? id, Value<ProductEntity>? product}) {
    return FurnituresProductsTableCompanion(
      id: id ?? this.id,
      product: product ?? this.product,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (product.present) {
      map['product'] = Variable<String>(
          $FurnituresProductsTableTable.$converterproduct.toSql(product.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FurnituresProductsTableCompanion(')
          ..write('id: $id, ')
          ..write('product: $product')
          ..write(')'))
        .toString();
  }
}

class $GroceriesProductsTableTable extends GroceriesProductsTable
    with TableInfo<$GroceriesProductsTableTable, GroceriesProductsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GroceriesProductsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _productMeta =
      const VerificationMeta('product');
  @override
  late final GeneratedColumnWithTypeConverter<ProductEntity, String> product =
      GeneratedColumn<String>('product', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<ProductEntity>(
              $GroceriesProductsTableTable.$converterproduct);
  @override
  List<GeneratedColumn> get $columns => [id, product];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'groceries_products_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<GroceriesProductsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    context.handle(_productMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GroceriesProductsTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GroceriesProductsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      product: $GroceriesProductsTableTable.$converterproduct.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.string, data['${effectivePrefix}product'])!),
    );
  }

  @override
  $GroceriesProductsTableTable createAlias(String alias) {
    return $GroceriesProductsTableTable(attachedDatabase, alias);
  }

  static TypeConverter<ProductEntity, String> $converterproduct =
      ProductConverter();
}

class GroceriesProductsTableData extends DataClass
    implements Insertable<GroceriesProductsTableData> {
  final int id;
  final ProductEntity product;
  const GroceriesProductsTableData({required this.id, required this.product});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    {
      map['product'] = Variable<String>(
          $GroceriesProductsTableTable.$converterproduct.toSql(product));
    }
    return map;
  }

  GroceriesProductsTableCompanion toCompanion(bool nullToAbsent) {
    return GroceriesProductsTableCompanion(
      id: Value(id),
      product: Value(product),
    );
  }

  factory GroceriesProductsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GroceriesProductsTableData(
      id: serializer.fromJson<int>(json['id']),
      product: serializer.fromJson<ProductEntity>(json['product']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'product': serializer.toJson<ProductEntity>(product),
    };
  }

  GroceriesProductsTableData copyWith({int? id, ProductEntity? product}) =>
      GroceriesProductsTableData(
        id: id ?? this.id,
        product: product ?? this.product,
      );
  GroceriesProductsTableData copyWithCompanion(
      GroceriesProductsTableCompanion data) {
    return GroceriesProductsTableData(
      id: data.id.present ? data.id.value : this.id,
      product: data.product.present ? data.product.value : this.product,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GroceriesProductsTableData(')
          ..write('id: $id, ')
          ..write('product: $product')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, product);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GroceriesProductsTableData &&
          other.id == this.id &&
          other.product == this.product);
}

class GroceriesProductsTableCompanion
    extends UpdateCompanion<GroceriesProductsTableData> {
  final Value<int> id;
  final Value<ProductEntity> product;
  const GroceriesProductsTableCompanion({
    this.id = const Value.absent(),
    this.product = const Value.absent(),
  });
  GroceriesProductsTableCompanion.insert({
    this.id = const Value.absent(),
    required ProductEntity product,
  }) : product = Value(product);
  static Insertable<GroceriesProductsTableData> custom({
    Expression<int>? id,
    Expression<String>? product,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (product != null) 'product': product,
    });
  }

  GroceriesProductsTableCompanion copyWith(
      {Value<int>? id, Value<ProductEntity>? product}) {
    return GroceriesProductsTableCompanion(
      id: id ?? this.id,
      product: product ?? this.product,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (product.present) {
      map['product'] = Variable<String>(
          $GroceriesProductsTableTable.$converterproduct.toSql(product.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GroceriesProductsTableCompanion(')
          ..write('id: $id, ')
          ..write('product: $product')
          ..write(')'))
        .toString();
  }
}

class $CartProductsTableTable extends CartProductsTable
    with TableInfo<$CartProductsTableTable, CartProductsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CartProductsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _productMeta =
      const VerificationMeta('product');
  @override
  late final GeneratedColumnWithTypeConverter<ProductEntity, String> product =
      GeneratedColumn<String>('product', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<ProductEntity>(
              $CartProductsTableTable.$converterproduct);
  @override
  List<GeneratedColumn> get $columns => [id, product];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cart_products_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<CartProductsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    context.handle(_productMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CartProductsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CartProductsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      product: $CartProductsTableTable.$converterproduct.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.string, data['${effectivePrefix}product'])!),
    );
  }

  @override
  $CartProductsTableTable createAlias(String alias) {
    return $CartProductsTableTable(attachedDatabase, alias);
  }

  static TypeConverter<ProductEntity, String> $converterproduct =
      ProductConverter();
}

class CartProductsTableData extends DataClass
    implements Insertable<CartProductsTableData> {
  final int id;
  final ProductEntity product;
  const CartProductsTableData({required this.id, required this.product});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    {
      map['product'] = Variable<String>(
          $CartProductsTableTable.$converterproduct.toSql(product));
    }
    return map;
  }

  CartProductsTableCompanion toCompanion(bool nullToAbsent) {
    return CartProductsTableCompanion(
      id: Value(id),
      product: Value(product),
    );
  }

  factory CartProductsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CartProductsTableData(
      id: serializer.fromJson<int>(json['id']),
      product: serializer.fromJson<ProductEntity>(json['product']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'product': serializer.toJson<ProductEntity>(product),
    };
  }

  CartProductsTableData copyWith({int? id, ProductEntity? product}) =>
      CartProductsTableData(
        id: id ?? this.id,
        product: product ?? this.product,
      );
  CartProductsTableData copyWithCompanion(CartProductsTableCompanion data) {
    return CartProductsTableData(
      id: data.id.present ? data.id.value : this.id,
      product: data.product.present ? data.product.value : this.product,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CartProductsTableData(')
          ..write('id: $id, ')
          ..write('product: $product')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, product);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CartProductsTableData &&
          other.id == this.id &&
          other.product == this.product);
}

class CartProductsTableCompanion
    extends UpdateCompanion<CartProductsTableData> {
  final Value<int> id;
  final Value<ProductEntity> product;
  const CartProductsTableCompanion({
    this.id = const Value.absent(),
    this.product = const Value.absent(),
  });
  CartProductsTableCompanion.insert({
    this.id = const Value.absent(),
    required ProductEntity product,
  }) : product = Value(product);
  static Insertable<CartProductsTableData> custom({
    Expression<int>? id,
    Expression<String>? product,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (product != null) 'product': product,
    });
  }

  CartProductsTableCompanion copyWith(
      {Value<int>? id, Value<ProductEntity>? product}) {
    return CartProductsTableCompanion(
      id: id ?? this.id,
      product: product ?? this.product,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (product.present) {
      map['product'] = Variable<String>(
          $CartProductsTableTable.$converterproduct.toSql(product.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CartProductsTableCompanion(')
          ..write('id: $id, ')
          ..write('product: $product')
          ..write(')'))
        .toString();
  }
}

class $FavoritesProductTableTable extends FavoritesProductTable
    with TableInfo<$FavoritesProductTableTable, FavoritesProductTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoritesProductTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _productMeta =
      const VerificationMeta('product');
  @override
  late final GeneratedColumnWithTypeConverter<ProductEntity, String> product =
      GeneratedColumn<String>('product', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<ProductEntity>(
              $FavoritesProductTableTable.$converterproduct);
  @override
  List<GeneratedColumn> get $columns => [id, product];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorites_product_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<FavoritesProductTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    context.handle(_productMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FavoritesProductTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FavoritesProductTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      product: $FavoritesProductTableTable.$converterproduct.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.string, data['${effectivePrefix}product'])!),
    );
  }

  @override
  $FavoritesProductTableTable createAlias(String alias) {
    return $FavoritesProductTableTable(attachedDatabase, alias);
  }

  static TypeConverter<ProductEntity, String> $converterproduct =
      ProductConverter();
}

class FavoritesProductTableData extends DataClass
    implements Insertable<FavoritesProductTableData> {
  final int id;
  final ProductEntity product;
  const FavoritesProductTableData({required this.id, required this.product});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    {
      map['product'] = Variable<String>(
          $FavoritesProductTableTable.$converterproduct.toSql(product));
    }
    return map;
  }

  FavoritesProductTableCompanion toCompanion(bool nullToAbsent) {
    return FavoritesProductTableCompanion(
      id: Value(id),
      product: Value(product),
    );
  }

  factory FavoritesProductTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FavoritesProductTableData(
      id: serializer.fromJson<int>(json['id']),
      product: serializer.fromJson<ProductEntity>(json['product']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'product': serializer.toJson<ProductEntity>(product),
    };
  }

  FavoritesProductTableData copyWith({int? id, ProductEntity? product}) =>
      FavoritesProductTableData(
        id: id ?? this.id,
        product: product ?? this.product,
      );
  FavoritesProductTableData copyWithCompanion(
      FavoritesProductTableCompanion data) {
    return FavoritesProductTableData(
      id: data.id.present ? data.id.value : this.id,
      product: data.product.present ? data.product.value : this.product,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FavoritesProductTableData(')
          ..write('id: $id, ')
          ..write('product: $product')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, product);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoritesProductTableData &&
          other.id == this.id &&
          other.product == this.product);
}

class FavoritesProductTableCompanion
    extends UpdateCompanion<FavoritesProductTableData> {
  final Value<int> id;
  final Value<ProductEntity> product;
  const FavoritesProductTableCompanion({
    this.id = const Value.absent(),
    this.product = const Value.absent(),
  });
  FavoritesProductTableCompanion.insert({
    this.id = const Value.absent(),
    required ProductEntity product,
  }) : product = Value(product);
  static Insertable<FavoritesProductTableData> custom({
    Expression<int>? id,
    Expression<String>? product,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (product != null) 'product': product,
    });
  }

  FavoritesProductTableCompanion copyWith(
      {Value<int>? id, Value<ProductEntity>? product}) {
    return FavoritesProductTableCompanion(
      id: id ?? this.id,
      product: product ?? this.product,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (product.present) {
      map['product'] = Variable<String>(
          $FavoritesProductTableTable.$converterproduct.toSql(product.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoritesProductTableCompanion(')
          ..write('id: $id, ')
          ..write('product: $product')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ProductsTableTable productsTable = $ProductsTableTable(this);
  late final $BeautyProductsTableTable beautyProductsTable =
      $BeautyProductsTableTable(this);
  late final $PerfumesProductsTableTable perfumesProductsTable =
      $PerfumesProductsTableTable(this);
  late final $FurnituresProductsTableTable furnituresProductsTable =
      $FurnituresProductsTableTable(this);
  late final $GroceriesProductsTableTable groceriesProductsTable =
      $GroceriesProductsTableTable(this);
  late final $CartProductsTableTable cartProductsTable =
      $CartProductsTableTable(this);
  late final $FavoritesProductTableTable favoritesProductTable =
      $FavoritesProductTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        productsTable,
        beautyProductsTable,
        perfumesProductsTable,
        furnituresProductsTable,
        groceriesProductsTable,
        cartProductsTable,
        favoritesProductTable
      ];
}

typedef $$ProductsTableTableCreateCompanionBuilder = ProductsTableCompanion
    Function({
  Value<int> id,
  required ProductEntity product,
});
typedef $$ProductsTableTableUpdateCompanionBuilder = ProductsTableCompanion
    Function({
  Value<int> id,
  Value<ProductEntity> product,
});

class $$ProductsTableTableFilterComposer
    extends Composer<_$AppDatabase, $ProductsTableTable> {
  $$ProductsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<ProductEntity, ProductEntity, String>
      get product => $composableBuilder(
          column: $table.product,
          builder: (column) => ColumnWithTypeConverterFilters(column));
}

class $$ProductsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductsTableTable> {
  $$ProductsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get product => $composableBuilder(
      column: $table.product, builder: (column) => ColumnOrderings(column));
}

class $$ProductsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductsTableTable> {
  $$ProductsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ProductEntity, String> get product =>
      $composableBuilder(column: $table.product, builder: (column) => column);
}

class $$ProductsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ProductsTableTable,
    ProductsTableData,
    $$ProductsTableTableFilterComposer,
    $$ProductsTableTableOrderingComposer,
    $$ProductsTableTableAnnotationComposer,
    $$ProductsTableTableCreateCompanionBuilder,
    $$ProductsTableTableUpdateCompanionBuilder,
    (
      ProductsTableData,
      BaseReferences<_$AppDatabase, $ProductsTableTable, ProductsTableData>
    ),
    ProductsTableData,
    PrefetchHooks Function()> {
  $$ProductsTableTableTableManager(_$AppDatabase db, $ProductsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<ProductEntity> product = const Value.absent(),
          }) =>
              ProductsTableCompanion(
            id: id,
            product: product,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required ProductEntity product,
          }) =>
              ProductsTableCompanion.insert(
            id: id,
            product: product,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ProductsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ProductsTableTable,
    ProductsTableData,
    $$ProductsTableTableFilterComposer,
    $$ProductsTableTableOrderingComposer,
    $$ProductsTableTableAnnotationComposer,
    $$ProductsTableTableCreateCompanionBuilder,
    $$ProductsTableTableUpdateCompanionBuilder,
    (
      ProductsTableData,
      BaseReferences<_$AppDatabase, $ProductsTableTable, ProductsTableData>
    ),
    ProductsTableData,
    PrefetchHooks Function()>;
typedef $$BeautyProductsTableTableCreateCompanionBuilder
    = BeautyProductsTableCompanion Function({
  Value<int> id,
  required ProductEntity product,
});
typedef $$BeautyProductsTableTableUpdateCompanionBuilder
    = BeautyProductsTableCompanion Function({
  Value<int> id,
  Value<ProductEntity> product,
});

class $$BeautyProductsTableTableFilterComposer
    extends Composer<_$AppDatabase, $BeautyProductsTableTable> {
  $$BeautyProductsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<ProductEntity, ProductEntity, String>
      get product => $composableBuilder(
          column: $table.product,
          builder: (column) => ColumnWithTypeConverterFilters(column));
}

class $$BeautyProductsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $BeautyProductsTableTable> {
  $$BeautyProductsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get product => $composableBuilder(
      column: $table.product, builder: (column) => ColumnOrderings(column));
}

class $$BeautyProductsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $BeautyProductsTableTable> {
  $$BeautyProductsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ProductEntity, String> get product =>
      $composableBuilder(column: $table.product, builder: (column) => column);
}

class $$BeautyProductsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BeautyProductsTableTable,
    BeautyProductsTableData,
    $$BeautyProductsTableTableFilterComposer,
    $$BeautyProductsTableTableOrderingComposer,
    $$BeautyProductsTableTableAnnotationComposer,
    $$BeautyProductsTableTableCreateCompanionBuilder,
    $$BeautyProductsTableTableUpdateCompanionBuilder,
    (
      BeautyProductsTableData,
      BaseReferences<_$AppDatabase, $BeautyProductsTableTable,
          BeautyProductsTableData>
    ),
    BeautyProductsTableData,
    PrefetchHooks Function()> {
  $$BeautyProductsTableTableTableManager(
      _$AppDatabase db, $BeautyProductsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BeautyProductsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BeautyProductsTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BeautyProductsTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<ProductEntity> product = const Value.absent(),
          }) =>
              BeautyProductsTableCompanion(
            id: id,
            product: product,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required ProductEntity product,
          }) =>
              BeautyProductsTableCompanion.insert(
            id: id,
            product: product,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$BeautyProductsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $BeautyProductsTableTable,
    BeautyProductsTableData,
    $$BeautyProductsTableTableFilterComposer,
    $$BeautyProductsTableTableOrderingComposer,
    $$BeautyProductsTableTableAnnotationComposer,
    $$BeautyProductsTableTableCreateCompanionBuilder,
    $$BeautyProductsTableTableUpdateCompanionBuilder,
    (
      BeautyProductsTableData,
      BaseReferences<_$AppDatabase, $BeautyProductsTableTable,
          BeautyProductsTableData>
    ),
    BeautyProductsTableData,
    PrefetchHooks Function()>;
typedef $$PerfumesProductsTableTableCreateCompanionBuilder
    = PerfumesProductsTableCompanion Function({
  Value<int> id,
  required ProductEntity product,
});
typedef $$PerfumesProductsTableTableUpdateCompanionBuilder
    = PerfumesProductsTableCompanion Function({
  Value<int> id,
  Value<ProductEntity> product,
});

class $$PerfumesProductsTableTableFilterComposer
    extends Composer<_$AppDatabase, $PerfumesProductsTableTable> {
  $$PerfumesProductsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<ProductEntity, ProductEntity, String>
      get product => $composableBuilder(
          column: $table.product,
          builder: (column) => ColumnWithTypeConverterFilters(column));
}

class $$PerfumesProductsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $PerfumesProductsTableTable> {
  $$PerfumesProductsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get product => $composableBuilder(
      column: $table.product, builder: (column) => ColumnOrderings(column));
}

class $$PerfumesProductsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $PerfumesProductsTableTable> {
  $$PerfumesProductsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ProductEntity, String> get product =>
      $composableBuilder(column: $table.product, builder: (column) => column);
}

class $$PerfumesProductsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PerfumesProductsTableTable,
    PerfumesProductsTableData,
    $$PerfumesProductsTableTableFilterComposer,
    $$PerfumesProductsTableTableOrderingComposer,
    $$PerfumesProductsTableTableAnnotationComposer,
    $$PerfumesProductsTableTableCreateCompanionBuilder,
    $$PerfumesProductsTableTableUpdateCompanionBuilder,
    (
      PerfumesProductsTableData,
      BaseReferences<_$AppDatabase, $PerfumesProductsTableTable,
          PerfumesProductsTableData>
    ),
    PerfumesProductsTableData,
    PrefetchHooks Function()> {
  $$PerfumesProductsTableTableTableManager(
      _$AppDatabase db, $PerfumesProductsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PerfumesProductsTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$PerfumesProductsTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PerfumesProductsTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<ProductEntity> product = const Value.absent(),
          }) =>
              PerfumesProductsTableCompanion(
            id: id,
            product: product,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required ProductEntity product,
          }) =>
              PerfumesProductsTableCompanion.insert(
            id: id,
            product: product,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PerfumesProductsTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $PerfumesProductsTableTable,
        PerfumesProductsTableData,
        $$PerfumesProductsTableTableFilterComposer,
        $$PerfumesProductsTableTableOrderingComposer,
        $$PerfumesProductsTableTableAnnotationComposer,
        $$PerfumesProductsTableTableCreateCompanionBuilder,
        $$PerfumesProductsTableTableUpdateCompanionBuilder,
        (
          PerfumesProductsTableData,
          BaseReferences<_$AppDatabase, $PerfumesProductsTableTable,
              PerfumesProductsTableData>
        ),
        PerfumesProductsTableData,
        PrefetchHooks Function()>;
typedef $$FurnituresProductsTableTableCreateCompanionBuilder
    = FurnituresProductsTableCompanion Function({
  Value<int> id,
  required ProductEntity product,
});
typedef $$FurnituresProductsTableTableUpdateCompanionBuilder
    = FurnituresProductsTableCompanion Function({
  Value<int> id,
  Value<ProductEntity> product,
});

class $$FurnituresProductsTableTableFilterComposer
    extends Composer<_$AppDatabase, $FurnituresProductsTableTable> {
  $$FurnituresProductsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<ProductEntity, ProductEntity, String>
      get product => $composableBuilder(
          column: $table.product,
          builder: (column) => ColumnWithTypeConverterFilters(column));
}

class $$FurnituresProductsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $FurnituresProductsTableTable> {
  $$FurnituresProductsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get product => $composableBuilder(
      column: $table.product, builder: (column) => ColumnOrderings(column));
}

class $$FurnituresProductsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $FurnituresProductsTableTable> {
  $$FurnituresProductsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ProductEntity, String> get product =>
      $composableBuilder(column: $table.product, builder: (column) => column);
}

class $$FurnituresProductsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FurnituresProductsTableTable,
    FurnituresProductsTableData,
    $$FurnituresProductsTableTableFilterComposer,
    $$FurnituresProductsTableTableOrderingComposer,
    $$FurnituresProductsTableTableAnnotationComposer,
    $$FurnituresProductsTableTableCreateCompanionBuilder,
    $$FurnituresProductsTableTableUpdateCompanionBuilder,
    (
      FurnituresProductsTableData,
      BaseReferences<_$AppDatabase, $FurnituresProductsTableTable,
          FurnituresProductsTableData>
    ),
    FurnituresProductsTableData,
    PrefetchHooks Function()> {
  $$FurnituresProductsTableTableTableManager(
      _$AppDatabase db, $FurnituresProductsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FurnituresProductsTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$FurnituresProductsTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FurnituresProductsTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<ProductEntity> product = const Value.absent(),
          }) =>
              FurnituresProductsTableCompanion(
            id: id,
            product: product,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required ProductEntity product,
          }) =>
              FurnituresProductsTableCompanion.insert(
            id: id,
            product: product,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$FurnituresProductsTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $FurnituresProductsTableTable,
        FurnituresProductsTableData,
        $$FurnituresProductsTableTableFilterComposer,
        $$FurnituresProductsTableTableOrderingComposer,
        $$FurnituresProductsTableTableAnnotationComposer,
        $$FurnituresProductsTableTableCreateCompanionBuilder,
        $$FurnituresProductsTableTableUpdateCompanionBuilder,
        (
          FurnituresProductsTableData,
          BaseReferences<_$AppDatabase, $FurnituresProductsTableTable,
              FurnituresProductsTableData>
        ),
        FurnituresProductsTableData,
        PrefetchHooks Function()>;
typedef $$GroceriesProductsTableTableCreateCompanionBuilder
    = GroceriesProductsTableCompanion Function({
  Value<int> id,
  required ProductEntity product,
});
typedef $$GroceriesProductsTableTableUpdateCompanionBuilder
    = GroceriesProductsTableCompanion Function({
  Value<int> id,
  Value<ProductEntity> product,
});

class $$GroceriesProductsTableTableFilterComposer
    extends Composer<_$AppDatabase, $GroceriesProductsTableTable> {
  $$GroceriesProductsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<ProductEntity, ProductEntity, String>
      get product => $composableBuilder(
          column: $table.product,
          builder: (column) => ColumnWithTypeConverterFilters(column));
}

class $$GroceriesProductsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $GroceriesProductsTableTable> {
  $$GroceriesProductsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get product => $composableBuilder(
      column: $table.product, builder: (column) => ColumnOrderings(column));
}

class $$GroceriesProductsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $GroceriesProductsTableTable> {
  $$GroceriesProductsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ProductEntity, String> get product =>
      $composableBuilder(column: $table.product, builder: (column) => column);
}

class $$GroceriesProductsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $GroceriesProductsTableTable,
    GroceriesProductsTableData,
    $$GroceriesProductsTableTableFilterComposer,
    $$GroceriesProductsTableTableOrderingComposer,
    $$GroceriesProductsTableTableAnnotationComposer,
    $$GroceriesProductsTableTableCreateCompanionBuilder,
    $$GroceriesProductsTableTableUpdateCompanionBuilder,
    (
      GroceriesProductsTableData,
      BaseReferences<_$AppDatabase, $GroceriesProductsTableTable,
          GroceriesProductsTableData>
    ),
    GroceriesProductsTableData,
    PrefetchHooks Function()> {
  $$GroceriesProductsTableTableTableManager(
      _$AppDatabase db, $GroceriesProductsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GroceriesProductsTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$GroceriesProductsTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GroceriesProductsTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<ProductEntity> product = const Value.absent(),
          }) =>
              GroceriesProductsTableCompanion(
            id: id,
            product: product,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required ProductEntity product,
          }) =>
              GroceriesProductsTableCompanion.insert(
            id: id,
            product: product,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$GroceriesProductsTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $GroceriesProductsTableTable,
        GroceriesProductsTableData,
        $$GroceriesProductsTableTableFilterComposer,
        $$GroceriesProductsTableTableOrderingComposer,
        $$GroceriesProductsTableTableAnnotationComposer,
        $$GroceriesProductsTableTableCreateCompanionBuilder,
        $$GroceriesProductsTableTableUpdateCompanionBuilder,
        (
          GroceriesProductsTableData,
          BaseReferences<_$AppDatabase, $GroceriesProductsTableTable,
              GroceriesProductsTableData>
        ),
        GroceriesProductsTableData,
        PrefetchHooks Function()>;
typedef $$CartProductsTableTableCreateCompanionBuilder
    = CartProductsTableCompanion Function({
  Value<int> id,
  required ProductEntity product,
});
typedef $$CartProductsTableTableUpdateCompanionBuilder
    = CartProductsTableCompanion Function({
  Value<int> id,
  Value<ProductEntity> product,
});

class $$CartProductsTableTableFilterComposer
    extends Composer<_$AppDatabase, $CartProductsTableTable> {
  $$CartProductsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<ProductEntity, ProductEntity, String>
      get product => $composableBuilder(
          column: $table.product,
          builder: (column) => ColumnWithTypeConverterFilters(column));
}

class $$CartProductsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CartProductsTableTable> {
  $$CartProductsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get product => $composableBuilder(
      column: $table.product, builder: (column) => ColumnOrderings(column));
}

class $$CartProductsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CartProductsTableTable> {
  $$CartProductsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ProductEntity, String> get product =>
      $composableBuilder(column: $table.product, builder: (column) => column);
}

class $$CartProductsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CartProductsTableTable,
    CartProductsTableData,
    $$CartProductsTableTableFilterComposer,
    $$CartProductsTableTableOrderingComposer,
    $$CartProductsTableTableAnnotationComposer,
    $$CartProductsTableTableCreateCompanionBuilder,
    $$CartProductsTableTableUpdateCompanionBuilder,
    (
      CartProductsTableData,
      BaseReferences<_$AppDatabase, $CartProductsTableTable,
          CartProductsTableData>
    ),
    CartProductsTableData,
    PrefetchHooks Function()> {
  $$CartProductsTableTableTableManager(
      _$AppDatabase db, $CartProductsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CartProductsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CartProductsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CartProductsTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<ProductEntity> product = const Value.absent(),
          }) =>
              CartProductsTableCompanion(
            id: id,
            product: product,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required ProductEntity product,
          }) =>
              CartProductsTableCompanion.insert(
            id: id,
            product: product,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CartProductsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CartProductsTableTable,
    CartProductsTableData,
    $$CartProductsTableTableFilterComposer,
    $$CartProductsTableTableOrderingComposer,
    $$CartProductsTableTableAnnotationComposer,
    $$CartProductsTableTableCreateCompanionBuilder,
    $$CartProductsTableTableUpdateCompanionBuilder,
    (
      CartProductsTableData,
      BaseReferences<_$AppDatabase, $CartProductsTableTable,
          CartProductsTableData>
    ),
    CartProductsTableData,
    PrefetchHooks Function()>;
typedef $$FavoritesProductTableTableCreateCompanionBuilder
    = FavoritesProductTableCompanion Function({
  Value<int> id,
  required ProductEntity product,
});
typedef $$FavoritesProductTableTableUpdateCompanionBuilder
    = FavoritesProductTableCompanion Function({
  Value<int> id,
  Value<ProductEntity> product,
});

class $$FavoritesProductTableTableFilterComposer
    extends Composer<_$AppDatabase, $FavoritesProductTableTable> {
  $$FavoritesProductTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<ProductEntity, ProductEntity, String>
      get product => $composableBuilder(
          column: $table.product,
          builder: (column) => ColumnWithTypeConverterFilters(column));
}

class $$FavoritesProductTableTableOrderingComposer
    extends Composer<_$AppDatabase, $FavoritesProductTableTable> {
  $$FavoritesProductTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get product => $composableBuilder(
      column: $table.product, builder: (column) => ColumnOrderings(column));
}

class $$FavoritesProductTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $FavoritesProductTableTable> {
  $$FavoritesProductTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ProductEntity, String> get product =>
      $composableBuilder(column: $table.product, builder: (column) => column);
}

class $$FavoritesProductTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FavoritesProductTableTable,
    FavoritesProductTableData,
    $$FavoritesProductTableTableFilterComposer,
    $$FavoritesProductTableTableOrderingComposer,
    $$FavoritesProductTableTableAnnotationComposer,
    $$FavoritesProductTableTableCreateCompanionBuilder,
    $$FavoritesProductTableTableUpdateCompanionBuilder,
    (
      FavoritesProductTableData,
      BaseReferences<_$AppDatabase, $FavoritesProductTableTable,
          FavoritesProductTableData>
    ),
    FavoritesProductTableData,
    PrefetchHooks Function()> {
  $$FavoritesProductTableTableTableManager(
      _$AppDatabase db, $FavoritesProductTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FavoritesProductTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$FavoritesProductTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FavoritesProductTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<ProductEntity> product = const Value.absent(),
          }) =>
              FavoritesProductTableCompanion(
            id: id,
            product: product,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required ProductEntity product,
          }) =>
              FavoritesProductTableCompanion.insert(
            id: id,
            product: product,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$FavoritesProductTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $FavoritesProductTableTable,
        FavoritesProductTableData,
        $$FavoritesProductTableTableFilterComposer,
        $$FavoritesProductTableTableOrderingComposer,
        $$FavoritesProductTableTableAnnotationComposer,
        $$FavoritesProductTableTableCreateCompanionBuilder,
        $$FavoritesProductTableTableUpdateCompanionBuilder,
        (
          FavoritesProductTableData,
          BaseReferences<_$AppDatabase, $FavoritesProductTableTable,
              FavoritesProductTableData>
        ),
        FavoritesProductTableData,
        PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ProductsTableTableTableManager get productsTable =>
      $$ProductsTableTableTableManager(_db, _db.productsTable);
  $$BeautyProductsTableTableTableManager get beautyProductsTable =>
      $$BeautyProductsTableTableTableManager(_db, _db.beautyProductsTable);
  $$PerfumesProductsTableTableTableManager get perfumesProductsTable =>
      $$PerfumesProductsTableTableTableManager(_db, _db.perfumesProductsTable);
  $$FurnituresProductsTableTableTableManager get furnituresProductsTable =>
      $$FurnituresProductsTableTableTableManager(
          _db, _db.furnituresProductsTable);
  $$GroceriesProductsTableTableTableManager get groceriesProductsTable =>
      $$GroceriesProductsTableTableTableManager(
          _db, _db.groceriesProductsTable);
  $$CartProductsTableTableTableManager get cartProductsTable =>
      $$CartProductsTableTableTableManager(_db, _db.cartProductsTable);
  $$FavoritesProductTableTableTableManager get favoritesProductTable =>
      $$FavoritesProductTableTableTableManager(_db, _db.favoritesProductTable);
}
