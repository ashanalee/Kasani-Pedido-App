import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class ItemRow extends StatelessWidget {
  final String description;
  final int quantity;
  final String unit;
  final bool showRemoveButton;
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;

  const ItemRow({
    super.key,
    required this.description,
    required this.quantity,
    required this.unit,
    this.showRemoveButton = true,
    required this.onDecrement,
    required this.onIncrement,
  });

  void _showCommentsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            height: 420,
            width: 363,
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.delete, color: AppColors.black),
                    const Text("Comentarios"),
                    IconButton(
                      icon: const Icon(Icons.close, color: AppColors.black),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                TextField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    constraints: const BoxConstraints(
                      maxHeight: 178,
                      maxWidth: 327,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: const Text("Agregar"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.blueLagoon,
                  ),
                  child: const Text("Cancelar"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

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
                      Text(description, style: const TextStyle(fontSize: 12, color: AppColors.black)),
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
        Positioned(
          right: 30,
          top: -35,
          child: IconButton(
            icon: const Icon(Icons.message, size: 20, color: AppColors.black),
            onPressed: () {
              _showCommentsDialog(context);
            },
          ),
        ),
        Positioned(
          right: -10,
          top: -35,
          child: IconButton(
            icon: const Icon(Icons.delete_forever_sharp, size: 22, color: AppColors.black),
            onPressed: () {
              _showCommentsDialog(context);
            },
          ),
        ),
      ],
    );
  }
}
