import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lezzo_assignment/core/database/database.dart'as db;
import 'package:lezzo_assignment/get_controllers/get_database_controller.dart';

class ProductScreen extends StatelessWidget {
  final db.Product product;
  RxInt quantity=0.obs;
   ProductScreen(this.product,{Key? key}) : super(key: key);
  final CarouselController _carouselController=CarouselController();
  RxInt currentIndex=0.obs;
  RxBool isLoading=false.obs;
  final GetDatabaseController getDatabaseController=Get.find<GetDatabaseController>(tag: 'database');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView( 

        children: [
          SizedBox(
            height: 200,
            child: StreamBuilder<List<db.Image>>(
              stream: getDatabaseController.getProductsImage(product.id),

              builder: (context,snap){

                switch(snap.connectionState){



                  case ConnectionState.active:
                    if(snap.hasData&& snap.data!.isNotEmpty){
                      List<db.Image> images=snap.data!;
                      return ListView(
                        children: [
                          CarouselSlider(
                            carouselController: _carouselController,
                            options: CarouselOptions(enlargeStrategy:
                            CenterPageEnlargeStrategy.scale
                              ,aspectRatio: 16/6,enlargeCenterPage: true,
                              viewportFraction: .8,

                              enableInfiniteScroll: true,
                              autoPlay: true,
                              onPageChanged:
                                  (int index,CarouselPageChangedReason reason) {
                                currentIndex.value=index;

                              },),

                            items: images.map((i) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                                    decoration:const BoxDecoration(

                                        color: Colors.amber
                                    ),
                                    child: Image.network(i.image,fit: BoxFit.cover,),);

                                },
                              );
                            }).toList(),
                          ),
                          Obx(
                                  () {
                                return Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children:[
                                      for ( int i=0;i<images.length;i++ )
                                        InkWell(
                                          onTap: (){

                                            _carouselController.onReady.then((value) {
                                              _carouselController.animateToPage(i,duration:const Duration(milliseconds: 300
                                                ,),curve: Curves.easeIn);});
                                          },
                                          child: Container(
                                            height: 14,
                                            width: 14,
                                            decoration: BoxDecoration(
                                                color: i==currentIndex.value?Colors.red:Colors.grey,
                                                borderRadius: BorderRadius.circular(100)
                                            ),
                                            margin:const EdgeInsets.all(5),
                                          ),
                                        )
                                    ]


                                );
                              }
                          ),
                        ],
                      );

                    }
                    return const Center(child: Text('Image Cannot be Loaded'),);
                  default:
                    return const Center(child: CircularProgressIndicator(),);
                }
              },

            ),
          ),
          const Padding(
            padding:  EdgeInsets.all(8.0),
            child:  Text("Product Name",style: TextStyle(fontSize: 19),),
          ),
           Padding(
            padding: const EdgeInsets.all(8.0),
            child:  Text(product.name,style: const TextStyle(fontSize: 14),),
          ),

         const Divider(),
          const Padding(
            padding:  EdgeInsets.all(8.0),
            child:  Text("Product Description",style: TextStyle(fontSize: 19),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:  Text(product.description??'Empty',style: const TextStyle(fontSize: 14),),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(onPressed: (){changeQuantity(1);}, icon:const Icon(Icons.add)),
              Obx(
                 () {
                  return Container(
                    padding:const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey)
                      ),
                      child: Text(quantity.value.toString()));
                }
              ),
              IconButton(onPressed: (){
                changeQuantity(-1);
              }, icon:const Icon(Icons.remove)),
              const Spacer(),
              Obx(
                () {
                  return ElevatedButton(onPressed: ()async{
                    if(!isLoading.value){
                     int res= await getDatabaseController.insertIntoCart(db.CartCompanion.insert
                        (productId: product.id, userId: 1, quantity: quantity.value, price: product.actualPrice));
                     String message="Unexpected Error";
                     if(res==-1){
                       message='Product exist inside the cart';
                     }else if(res>0)
                       {
                         message='Product added to cart';

                       }
                     Get.snackbar('Info', message);
                    }
                  }, child:isLoading.value?const CircularProgressIndicator():const Text('Add to cart'));
                }
              ),
              const SizedBox(width: 10,)
            ],
          )
        ],
      ),
    );
  }

  changeQuantity(int q){

    if(quantity.value>0 ) {
      quantity.value+=q;
    }else if(q>0){
      quantity.value+=q;

    }
  }
}
