import 'package:flutter/material.dart';

class ItemRow extends StatelessWidget {
  final String description;
  final int quantity;
  final String unit;
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;

  const ItemRow({
    super.key,
    required this.description,
    required this.quantity,
    required this.unit,
    required this.onDecrement,
    required this.onIncrement,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(description, style: const TextStyle(color: Colors.black)),
        ),
        Row(
          children: [
            Container(
              height: 20.77,
              width: 20.77,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.blue),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.remove, color: Colors.blue, size: 16),
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
                  color: Colors.black,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            const SizedBox(width: 5),
            Container(
              height: 20.77,
              width: 20.77,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.blue),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.add, color: Colors.blue, size: 16),
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
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

