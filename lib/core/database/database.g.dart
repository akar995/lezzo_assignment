// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Product extends DataClass implements Insertable<Product> {
  final int id;
  final String name;
  final double actualPrice;
  final String thumbnail;
  final int? storeID;
  final String? description;
  final String? searchTags;
  Product(
      {required this.id,
      required this.name,
      required this.actualPrice,
      required this.thumbnail,
      this.storeID,
      this.description,
      this.searchTags});
  factory Product.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Product(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      actualPrice: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}actual_price'])!,
      thumbnail: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}thumbnail'])!,
      storeID: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}category_id']),
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      searchTags: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}searchtags']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['actual_price'] = Variable<double>(actualPrice);
    map['thumbnail'] = Variable<String>(thumbnail);
    if (!nullToAbsent || storeID != null) {
      map['category_id'] = Variable<int?>(storeID);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String?>(description);
    }
    if (!nullToAbsent || searchTags != null) {
      map['searchtags'] = Variable<String?>(searchTags);
    }
    return map;
  }

  ProductsCompanion toCompanion(bool nullToAbsent) {
    return ProductsCompanion(
      id: Value(id),
      name: Value(name),
      actualPrice: Value(actualPrice),
      thumbnail: Value(thumbnail),
      storeID: storeID == null && nullToAbsent
          ? const Value.absent()
          : Value(storeID),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      searchTags: searchTags == null && nullToAbsent
          ? const Value.absent()
          : Value(searchTags),
    );
  }

  factory Product.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Product(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      actualPrice: serializer.fromJson<double>(json['actual_price']),
      thumbnail: serializer.fromJson<String>(json['thumbnail']),
      storeID: serializer.fromJson<int?>(json['store_id']),
      description: serializer.fromJson<String?>(json['description']),
      searchTags: serializer.fromJson<String?>(json['searchtags']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'actual_price': serializer.toJson<double>(actualPrice),
      'thumbnail': serializer.toJson<String>(thumbnail),
      'store_id': serializer.toJson<int?>(storeID),
      'description': serializer.toJson<String?>(description),
      'searchtags': serializer.toJson<String?>(searchTags),
    };
  }

  Product copyWith(
          {int? id,
          String? name,
          double? actualPrice,
          String? thumbnail,
          int? storeID,
          String? description,
          String? searchTags}) =>
      Product(
        id: id ?? this.id,
        name: name ?? this.name,
        actualPrice: actualPrice ?? this.actualPrice,
        thumbnail: thumbnail ?? this.thumbnail,
        storeID: storeID ?? this.storeID,
        description: description ?? this.description,
        searchTags: searchTags ?? this.searchTags,
      );
  @override
  String toString() {
    return (StringBuffer('Product(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('actualPrice: $actualPrice, ')
          ..write('thumbnail: $thumbnail, ')
          ..write('storeID: $storeID, ')
          ..write('description: $description, ')
          ..write('searchTags: $searchTags')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, name, actualPrice, thumbnail, storeID, description, searchTags);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Product &&
          other.id == this.id &&
          other.name == this.name &&
          other.actualPrice == this.actualPrice &&
          other.thumbnail == this.thumbnail &&
          other.storeID == this.storeID &&
          other.description == this.description &&
          other.searchTags == this.searchTags);
}

class ProductsCompanion extends UpdateCompanion<Product> {
  final Value<int> id;
  final Value<String> name;
  final Value<double> actualPrice;
  final Value<String> thumbnail;
  final Value<int?> storeID;
  final Value<String?> description;
  final Value<String?> searchTags;
  const ProductsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.actualPrice = const Value.absent(),
    this.thumbnail = const Value.absent(),
    this.storeID = const Value.absent(),
    this.description = const Value.absent(),
    this.searchTags = const Value.absent(),
  });
  ProductsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required double actualPrice,
    required String thumbnail,
    this.storeID = const Value.absent(),
    this.description = const Value.absent(),
    this.searchTags = const Value.absent(),
  })  : name = Value(name),
        actualPrice = Value(actualPrice),
        thumbnail = Value(thumbnail);
  static Insertable<Product> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<double>? actualPrice,
    Expression<String>? thumbnail,
    Expression<int?>? storeID,
    Expression<String?>? description,
    Expression<String?>? searchTags,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (actualPrice != null) 'actual_price': actualPrice,
      if (thumbnail != null) 'thumbnail': thumbnail,
      if (storeID != null) 'category_id': storeID,
      if (description != null) 'description': description,
      if (searchTags != null) 'searchtags': searchTags,
    });
  }

  ProductsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<double>? actualPrice,
      Value<String>? thumbnail,
      Value<int?>? storeID,
      Value<String?>? description,
      Value<String?>? searchTags}) {
    return ProductsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      actualPrice: actualPrice ?? this.actualPrice,
      thumbnail: thumbnail ?? this.thumbnail,
      storeID: storeID ?? this.storeID,
      description: description ?? this.description,
      searchTags: searchTags ?? this.searchTags,
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
    if (actualPrice.present) {
      map['actual_price'] = Variable<double>(actualPrice.value);
    }
    if (thumbnail.present) {
      map['thumbnail'] = Variable<String>(thumbnail.value);
    }
    if (storeID.present) {
      map['category_id'] = Variable<int?>(storeID.value);
    }
    if (description.present) {
      map['description'] = Variable<String?>(description.value);
    }
    if (searchTags.present) {
      map['searchtags'] = Variable<String?>(searchTags.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('actualPrice: $actualPrice, ')
          ..write('thumbnail: $thumbnail, ')
          ..write('storeID: $storeID, ')
          ..write('description: $description, ')
          ..write('searchTags: $searchTags')
          ..write(')'))
        .toString();
  }
}

class $ProductsTable extends Products with TableInfo<$ProductsTable, Product> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ProductsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 3, maxTextLength: 202),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _actualPriceMeta =
      const VerificationMeta('actualPrice');
  late final GeneratedColumn<double?> actualPrice = GeneratedColumn<double?>(
      'actual_price', aliasedName, false,
      typeName: 'REAL', requiredDuringInsert: true);
  final VerificationMeta _thumbnailMeta = const VerificationMeta('thumbnail');
  late final GeneratedColumn<String?> thumbnail = GeneratedColumn<String?>(
      'thumbnail', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 3, maxTextLength: 202),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _storeIDMeta = const VerificationMeta('storeID');
  late final GeneratedColumn<int?> storeID = GeneratedColumn<int?>(
      'category_id', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _searchTagsMeta = const VerificationMeta('searchTags');
  late final GeneratedColumn<String?> searchTags = GeneratedColumn<String?>(
      'searchtags', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, actualPrice, thumbnail, storeID, description, searchTags];
  @override
  String get aliasedName => _alias ?? 'products';
  @override
  String get actualTableName => 'products';
  @override
  VerificationContext validateIntegrity(Insertable<Product> instance,
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
    if (data.containsKey('actual_price')) {
      context.handle(
          _actualPriceMeta,
          actualPrice.isAcceptableOrUnknown(
              data['actual_price']!, _actualPriceMeta));
    } else if (isInserting) {
      context.missing(_actualPriceMeta);
    }
    if (data.containsKey('thumbnail')) {
      context.handle(_thumbnailMeta,
          thumbnail.isAcceptableOrUnknown(data['thumbnail']!, _thumbnailMeta));
    } else if (isInserting) {
      context.missing(_thumbnailMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(_storeIDMeta,
          storeID.isAcceptableOrUnknown(data['category_id']!, _storeIDMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('searchtags')) {
      context.handle(
          _searchTagsMeta,
          searchTags.isAcceptableOrUnknown(
              data['searchtags']!, _searchTagsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Product map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Product.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ProductsTable createAlias(String alias) {
    return $ProductsTable(_db, alias);
  }
}

class Image extends DataClass implements Insertable<Image> {
  final int id;
  final String image;
  final int productId;
  Image({required this.id, required this.image, required this.productId});
  factory Image.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Image(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      image: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image'])!,
      productId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}product_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['image'] = Variable<String>(image);
    map['product_id'] = Variable<int>(productId);
    return map;
  }

  ImagesCompanion toCompanion(bool nullToAbsent) {
    return ImagesCompanion(
      id: Value(id),
      image: Value(image),
      productId: Value(productId),
    );
  }

  factory Image.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Image(
      id: serializer.fromJson<int>(json['id']),
      image: serializer.fromJson<String>(json['image']),
      productId: serializer.fromJson<int>(json['product_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'image': serializer.toJson<String>(image),
      'product_id': serializer.toJson<int>(productId),
    };
  }

  Image copyWith({int? id, String? image, int? productId}) => Image(
        id: id ?? this.id,
        image: image ?? this.image,
        productId: productId ?? this.productId,
      );
  @override
  String toString() {
    return (StringBuffer('Image(')
          ..write('id: $id, ')
          ..write('image: $image, ')
          ..write('productId: $productId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, image, productId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Image &&
          other.id == this.id &&
          other.image == this.image &&
          other.productId == this.productId);
}

class ImagesCompanion extends UpdateCompanion<Image> {
  final Value<int> id;
  final Value<String> image;
  final Value<int> productId;
  const ImagesCompanion({
    this.id = const Value.absent(),
    this.image = const Value.absent(),
    this.productId = const Value.absent(),
  });
  ImagesCompanion.insert({
    this.id = const Value.absent(),
    required String image,
    required int productId,
  })  : image = Value(image),
        productId = Value(productId);
  static Insertable<Image> custom({
    Expression<int>? id,
    Expression<String>? image,
    Expression<int>? productId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (image != null) 'image': image,
      if (productId != null) 'product_id': productId,
    });
  }

  ImagesCompanion copyWith(
      {Value<int>? id, Value<String>? image, Value<int>? productId}) {
    return ImagesCompanion(
      id: id ?? this.id,
      image: image ?? this.image,
      productId: productId ?? this.productId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ImagesCompanion(')
          ..write('id: $id, ')
          ..write('image: $image, ')
          ..write('productId: $productId')
          ..write(')'))
        .toString();
  }
}

class $ImagesTable extends Images with TableInfo<$ImagesTable, Image> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ImagesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _imageMeta = const VerificationMeta('image');
  late final GeneratedColumn<String?> image = GeneratedColumn<String?>(
      'image', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _productIdMeta = const VerificationMeta('productId');
  late final GeneratedColumn<int?> productId = GeneratedColumn<int?>(
      'product_id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, image, productId];
  @override
  String get aliasedName => _alias ?? 'images';
  @override
  String get actualTableName => 'images';
  @override
  VerificationContext validateIntegrity(Insertable<Image> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Image map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Image.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ImagesTable createAlias(String alias) {
    return $ImagesTable(_db, alias);
  }
}

class CartData extends DataClass implements Insertable<CartData> {
  final int id;
  final int productId;
  final int userId;
  final int quantity;
  final String? attribute;
  final double price;
  CartData(
      {required this.id,
      required this.productId,
      required this.userId,
      required this.quantity,
      this.attribute,
      required this.price});
  factory CartData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return CartData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      productId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}product_id'])!,
      userId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_id'])!,
      quantity: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}quantity'])!,
      attribute: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}attribute']),
      price: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}price'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['product_id'] = Variable<int>(productId);
    map['user_id'] = Variable<int>(userId);
    map['quantity'] = Variable<int>(quantity);
    if (!nullToAbsent || attribute != null) {
      map['attribute'] = Variable<String?>(attribute);
    }
    map['price'] = Variable<double>(price);
    return map;
  }

  CartCompanion toCompanion(bool nullToAbsent) {
    return CartCompanion(
      id: Value(id),
      productId: Value(productId),
      userId: Value(userId),
      quantity: Value(quantity),
      attribute: attribute == null && nullToAbsent
          ? const Value.absent()
          : Value(attribute),
      price: Value(price),
    );
  }

  factory CartData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CartData(
      id: serializer.fromJson<int>(json['id']),
      productId: serializer.fromJson<int>(json['product_id']),
      userId: serializer.fromJson<int>(json['user_id']),
      quantity: serializer.fromJson<int>(json['quantity']),
      attribute: serializer.fromJson<String?>(json['attribute']),
      price: serializer.fromJson<double>(json['price']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'product_id': serializer.toJson<int>(productId),
      'user_id': serializer.toJson<int>(userId),
      'quantity': serializer.toJson<int>(quantity),
      'attribute': serializer.toJson<String?>(attribute),
      'price': serializer.toJson<double>(price),
    };
  }

  CartData copyWith(
          {int? id,
          int? productId,
          int? userId,
          int? quantity,
          String? attribute,
          double? price}) =>
      CartData(
        id: id ?? this.id,
        productId: productId ?? this.productId,
        userId: userId ?? this.userId,
        quantity: quantity ?? this.quantity,
        attribute: attribute ?? this.attribute,
        price: price ?? this.price,
      );
  @override
  String toString() {
    return (StringBuffer('CartData(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('userId: $userId, ')
          ..write('quantity: $quantity, ')
          ..write('attribute: $attribute, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, productId, userId, quantity, attribute, price);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CartData &&
          other.id == this.id &&
          other.productId == this.productId &&
          other.userId == this.userId &&
          other.quantity == this.quantity &&
          other.attribute == this.attribute &&
          other.price == this.price);
}

class CartCompanion extends UpdateCompanion<CartData> {
  final Value<int> id;
  final Value<int> productId;
  final Value<int> userId;
  final Value<int> quantity;
  final Value<String?> attribute;
  final Value<double> price;
  const CartCompanion({
    this.id = const Value.absent(),
    this.productId = const Value.absent(),
    this.userId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.attribute = const Value.absent(),
    this.price = const Value.absent(),
  });
  CartCompanion.insert({
    this.id = const Value.absent(),
    required int productId,
    required int userId,
    required int quantity,
    this.attribute = const Value.absent(),
    required double price,
  })  : productId = Value(productId),
        userId = Value(userId),
        quantity = Value(quantity),
        price = Value(price);
  static Insertable<CartData> custom({
    Expression<int>? id,
    Expression<int>? productId,
    Expression<int>? userId,
    Expression<int>? quantity,
    Expression<String?>? attribute,
    Expression<double>? price,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productId != null) 'product_id': productId,
      if (userId != null) 'user_id': userId,
      if (quantity != null) 'quantity': quantity,
      if (attribute != null) 'attribute': attribute,
      if (price != null) 'price': price,
    });
  }

  CartCompanion copyWith(
      {Value<int>? id,
      Value<int>? productId,
      Value<int>? userId,
      Value<int>? quantity,
      Value<String?>? attribute,
      Value<double>? price}) {
    return CartCompanion(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      userId: userId ?? this.userId,
      quantity: quantity ?? this.quantity,
      attribute: attribute ?? this.attribute,
      price: price ?? this.price,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (attribute.present) {
      map['attribute'] = Variable<String?>(attribute.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CartCompanion(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('userId: $userId, ')
          ..write('quantity: $quantity, ')
          ..write('attribute: $attribute, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }
}

class $CartTable extends Cart with TableInfo<$CartTable, CartData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $CartTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _productIdMeta = const VerificationMeta('productId');
  late final GeneratedColumn<int?> productId = GeneratedColumn<int?>(
      'product_id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  late final GeneratedColumn<int?> userId = GeneratedColumn<int?>(
      'user_id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _quantityMeta = const VerificationMeta('quantity');
  late final GeneratedColumn<int?> quantity = GeneratedColumn<int?>(
      'quantity', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _attributeMeta = const VerificationMeta('attribute');
  late final GeneratedColumn<String?> attribute = GeneratedColumn<String?>(
      'attribute', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _priceMeta = const VerificationMeta('price');
  late final GeneratedColumn<double?> price = GeneratedColumn<double?>(
      'price', aliasedName, false,
      typeName: 'REAL', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, productId, userId, quantity, attribute, price];
  @override
  String get aliasedName => _alias ?? 'cart';
  @override
  String get actualTableName => 'cart';
  @override
  VerificationContext validateIntegrity(Insertable<CartData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('attribute')) {
      context.handle(_attributeMeta,
          attribute.isAcceptableOrUnknown(data['attribute']!, _attributeMeta));
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CartData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return CartData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CartTable createAlias(String alias) {
    return $CartTable(_db, alias);
  }
}

class Favorite extends DataClass implements Insertable<Favorite> {
  final int id;
  final int productId;
  Favorite({required this.id, required this.productId});
  factory Favorite.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Favorite(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      productId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}product_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['product_id'] = Variable<int>(productId);
    return map;
  }

  FavoritesCompanion toCompanion(bool nullToAbsent) {
    return FavoritesCompanion(
      id: Value(id),
      productId: Value(productId),
    );
  }

  factory Favorite.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Favorite(
      id: serializer.fromJson<int>(json['id']),
      productId: serializer.fromJson<int>(json['product_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'product_id': serializer.toJson<int>(productId),
    };
  }

  Favorite copyWith({int? id, int? productId}) => Favorite(
        id: id ?? this.id,
        productId: productId ?? this.productId,
      );
  @override
  String toString() {
    return (StringBuffer('Favorite(')
          ..write('id: $id, ')
          ..write('productId: $productId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, productId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Favorite &&
          other.id == this.id &&
          other.productId == this.productId);
}

class FavoritesCompanion extends UpdateCompanion<Favorite> {
  final Value<int> id;
  final Value<int> productId;
  const FavoritesCompanion({
    this.id = const Value.absent(),
    this.productId = const Value.absent(),
  });
  FavoritesCompanion.insert({
    this.id = const Value.absent(),
    required int productId,
  }) : productId = Value(productId);
  static Insertable<Favorite> custom({
    Expression<int>? id,
    Expression<int>? productId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productId != null) 'product_id': productId,
    });
  }

  FavoritesCompanion copyWith({Value<int>? id, Value<int>? productId}) {
    return FavoritesCompanion(
      id: id ?? this.id,
      productId: productId ?? this.productId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoritesCompanion(')
          ..write('id: $id, ')
          ..write('productId: $productId')
          ..write(')'))
        .toString();
  }
}

class $FavoritesTable extends Favorites
    with TableInfo<$FavoritesTable, Favorite> {
  final GeneratedDatabase _db;
  final String? _alias;
  $FavoritesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _productIdMeta = const VerificationMeta('productId');
  late final GeneratedColumn<int?> productId = GeneratedColumn<int?>(
      'product_id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, productId];
  @override
  String get aliasedName => _alias ?? 'favorites';
  @override
  String get actualTableName => 'favorites';
  @override
  VerificationContext validateIntegrity(Insertable<Favorite> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Favorite map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Favorite.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $FavoritesTable createAlias(String alias) {
    return $FavoritesTable(_db, alias);
  }
}

class StoreData extends DataClass implements Insertable<StoreData> {
  final int id;
  final String name;
  final String thumbnail;
  StoreData({required this.id, required this.name, required this.thumbnail});
  factory StoreData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return StoreData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      thumbnail: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}thumbnail'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['thumbnail'] = Variable<String>(thumbnail);
    return map;
  }

  StoreCompanion toCompanion(bool nullToAbsent) {
    return StoreCompanion(
      id: Value(id),
      name: Value(name),
      thumbnail: Value(thumbnail),
    );
  }

  factory StoreData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StoreData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      thumbnail: serializer.fromJson<String>(json['thumbnail']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'thumbnail': serializer.toJson<String>(thumbnail),
    };
  }

  StoreData copyWith({int? id, String? name, String? thumbnail}) => StoreData(
        id: id ?? this.id,
        name: name ?? this.name,
        thumbnail: thumbnail ?? this.thumbnail,
      );
  @override
  String toString() {
    return (StringBuffer('StoreData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('thumbnail: $thumbnail')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, thumbnail);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StoreData &&
          other.id == this.id &&
          other.name == this.name &&
          other.thumbnail == this.thumbnail);
}

class StoreCompanion extends UpdateCompanion<StoreData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> thumbnail;
  const StoreCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.thumbnail = const Value.absent(),
  });
  StoreCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String thumbnail,
  })  : name = Value(name),
        thumbnail = Value(thumbnail);
  static Insertable<StoreData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? thumbnail,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (thumbnail != null) 'thumbnail': thumbnail,
    });
  }

  StoreCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<String>? thumbnail}) {
    return StoreCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      thumbnail: thumbnail ?? this.thumbnail,
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
    if (thumbnail.present) {
      map['thumbnail'] = Variable<String>(thumbnail.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StoreCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('thumbnail: $thumbnail')
          ..write(')'))
        .toString();
  }
}

class $StoreTable extends Store with TableInfo<$StoreTable, StoreData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $StoreTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 3, maxTextLength: 202),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _thumbnailMeta = const VerificationMeta('thumbnail');
  late final GeneratedColumn<String?> thumbnail = GeneratedColumn<String?>(
      'thumbnail', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 3, maxTextLength: 202),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, thumbnail];
  @override
  String get aliasedName => _alias ?? 'store';
  @override
  String get actualTableName => 'store';
  @override
  VerificationContext validateIntegrity(Insertable<StoreData> instance,
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
    if (data.containsKey('thumbnail')) {
      context.handle(_thumbnailMeta,
          thumbnail.isAcceptableOrUnknown(data['thumbnail']!, _thumbnailMeta));
    } else if (isInserting) {
      context.missing(_thumbnailMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StoreData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return StoreData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $StoreTable createAlias(String alias) {
    return $StoreTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $ProductsTable products = $ProductsTable(this);
  late final $ImagesTable images = $ImagesTable(this);
  late final $CartTable cart = $CartTable(this);
  late final $FavoritesTable favorites = $FavoritesTable(this);
  late final $StoreTable store = $StoreTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [products, images, cart, favorites, store];
}
