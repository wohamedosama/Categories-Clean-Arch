import 'package:flutter/material.dart';
import 'package:test_apis/features/presentation/widgets/category_details_dialog.dart';
import 'package:test_apis/features/presentation/widgets/category_item.dart';

class CategoriesList extends StatelessWidget {
  final List<dynamic> categories;

  const CategoriesList({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return CategoryItem(
          category: category,
          index: index,
          onTap: () => CategoryDetailsDialog.show(context, category),
        );
      },
    );
  }
}
