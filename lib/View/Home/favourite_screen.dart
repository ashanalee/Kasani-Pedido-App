import 'package:flutter/material.dart';
import 'package:kasani_fish/Controller/quantity_controller.dart';
import 'package:provider/provider.dart';

import '../../utils/app_colors.dart';

class Favourite extends StatelessWidget {
  const Favourite({super.key, required this.title});
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
              Navigator.pop(context);
            },
          ),
          backgroundColor: AppColors.white,
          title: const Text(
            'FAVORITOS',
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
              const SizedBox(height: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                      child: Consumer<QuantityController>(
                        builder: (context, quantityController, child) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              ItemRoww(
                                description: 'Langostino Jumbo',
                                quantity: quantityController.quantity3,
                                unit: 'Kg',
                                showRemoveButton: true,
                                onDecrement: () {
                                  quantityController.decQuantity3();
                                },
                                onIncrement: () {
                                  quantityController.incQuantity3();
                                },
                              ),
                              Divider(color: AppColors.light),
                              const SizedBox(height: 30),
                              ItemRoww(
                                description: 'Conchas de Abanico',
                                quantity: quantityController.quantity4,
                                unit: 'Doc',
                                onDecrement: () {
                                  quantityController.decQuantity4();
                                },
                                onIncrement: () {
                                  quantityController.incQuantity4();
                                },
                              ),
                              Divider(color: AppColors.light),
                              const SizedBox(height: 10),
                            ],
                          );
                        },
                      ),
                    ),
                    const Spacer(),
                    Center(
                      child: SizedBox(
                        height: 58,
                        width: 313,
                        child: ElevatedButton(
                          onPressed: () {}, // Add your button action here
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.blueLagoon,
                            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                            shadowColor: AppColors.white,
                            elevation: 50,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            'Agregar al carrito',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemRoww extends StatelessWidget {
  final String description;
  final int quantity;
  final String unit;
  final bool showRemoveButton;
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;

  const ItemRoww({
    super.key,
    required this.description,
    required this.quantity,
    required this.unit,
    this.showRemoveButton = true,
    required this.onDecrement,
    required this.onIncrement,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(description, style: const TextStyle(fontSize: 16, color: AppColors.blueLagoon)),
                      const Text('In et eros lectus lobortis viverra', style: TextStyle(fontSize: 12, color: AppColors.black)),
                    ],
                  ),
                ),
                Row(
                  children: [
                    if (showRemoveButton)
                      Container(
                        height: 20.77,
                        width: 20.77,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          border: Border.all(color: AppColors.blueLagoon),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.remove, color: AppColors.blueLagoon, size: 16),
                          onPressed: onDecrement,
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                      ),
                    const SizedBox(width: 5),
                    Container(
                      height: 20.77,
                      width: 11.36,
                      alignment: Alignment.center,
                      child: Text(
                        '$quantity',
                        style: const TextStyle(
                          color: AppColors.black,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Container(
                      height: 20.77,
                      width: 20.77,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        border: Border.all(color: AppColors.blueLagoon),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.add, color: AppColors.blueLagoon, size: 16),
                        onPressed: onIncrement,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      height: 18,
                      width: 27,
                      alignment: Alignment.center,
                      child: Text(
                        unit,
                        style: const TextStyle(
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ],
    );
  }
}
