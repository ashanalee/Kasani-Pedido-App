import 'package:flutter/material.dart';
import 'package:kasani_fish/View/Home/carrito_screen.dart';
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
import 'favourite_screen.dart';
import 'home_screen.dart';

class LangostinoScreen extends StatelessWidget {
  LangostinoScreen({super.key});

  final TextEditingController _searchController = TextEditingController();

  void _onItemTapped(BuildContext context, int index) {
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

  void _searchItem(String searchTerm) {
    // Define the logic for search item here
  }

  @override
  Widget build(BuildContext context) {
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
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              CustomSearchTextField(
                controller: _searchController,
                onSubmitted: _searchItem,
                hintText: 'Langostino',
              ),
              const SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 150, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
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
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
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
                          Text('Congelados', style: TextStyle(color: AppColors.lavender)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'FRESCOS',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: AppColors.blueLagoon,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Consumer<QuantityController>(
                    builder: (context, quantityController, child) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ItemRow(
                            description: 'Langostino edget lectus lobortis',
                            quantity: quantityController.quantity1,
                            unit: 'Kg',
                            onDecrement: quantityController.decQuantity1,
                            onIncrement: quantityController.incQuantity1,
                          ),
                          Divider(color: AppColors.light),
                          const SizedBox(height: 10),
                          ItemRow(
                            description: 'Langostino lectus lobortis',
                            quantity: quantityController.quantity3,
                            unit: 'Kg',
                            onDecrement: quantityController.decQuantity3,
                            onIncrement: quantityController.incQuantity3,
                          ),
                          Divider(color: AppColors.light),
                          const SizedBox(height: 10),
                          ItemRow(
                            description: 'Langostino edget lectus lobortis',
                            quantity: quantityController.quantity4,
                            unit: 'Kg',
                            onDecrement: quantityController.decQuantity4,
                            onIncrement: quantityController.incQuantity4,
                          ),
                          Divider(color: AppColors.light),
                          const SizedBox(height: 10),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                            child: Text(
                              'CONGELADOS',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: AppColors.blueLagoon,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          ItemRow(
                            description: 'Langostino edget lectus lobortis',
                            quantity: quantityController.quantity5,
                            unit: 'Kg',
                            onDecrement: quantityController.decQuantity5,
                            onIncrement: quantityController.incQuantity5,
                          ),
                          Divider(color: AppColors.light),
                          const SizedBox(height: 10),
                          ItemRow(
                            description: 'Langostino lectus lobortis',
                            quantity: quantityController.quantity3,
                            unit: 'Kg',
                            onDecrement: quantityController.decQuantity3,
                            onIncrement: quantityController.incQuantity3,
                          ),
                          Divider(color: AppColors.light),
                          const SizedBox(height: 10),
                          ItemRow(
                            description: 'Langostino edget lectus lobortis',
                            quantity: quantityController.quantity4,
                            unit: 'Kg',
                            onDecrement: quantityController.decQuantity4,
                            onIncrement: quantityController.incQuantity4,
                          ),
                          Divider(color: AppColors.light),
                          const SizedBox(height: 10),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: CustomBottomNavBar(
            selectedIndex: bottomNavBarProvider.currentIndex,
            onItemTapped: (index) => _onItemTapped(context, index),
          ),
        );
      },
    );
  }
}
