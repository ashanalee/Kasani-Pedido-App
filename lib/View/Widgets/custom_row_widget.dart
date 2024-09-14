import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class ItemRow extends StatelessWidget {
  final String description;
  final int quantity;
  final String unit;

  const ItemRow({
    super.key,
    required this.description,
    required this.quantity,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  description,
                  style: const TextStyle(fontSize: 16, color: AppColors.blueLagoon),
                ),
                const Text(
                  'In et eros lectus lobortis viverra',
                  style: TextStyle(fontSize: 12, color: AppColors.black),
                ),
              ],
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
    );
  }
}
