
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

class Products extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(min: 3, max: 202)();
  @JsonKey('actual_price')
  RealColumn get actualPrice => real().named('actual_price')();


  TextColumn get thumbnail => text().withLength(min: 3, max: 202)();



  @JsonKey('store_id')
  IntColumn get storeID => integer().nullable().named('category_id')();

  TextColumn get description => text().nullable()();

  @JsonKey('searchtags')
  TextColumn get searchTags =>text().nullable().named('searchtags')();


}



class Store extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 3, max: 202)();
  TextColumn get thumbnail => text().withLength(min: 3, max: 202)();

}


class Images extends Table{
  IntColumn get id=>integer().autoIncrement()();
  TextColumn get image => text()();

  @JsonKey('product_id')
  IntColumn get productId =>integer().named('product_id')();


}






class CartAndProduct{
  final Product product;
  final CartData cart;


  CartAndProduct({
    required this.product,
    required this.cart,

  });
}

class FavoriteAndProduct{
  final Product product;
  final Favorite favorite;


  FavoriteAndProduct({
    required this.product,
    required this.favorite,

  });
}


class Cart extends Table{

  IntColumn get id =>integer().autoIncrement()();
  @JsonKey('product_id')
  IntColumn get productId =>integer().named('product_id')();
  @JsonKey('user_id')
  IntColumn get userId =>integer().named('user_id')();

  IntColumn get quantity =>integer()();
  TextColumn get attribute =>text().nullable()();
  RealColumn get  price => real()();
}

class Favorites extends Table{

  IntColumn get id =>integer().autoIncrement()();
  @JsonKey('product_id')
  IntColumn get productId =>integer().named('product_id')();

}

LazyDatabase _openConnection() {

  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
@DriftDatabase(tables: [Products,Images,Cart,Favorites,Store])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration => MigrationStrategy(
      onCreate: (Migrator m) {
        return m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {

      }
  );

  Future<List<Product>> getAllProducts()=>select(products).get();

  Stream<List<Product>> watchAllProducts()=>select(products).watch();
  Future insertTask(Insertable<Product> pros)=> into(products).insert(pros);

}
