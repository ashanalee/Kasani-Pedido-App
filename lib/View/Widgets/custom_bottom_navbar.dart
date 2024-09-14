
import 'package:flutter/material.dart';
import 'package:kasani_fish/View/Home/carrito_screen.dart';
import 'package:kasani_fish/View/Home/profile_screen.dart';
import 'package:provider/provider.dart';
import '../../Controller/bottom_navbar_controller.dart';
import '../../utils/app_colors.dart';
import '../Home/favourite_screen.dart';
import '../Home/home_screen.dart';
import '../Home/menu_screen.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const CustomBottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavBarProvider>(
      builder: (context, bottomNavBarProvider, child) {
        return SizedBox(
          height: 65,
          child: BottomNavigationBar(
            currentIndex: bottomNavBarProvider.currentIndex,
            onTap: (index) {
              bottomNavBarProvider.setIndex(index);
              _handleNavigation(context, index);
            },
            selectedItemColor: AppColors.blueLagoon,
            unselectedItemColor: AppColors.lavender,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined, size: 29),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.menu, size: 29),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined, size: 29),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline, size: 29),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline, size: 29),
                label: '',
              ),
            ],
          ),
        );
      },
    );
  }

  void _handleNavigation(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyHomePage(title: '')),
        );
        break;
      case 1:
        Navigator.push(
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
}

