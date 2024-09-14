import 'package:flutter/material.dart';
import 'package:kasani_fish/utils/app_images.dart';
import 'package:provider/provider.dart';

import '../../Controller/bottom_navbar_controller.dart';
import '../../utils/app_colors.dart';
import '../Widgets/custom_bottom_navbar.dart';
import 'carrito_screen.dart';
import 'favourite_screen.dart';
import 'home_screen.dart';
import 'information_screen.dart';
import 'menu_screen.dart';

class Profile extends StatelessWidget {
  const Profile({super.key, required this.title});

  final String title;

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
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
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Favourite(title: '')),
        );
        break;
      case 4:
        Navigator.push(
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
                'INFORMACION',
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
                const SizedBox(height: 30),
                Center(
                  child: SizedBox(
                    height: 93,
                    width: 317,
                    child: Image.asset(
                      Appimages.profileimg,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.fromLTRB(25, 50, 25, 10),
                  child: Text(
                    'Mi perfil',
                    style: TextStyle(fontSize: 14, color: AppColors.black),
                  ),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    'Nombre Apellido',
                    style: TextStyle(fontSize: 12, color: AppColors.black),
                  ),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    'nombre@restaurante.com',
                    style: TextStyle(fontSize: 12, color: AppColors.black),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 23),
                  child: SizedBox(
                      width: 180,
                      child: Divider()),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    'Nombre Restaurante',
                    style: TextStyle(fontSize: 12, color: AppColors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const Information(title: '')),
                      );
                    },
                    child: const Text(
                      'Direccion Locales',
                      style: TextStyle(fontSize: 12, color: AppColors.black),
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
        });
  }
}
