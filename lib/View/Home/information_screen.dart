import 'package:flutter/material.dart';
import 'package:kasani_fish/View/Home/profile_screen.dart';
import 'package:kasani_fish/View/Widgets/custom_bottom_navbar.dart';
import 'package:provider/provider.dart';
import '../../Controller/bottom_navbar_controller.dart';
import '../../utils/app_colors.dart';
import 'favourite_screen.dart';
import 'home_screen.dart';
import 'menu_screen.dart';

class Information extends StatelessWidget {
  const Information({super.key, required this.title});
  final String title;

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
      // Navigate to Shopping Cart
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
    final List<Map<String, String>> pedidos = [
      {'estado': 'Sí', 'nombre': 'Fito Perez'},
      {'estado': 'Sí', 'nombre': 'Angel Castillo'},
      {'estado': 'Sí', 'nombre': 'Diego Quiróz'},
      {'estado': 'No', 'nombre': 'Maju Mantilla'},
      {'estado': 'No', 'nombre': 'John Hof'},
      {'estado': 'No', 'nombre': 'John Doe'},
      {'estado': 'Sí', 'nombre': 'Alberto Casas'},
      {'estado': 'Sí', 'nombre': 'Roy Enriquez'},
      {'estado': 'No', 'nombre': 'Darwin Cano'},
      {'estado': 'No', 'nombre': 'Julio Conde'},
    ];

    return Scaffold(
      backgroundColor: AppColors.lightblue,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.white,
        title: const Text(
          'INFORMACION',
          style: TextStyle(
            fontSize: 17,
            color: AppColors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Consumer<BottomNavBarProvider>(
        builder: (context, bottomNavBarProvider, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  '5 de Junio 2024',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                const Row(
                  children: <Widget>[
                    Expanded(child: Text('Estado', style: TextStyle(fontSize: 14))),
                    Expanded(child: Text('Nombre', style: TextStyle(fontSize: 14))),
                  ],
                ),
                const Divider(),
                Expanded(
                  child: ListView.builder(
                    itemCount: pedidos.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Row(
                            children: <Widget>[
                              Expanded(child: Text(pedidos[index]['estado']!)),
                              Expanded(child: Text(pedidos[index]['nombre']!)),
                              SizedBox(
                                height: 28,
                                width: 120,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.blueLagoon, // Button color
                                  ),
                                  child: const Text(
                                    'Crear Pedido',
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Divider(),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Consumer<BottomNavBarProvider>(
        builder: (context, bottomNavBarProvider, child) {
          return CustomBottomNavBar(
            selectedIndex: bottomNavBarProvider.currentIndex,
            onItemTapped: (index) => _onItemTapped(context, index),
          );
        },
      ),
    );
  }
}
