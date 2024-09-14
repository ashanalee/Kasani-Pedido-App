import 'package:flutter/material.dart';
import 'package:kasani_fish/View/Home/menu_screen.dart';
import 'package:kasani_fish/View/Home/profile_screen.dart';
import 'package:provider/provider.dart';
import '../../Controller/bottom_navbar_controller.dart';
import '../../Controller/quantity_controller.dart';
import 'carrito_screen.dart';
import 'favourite_screen.dart';
import 'langostino_screen.dart';
import 'meriscos_screen.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../Widgets/custom_bottom_navbar.dart';
import '../Widgets/custom_itemrow.dart';
import '../Widgets/custom_text_filelds.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  void _searchItem(BuildContext context, String searchTerm) {
    if (searchTerm.toLowerCase() == 'langostino') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  LangostinoScreen()),
      );
    }
  }

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage(title: title)),
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
          MaterialPageRoute(builder: (context) => const CarritoScreen(title: '')),
        );
        break;
      case 3:
        Navigator.push(
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

  @override
  Widget build(BuildContext context) {
    final _searchController = TextEditingController();

    return ChangeNotifierProvider(
      create: (context) => QuantityController(),
      child: Consumer<BottomNavBarProvider>(
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
                    onSubmitted: (searchTerm) => _searchItem(context, searchTerm),
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
                            Text('Congelados', style: TextStyle(color: AppColors.lavender)),
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
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const Meriscos()),
                              );
                            },
                            child: SizedBox(
                              height: 170,
                              child: Image.asset(Appimages.meriscos, fit: BoxFit.cover),
                            ),
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
                              description: 'Langostinos. eget lectus lobortis viverra.',
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
                              description: 'Langostinos. eget lectus lobortis viverra.',
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
                              description: 'Langostinos. eget lectus lobortis viverra.',
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
                              description: 'Langostinos. eget lectus lobortis viverra.',
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
              onItemTapped: (index) => _onItemTapped(context, index),
            ),
          );
        },
      ),
    );
  }
}
