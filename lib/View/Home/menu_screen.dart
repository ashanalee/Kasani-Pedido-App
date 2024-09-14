import 'package:flutter/material.dart';
import 'package:kasani_fish/View/Home/carrito_screen.dart';
import 'package:kasani_fish/View/Home/profile_screen.dart';
import 'package:provider/provider.dart';
import '../../Controller/bottom_navbar_controller.dart';
import '../../utils/app_colors.dart';
import '../Widgets/custom_bottom_navbar.dart';
import 'favourite_screen.dart';
import 'home_screen.dart';
import 'menu_screen2.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

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
        Navigator.push(
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
    return Consumer<BottomNavBarProvider>(
      builder: (context, bottomNavBarProvider, child) {
        return Scaffold(
          backgroundColor: AppColors.lightblue,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.white,
            title: const Text(
              'HISTORIA DE PEDIDOS',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.deeppurple,
                fontSize: 17,
              ),
            ),
            centerTitle: true,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(200, 30, 0, 0),
                child: Row(
                  children: [
                    Text(
                      'Últimos 30 días',
                      style: TextStyle(fontSize: 14, color: AppColors.black),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: AppColors.black,
                      size: 15,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.fromLTRB(200, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.brightness_1, size: 6, color: AppColors.black),
                        SizedBox(width: 4),
                        Text(
                          'Últimos 7 días',
                          style: TextStyle(color: AppColors.black, fontSize: 10),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.brightness_1, size: 6, color: AppColors.black),
                        SizedBox(width: 4),
                        Text(
                          'Últimos 14 días',
                          style: TextStyle(color: AppColors.black, fontSize: 10),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.brightness_1, size: 6, color: AppColors.black),
                        SizedBox(width: 4),
                        Text(
                          'Últimos 30 días',
                          style: TextStyle(color: AppColors.black, fontSize: 10),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.brightness_1, size: 6, color: AppColors.black),
                        SizedBox(width: 4),
                        Text(
                          'Desde siempre',
                          style: TextStyle(color: AppColors.black, fontSize: 10),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0),
                child: TextField(
                  cursorWidth: 2.0,
                  decoration: InputDecoration(
                    hintText: 'Fecha',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Text(
                          '1 Jun',
                          style: TextStyle(
                            height: 1.0,
                            fontSize: 14,
                            color: AppColors.black,
                          ),
                        ),
                        const SizedBox(width: 100),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => const Menu2(title: '')),
                            );
                          },
                          child: Container(
                            height: 20,
                            width: 85,
                            decoration: BoxDecoration(
                              color: AppColors.blueLagoon,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: const Center(
                              child: Text(
                                'Ver detalles',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(color: AppColors.light),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Text(
                          '4 Jun',
                          style: TextStyle(
                            height: 1.0,
                            fontSize: 14,
                            color: AppColors.black,
                          ),
                        ),
                        const SizedBox(width: 100),
                        GestureDetector(
                          onTap: () {

                          },
                          child: Container(
                            height: 20,
                            width: 85,
                            decoration: BoxDecoration(
                              color: AppColors.blueLagoon,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: const Center(
                              child: Text(
                                'Ver detalles',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
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
