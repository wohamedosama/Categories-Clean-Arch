import 'package:test_apis/features/data/models/categories.dart';
import 'package:test_apis/features/domain/repo_interface/categories_repo_interface.dart';

class GetCategoriesUseCase {
  final CategoriesRepo categoriesRepo;

  GetCategoriesUseCase(this.categoriesRepo);

  Future<List<CategoriesModel>> call() async {
    try {
      final categories = await categoriesRepo.getCategories();
      return categories;
    } catch (e) {
      rethrow;
    }
  }
}
