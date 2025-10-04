import 'package:test_apis/features/data/models/categories.dart';

abstract class CategoriesRepo {
  Future<List<CategoriesModel>> getCategories();
}
