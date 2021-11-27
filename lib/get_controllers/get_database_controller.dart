import 'dart:math';

import 'package:get/get.dart';
import 'package:lezzo_assignment/core/database/database.dart';
import 'package:drift/drift.dart'
    as moor;
import 'package:shared_preferences/shared_preferences.dart'; // this packaged previous name was moor is reverse name of room which is very powerful android SQL API and this package is inspired by room

class GetDatabaseController extends GetxController {
  _isFirstTime()async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    String? isFirst=sharedPreferences.getString('isFirst');
    if(isFirst==null){
      sharedPreferences.setString('isFirst', 'done');
      addDummyData();

    }

  }
   AppDatabase? database ;
  GetDatabaseController(){
    database ??= AppDatabase();
    _isFirstTime();
  }
  List<String> dummyFoodName = [
    "Cheese",
    "Egg"
        "Butter",
    "Margarine",
    "Yogurt",
    "Cottage cheese",
    "Ice cream",
    "Cream",
    "Sandwich",
    "Sausage",
    "Hamburger",
    "Hot dog",
    "Bread",
    "Pizza",
    "Steak",
    "Roast chicken",
    "Fish",
    "Seafood",
    "Ham",
    "Kebab",
    "Bacon",
    "Sour cream",
  ];

  addDummyData()  {
    Random rand = Random();

    for (int ind = 0; ind < 4; ind++) {
      String name = "Store  ${ind.toString()}";
       database!.into(database!.store).insert(StoreCompanion(
          name: moor.Value(name),
          thumbnail: const moor.Value('https://loremflickr.com/200/200/food?random=1')))
           .then((storeid) {
         for (int index = 0; index < dummyFoodName.length; index++) {
            database!.into(database!.products).insert(
             ProductsCompanion.insert(
                 name: dummyFoodName[index],
                 actualPrice: rand.nextInt(25000).toDouble(),
                 thumbnail: 'https://loremflickr.com/200/200/food?random=1',
                 storeID: moor.Value(storeid)),
           ).then((value1) {
              for (int dex = 0; dex < 1+rand.nextInt(3); dex++) {
                 database!.into(database!.images).insert(ImagesCompanion(
              image:  const moor.Value('https://loremflickr.com/1200/900/food?random=1'),
              productId: moor.Value(value1)));
            }
            });

       }

       });


    }
  }


  Stream<List<StoreData>> getStores(){
    return database!.select(database!.store).watch();
  }

  Stream<List<Product>> getStoreProducts(int storeID){
    return (database!.select(database!.products)..where((tbl) => tbl.storeID.equals(storeID))).watch();
  }

  Stream<List<Image>> getProductsImage(int proId){
    return (database!.select(database!.images)..where((tbl) => tbl.productId.equals(proId))).watch();
  }
 Future<int> insertIntoCart(CartCompanion cartCompanion) async {
   var countExp = database!.cart.id.count();


   moor.JoinedSelectStatement<$CartTable, CartData> query = (database!.selectOnly(database!.cart)..addColumns([countExp]))..where(database!.cart.productId.equals(cartCompanion.productId.value));
   int result = await query.map((row) => row.read(countExp)).getSingle();
   if(result<=0) {
     return await database!.into(database!.cart).insert(cartCompanion);
   }
   return -1;
  }

  Stream<List<CartWithProduct>> getCartWithProducts(){
    moor.JoinedSelectStatement<moor.HasResultSet, dynamic> query = database!.select(database!.cart).join([
      moor.leftOuterJoin(database!.products, database!.products.id.equalsExp(database!.cart.productId)),
    ]);
   return query.map((p0) => CartWithProduct(p0.readTableOrNull(database!.products),
   p0.readTableOrNull(database!.cart))).watch();
  }
  
  Future <int> updateCartQuantity(int cartId,int quantity,bool increase )async{
    if(increase){
      quantity++;
      ( (database!.update(database!.cart))..where((tbl) => tbl.id.equals(cartId))).
      write(CartCompanion( quantity:moor.Value( quantity), ));
    }else{
      quantity--;
      if(quantity<=0){
        (database!.delete(database!.cart))..where((tbl) => tbl.id.equals(cartId))..go();
        return 0;
      }else{
        ( (database!.update(database!.cart))..where((tbl) => tbl.id.equals(cartId))).
        write(CartCompanion( quantity:moor.Value( quantity), ));
        return 1;
      }
    }
    return 0;
    
  }


}
class CartWithProduct{
  CartData? cartData;
  Product? product;
  CartWithProduct(this.product,this.cartData);
}