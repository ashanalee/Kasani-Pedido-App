import 'package:flutter/material.dart';
import 'package:kasani_fish/View/Home/carrito_screen.dart';
import 'package:kasani_fish/View/Home/menu_screen.dart';
import 'package:kasani_fish/View/Widgets/custom_button.dart';

import '../../utils/app_colors.dart';
import '../Widgets/custom_row_widget.dart';

class Menu2 extends StatelessWidget {
  const Menu2({super.key, required this.title});
  final String title;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightblue,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.deeppurple),
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => const MenuScreen()),
            );
          },
        ),
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
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 70, 5, 0),
              child: Container(
                height: 179,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: AppColors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(25, 20, 10, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Datos de entrega',
                        style: TextStyle(fontSize: 18, color: AppColors.black, fontWeight: FontWeight.normal),
                      ),
                      const SizedBox(height: 10),
                      RichText(
                        text: const TextSpan(
                          text: 'Fecha de entrega:   ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                            fontSize: 13,
                          ),
                          children: [
                            TextSpan(
                              text: '30/05',
                              style: TextStyle(fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      RichText(
                        text: const TextSpan(
                          text: 'Hora de entrega:     ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                            fontSize: 13,
                          ),
                          children: [
                            TextSpan(
                              text: 'De 11: 00 am a 1: 00 pm',
                              style: TextStyle(fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      RichText(
                        text: const TextSpan(
                          text: 'Lugar de entrega:   ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                            fontSize: 13,
                          ),
                          children: [
                            TextSpan(
                              text: 'Local Socabaya',
                              style: TextStyle(fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Mi pedido',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ItemRow(
                description: 'Langostino Jumbo',
                quantity: 1,
                unit: 'Kg',
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Divider(color: AppColors.light),
              ),
              const SizedBox(height: 15),
              const ItemRow(
                description: 'Conchas de Abanico',
                quantity: 2,
                unit: 'Doc',
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Divider(color: AppColors.light),
              ),
              const SizedBox(height: 140),
              Center(
                child: Container(
                  height: 58,
                  width: 313,
                  child: CustomButton(text: 'Repiter Pedido', onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CarritoScreen(title: '',),
                      ),
                    );
                  })
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

