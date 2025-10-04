import 'package:flutter/material.dart';
import 'package:test_apis/features/presentation/widgets/category_detail_row.dart';

class CategoryDetailsDialog {
  static void show(BuildContext context, dynamic category) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(
          category.name ?? 'Category Details',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.grey[800],
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategoryDetailRow(
              label: 'Name:',
              value: category.name ?? 'Not available',
            ),
            CategoryDetailRow(
              label: 'Slug:',
              value: category.slug ?? 'Not available',
            ),
            CategoryDetailRow(
              label: 'URL:',
              value: category.url ?? 'Not available',
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            style: TextButton.styleFrom(
              foregroundColor: Colors.grey[700],
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: const Text(
              'Close',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
