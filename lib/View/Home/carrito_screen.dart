import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kasani_fish/View/Home/datos_screen.dart';
import 'package:kasani_fish/View/Widgets/custom_button.dart';
import '../../utils/app_colors.dart';
import '../Widgets/custom_icon_row.dart';
import 'home_screen.dart';
import '../../Controller/quantity_controller.dart';

class CarritoScreen extends StatelessWidget {
  const CarritoScreen({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => QuantityController(),
      child: Scaffold(
      backgroundColor: AppColors.lightblue,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.deeppurple),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyHomePage(title: '')),
            );
          },
        ),
        backgroundColor: AppColors.white,
        title: const Text(
          'Carrito',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.deeppurple,
            fontSize: 17,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 30, 10, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(50, 30, 10, 10),
              child: Text(
                'Productos seleccionados',
                style: TextStyle(
                  color: AppColors.blueLagoon,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Consumer<QuantityController>(
                builder: (context, quantityController, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            ItemRow(
                              description: 'In et eros lectus lobortis viverra',
                              quantity: quantityController.quantity1,
                              unit: 'Kg',
                              showRemoveButton: true,
                              onDecrement: () {
                                quantityController.decQuantity1();
                              },
                              onIncrement: () {
                                quantityController.incQuantity1();
                              },
                            ),
                            Divider(color: AppColors.light),
                            const SizedBox(height: 30),
                            ItemRow(
                              description: 'In et eros lectus lobortis viverra',
                              quantity: quantityController.quantity2,
                              unit: 'Doc',
                              showRemoveButton: true,
                              onDecrement: () {
                                quantityController.decQuantity2();
                              },
                              onIncrement: () {
                                quantityController.incQuantity2();
                              },
                            ),
                            Divider(color: AppColors.light),
                            const SizedBox(height: 10),
                            Center(
                              child: SizedBox(
                                height: 40,
                                width: 175,
                                child: ElevatedButton.icon(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    alignment: Alignment.center,
                                    backgroundColor: AppColors.blue,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  icon: const Icon(
                                    Icons.add,
                                    color: AppColors.white,
                                    size: 16,
                                  ),
                                  label: const Text(
                                    'Agregar producto',
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Center(
                        child: CustomButton(
                          text: 'Continuar',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Datos(title: '')),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),),
    );
  }
}
