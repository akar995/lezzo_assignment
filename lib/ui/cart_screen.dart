import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lezzo_assignment/get_controllers/get_database_controller.dart';

class CartScreen extends StatelessWidget {
   CartScreen({Key? key}) : super(key: key);
  final GetDatabaseController getDatabaseController=Get.find<GetDatabaseController>(tag: 'database');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<List<CartWithProduct>>(
        stream: getDatabaseController.getCartWithProducts(),
        builder: (context, snapshot) {
          switch(snapshot.connectionState){


            case ConnectionState.active:
              if(snapshot.hasData){
                List<CartWithProduct> cartsData=snapshot.data!;
                if(cartsData.isNotEmpty){
                  return ListView.builder(itemBuilder:

                  (context, index) {
                    CartWithProduct data=cartsData[index];
                    return ListTile(
                    title: Text(data.product!.name),
                      leading: Image.network(data.product!.thumbnail),
                      subtitle: Text(data.cartData!.price.toString()),
                      trailing: SizedBox(
                        width: 120,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(onPressed: (){
                              getDatabaseController.updateCartQuantity(data.cartData!.id
                                  , data.cartData!.quantity, true);}, icon:const Icon(Icons.add)),
                         Container(
                                      padding:const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.grey)
                                      ),
                                      child: Text(data.cartData!.quantity.toString())),

                            IconButton(onPressed: (){
                              getDatabaseController.updateCartQuantity(data.cartData!.id
                                  , data.cartData!.quantity, false);
                            }, icon:const Icon(Icons.remove)),
                            const Spacer(),

                          ],
                        ),
                      ),
                  );
                  },itemCount: cartsData.length,);
                }
              }
              return const Center(child: CircularProgressIndicator(),);


            default:
              return const Center(child: CircularProgressIndicator(),);
          }
        },
      ),
    );
  }
}
