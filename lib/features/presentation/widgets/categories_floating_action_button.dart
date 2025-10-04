import 'package:flutter/material.dart';
import 'package:test_apis/core/di/simple_di.dart';

class CategoriesFloatingActionButton extends StatelessWidget {
  const CategoriesFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        SimpleDI.instance.categoriesCubit.getCategories();
      },
      backgroundColor: Colors.black87,
      foregroundColor: Colors.white,
      elevation: 4,
      child: const Icon(Icons.refresh_rounded),
    );
  }
}
