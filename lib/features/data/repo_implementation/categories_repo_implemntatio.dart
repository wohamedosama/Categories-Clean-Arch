import 'package:test_apis/features/data/apis/web_services.dart';
import 'package:test_apis/features/data/models/categories.dart';
import 'package:test_apis/features/domain/repo_interface/categories_repo_interface.dart';

class CategoriesRepoImplementation implements CategoriesRepo {
  final WebServices webServices;
  CategoriesRepoImplementation(this.webServices);
  @override
  Future<List<CategoriesModel>> getCategories() async {
    return await webServices.getCategories();
  }
}
