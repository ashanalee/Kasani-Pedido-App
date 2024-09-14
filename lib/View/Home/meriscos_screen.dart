import 'package:flutter/material.dart';
import 'package:kasani_fish/View/Home/menu_screen.dart';
import 'package:kasani_fish/View/Home/profile_screen.dart';
import 'package:provider/provider.dart';
import '../../Controller/bottom_navbar_controller.dart';
import '../../Controller/quantity_controller.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../Widgets/custom_bottom_navbar.dart';
import '../Widgets/custom_itemrow.dart';
import '../Widgets/custom_text_filelds.dart';
import 'carrito_screen.dart';
import 'favourite_screen.dart';
import 'home_screen.dart';

class Meriscos extends StatelessWidget {
  const Meriscos({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _searchController = TextEditingController();

    void _searchItem(String searchTerm) {
      // Implement search logic here
    }

    void _onItemTapped(int index) {
      switch (index) {
        case 0:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MyHomePage(title: '')),
          );
          break;
        case 1:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MenuScreen()),
          );
          break;
        case 2:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const CarritoScreen(title: 'Carrito')),
          );
          break;
        case 3:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Favourite(title: '')),
          );
          break;
        case 4:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Profile(title: '')),
          );
          break;
      }
    }

    return Consumer<BottomNavBarProvider>(
      builder: (context, bottomNavBarProvider, child) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.white,
            title: const Text(
              'Realiza tu Pedido',
              style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
          backgroundColor: AppColors.lightblue,
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                CustomSearchTextField(
                  controller: _searchController,
                  onSubmitted: _searchItem,
                  hintText: 'Buscar',
                ),
                const SizedBox(height: 6),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 150, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          ClipOval(
                            child: Image.asset(
                              Appimages.frescos,
                              height: 39,
                              width: 39,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text('Frescos', style: TextStyle(color: AppColors.lavender)),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Column(
                        children: [
                          ClipOval(
                            child: Image.asset(
                              Appimages.congelados,
                              height: 40,
                              width: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'Congelados',
                            style: TextStyle(color: AppColors.blueLagoon, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 170,
                          child: Image.asset(Appimages.pescados, fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: SizedBox(
                          height: 170,
                          child: Image.asset(Appimages.meriscoslight, fit: BoxFit.cover),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 1),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Consumer<QuantityController>(
                    builder: (context, quantityController, child) {
                      return Column(
                        children: [
                          ItemRow(
                            description: 'Langostino eget lectus lobortis',
                            quantity: quantityController.quantity1,
                            unit: 'Kg',
                            onDecrement: () {
                              quantityController.decQuantity1();
                            },
                            onIncrement: () {
                              quantityController.incQuantity1();
                            },
                          ),
                          Divider(color: AppColors.light),
                          ItemRow(
                            description: 'Langostino eget lectus lobortis',
                            quantity: quantityController.quantity2,
                            unit: 'Doc',
                            onDecrement: () {
                              quantityController.decQuantity2();
                            },
                            onIncrement: () {
                              quantityController.incQuantity2();
                            },
                          ),
                          Divider(color: AppColors.light),
                          ItemRow(
                            description: 'Langostino eget lectus lobortis',
                            quantity: quantityController.quantity3,
                            unit: 'Und',
                            onDecrement: () {
                              quantityController.decQuantity3();
                            },
                            onIncrement: () {
                              quantityController.incQuantity3();
                            },
                          ),
                          Divider(color: AppColors.light),
                          ItemRow(
                            description: 'Langostino eget lectus lobortis',
                            quantity: quantityController.quantity4,
                            unit: 'Kg',
                            onDecrement: () {
                              quantityController.decQuantity4();
                            },
                            onIncrement: () {
                              quantityController.incQuantity4();
                            },
                          ),
                          Divider(color: AppColors.light),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: CustomBottomNavBar(
            selectedIndex: bottomNavBarProvider.currentIndex,
            onItemTapped: _onItemTapped,
          ),
        );
      },
    );
  }
}
