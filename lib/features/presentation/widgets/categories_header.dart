import 'package:flutter/material.dart';

class CategoriesHeader extends StatelessWidget {
  final int categoriesCount;

  const CategoriesHeader({super.key, required this.categoriesCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.check_circle_rounded,
              color: Colors.grey[700],
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            '$categoriesCount categories loaded',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
    );
  }
}
