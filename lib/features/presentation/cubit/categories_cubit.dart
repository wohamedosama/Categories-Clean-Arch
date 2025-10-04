import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_apis/features/data/models/categories.dart';
import 'package:test_apis/features/domain/use_case/get_categories_use_case.dart';

part 'categories_cubit.freezed.dart';
part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this.getCategoriesUseCase) : super(CategoriesState.initial());
  final GetCategoriesUseCase getCategoriesUseCase;

  void getCategories() async {
    emit(CategoriesState.loading());
    try {
      final categories = await getCategoriesUseCase();
      emit(CategoriesState.success(categories));
    } catch (error) {
      emit(
        CategoriesState.error('Failed to load categories: ${error.toString()}'),
      );
    }
  }
}
