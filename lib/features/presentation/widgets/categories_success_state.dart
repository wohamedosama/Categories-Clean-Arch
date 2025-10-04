import 'package:flutter/material.dart';
import 'package:test_apis/features/presentation/widgets/categories_header.dart';
import 'package:test_apis/features/presentation/widgets/categories_list.dart';

class CategoriesSuccessState extends StatelessWidget {
  final List<dynamic> categories;

  const CategoriesSuccessState({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CategoriesHeader(categoriesCount: categories.length),
        Expanded(child: CategoriesList(categories: categories)),
      ],
    );
  }
}
