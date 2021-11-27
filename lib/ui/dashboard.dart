import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:lezzo_assignment/core/database/database.dart' as db;
import 'package:lezzo_assignment/get_controllers/get_database_controller.dart';
import 'package:lezzo_assignment/ui/product_screen.dart';

class Dashboard extends StatelessWidget {
   Dashboard({Key? key}) : super(key: key);

   final GetDatabaseController getDatabaseController=Get.find<GetDatabaseController>(tag:'database');
 static const List<String> images=[
   'assets/image/offer_1.jpg',
   'assets/image/offer_2.jpg',
   'assets/image/offer_3.jpg',
   'assets/image/offer_4.jpg',
  ];
  final CarouselController _carouselController=CarouselController();
 RxInt currentIndex=0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body:  StreamBuilder<List<db.StoreData>>(
          stream: getDatabaseController.getStores(),
        builder: (context, snapshot) {

          switch(snapshot.connectionState){


            case ConnectionState.active:
              List<db.StoreData>? stores=snapshot.data;
              if(snapshot.hasData && stores!=null && stores.isNotEmpty)
              {
                List<Widget> slivers=[
                  SliverToBoxAdapter(
                    child: CarouselSlider(
                      carouselController: _carouselController,
                      options: CarouselOptions(enlargeStrategy:
                      CenterPageEnlargeStrategy.scale
                        ,aspectRatio: 16/6,enlargeCenterPage: true,viewportFraction: .8,

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
                              child: Image.asset(i,fit: BoxFit.cover,),);

                          },
                        );
                      }).toList(),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child:  Obx(
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
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      padding:const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const  Text("Shops"),
                              PhysicalModel(
                                color:Colors.red ,
                                elevation: 8,
                                child: InkWell(onTap: (){}
                                  , child: Container(
                                      padding:const EdgeInsets.all(8),
                                      decoration:const BoxDecoration(
                                          color: Colors.red
                                      ),
                                      child:const Text("Show All",style: TextStyle(
                                          color: Colors.white
                                      ),))
                                  ,

                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 160,
                      child: ListView.builder(
                        itemCount: stores.length,
                        padding:const EdgeInsets.all(10),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => shopTile(stores[index]),
                      )
                    ),
                  ),



                ];
                for (db.StoreData store in stores) {
                  slivers.addAll([

                    SliverToBoxAdapter(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(store.name),
                                PhysicalModel(
                                  color: Colors.red,
                                  elevation: 8,
                                  child: InkWell(onTap: () {}
                                    , child: Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: const BoxDecoration(
                                            color: Colors.red
                                        ),
                                        child: const Text(
                                          "Show All", style: TextStyle(
                                            color: Colors.white
                                        ),))
                                    ,

                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
MySliver(store)




                  ]);
                }

                return CustomScrollView(slivers: slivers,);

              }
              return const Center(child: Text("No Stores"),);


            default:
              return const Center(child: CircularProgressIndicator(),);
          }






        }
      ),
    );
  }

   Widget shopTile(db.StoreData store){
      return Container(
        margin: const EdgeInsets.all(5),
        constraints: const BoxConstraints(
          maxWidth: 90
        ),
        child: PhysicalModel(
          color: Colors.white,
          elevation: 6,
          borderRadius:const BorderRadius.only(topLeft: Radius.circular(90),topRight:  Radius.circular(90)),
          child: Padding(
            padding:const EdgeInsets.all(5),
            child: Column(
              children: [ClipRRect(
                borderRadius:const BorderRadius.all( Radius.circular(90)),

                child: Container(
                  height: 70,
                  width: 70,
                  color: Colors.blueGrey,
                  child: Image.network(store.thumbnail,fit: BoxFit.cover,),
                ),
                
              ),
                Flexible(child: Text(store.name))
              
              ],
            ),
          ),
        ),
      );
   }

}


class MySliver extends StatelessWidget {
  db.StoreData store;
   MySliver(this.store,{Key? key}) : super(key: key);

  final GetDatabaseController controller=Get.find<GetDatabaseController>(tag:'database');



  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<db.Product>>(
      stream: controller.getStoreProducts(store.id),
      builder:(context, snapshot) {
        switch(snapshot.connectionState){


          case ConnectionState.active:
            if(snapshot.hasData){
            return SliverGrid(
                delegate: SliverChildBuilderDelegate(
                    (context,index){
                      return productTile(snapshot.data![index]);
                    },
                  childCount: snapshot.data!.length
                ),

                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: MediaQuery.of(context).size.width~/170,

                ));
            }
            return const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator(),),);

          default:
            return const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator(),),);


        }

      },);
  }
  Widget productTile(db.Product product){
    return Container(
      margin: const EdgeInsets.all(5),
      constraints: const BoxConstraints(
          maxWidth: 90
      ),
      child: PhysicalModel(
        color: Colors.white,
        elevation: 2,
        borderRadius:const BorderRadius.all(  Radius.circular(13)),
        child: Padding(
          padding:const EdgeInsets.all(5),
          child: InkWell(
              onTap: () =>   Get.to(()=>ProductScreen(product)),
            child: Column(
              children: [ClipRRect(
                borderRadius:const BorderRadius.all( Radius.circular(13)),

                child: Container(
                  height: 140,

                  color: Colors.blueGrey,
                  child: Image.network(product.thumbnail,fit: BoxFit.cover,),
                ),

              ),
                Flexible(child: Text(product
                .name)),
                Flexible(child: Text(product.actualPrice.toString())),

              ],
            ),
          ),
        ),
      ),
    );
  }
}


