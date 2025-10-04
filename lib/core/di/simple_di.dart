import 'package:dio/dio.dart';
import 'package:test_apis/features/data/apis/web_services.dart';
import 'package:test_apis/features/data/repo_implementation/categories_repo_implemntatio.dart';
import 'package:test_apis/features/domain/repo_interface/categories_repo_interface.dart';
import 'package:test_apis/features/domain/use_case/get_categories_use_case.dart';
import 'package:test_apis/features/presentation/cubit/categories_cubit.dart';

class SimpleDI {
  static late final SimpleDI _instance;
  static SimpleDI get instance => _instance;

  // Dependencies
  late final Dio _dio;
  late final WebServices _webServices;
  late final CategoriesRepo _categoriesRepo;
  late final GetCategoriesUseCase _getCategoriesUseCase;
  late final CategoriesCubit _categoriesCubit;

  // Getters
  Dio get dio => _dio;
  WebServices get webServices => _webServices;
  CategoriesRepo get categoriesRepo => _categoriesRepo;
  GetCategoriesUseCase get getCategoriesUseCase => _getCategoriesUseCase;
  CategoriesCubit get categoriesCubit => _categoriesCubit;

  void init() {
    // Initialize Dio
    _dio = Dio();
    _dio.options.connectTimeout = const Duration(seconds: 30);
    _dio.options.receiveTimeout = const Duration(seconds: 30);

    // Initialize WebServices
    _webServices = WebServices(_dio);

    // Initialize Repository
    _categoriesRepo = CategoriesRepoImplementation(_webServices);

    // Initialize Use Case
    _getCategoriesUseCase = GetCategoriesUseCase(_categoriesRepo);

    // Initialize Cubit
    _categoriesCubit = CategoriesCubit(_getCategoriesUseCase);
  }

  static void initialize() {
    _instance = SimpleDI();
    _instance.init();
  }
}
