import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:lezzo_assignment/get_controllers/get_database_controller.dart';
import 'package:lezzo_assignment/ui/cart_screen.dart';
import 'package:lezzo_assignment/ui/dashboard.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key){
    Get.put(GetDatabaseController(),permanent: true,tag: 'database');
  }

  final PageController _controller = PageController();
  Rx<int> currentIndex=0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        onPageChanged: (value) {
           currentIndex.value=value;
        },
        children:  [
          Dashboard(),

          CartScreen()
        ],
      ),
      bottomNavigationBar: Obx((){
        return BottomNavigationBar(
          currentIndex: currentIndex.value,
          onTap: (index) =>
             _controller.animateToPage(index, duration: const Duration(milliseconds: 200),
                 curve: Curves.easeIn)
         ,
          items: const [

            BottomNavigationBarItem(icon: Icon(Icons.home),
              activeIcon: Icon(Icons.home,color: Colors.red,),label: 'Home',)
            ,BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),
              activeIcon: Icon(Icons.home,color: Colors.red,),label: 'Cart')
          ],
        );
      }
      ),
    );

  }
}
