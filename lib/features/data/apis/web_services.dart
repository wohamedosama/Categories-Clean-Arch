import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:test_apis/core/utils/constant/app_constant.dart';
import 'package:test_apis/features/data/models/categories.dart';

part 'web_services.g.dart';

@RestApi(baseUrl: AppConstant.baseUrl)
abstract class WebServices {
  factory WebServices(Dio dio, {String baseUrl}) = _WebServices;
  @GET("products/categories")
  Future<List<CategoriesModel>> getCategories();
}
