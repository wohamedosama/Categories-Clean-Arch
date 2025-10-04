part of 'categories_cubit.dart';

@freezed
class CategoriesState with _$CategoriesState {
  const factory CategoriesState.initial() = Initial;
  const factory CategoriesState.loading() = Loading;
  const factory CategoriesState.success(List<CategoriesModel> categories) =
      Success;
  const factory CategoriesState.error(String message) = Error;
}
