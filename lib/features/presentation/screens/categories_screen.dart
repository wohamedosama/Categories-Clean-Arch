import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_apis/core/di/simple_di.dart';
import 'package:test_apis/features/presentation/cubit/categories_cubit.dart';
import 'package:test_apis/features/presentation/widgets/categories_app_bar.dart';
import 'package:test_apis/features/presentation/widgets/categories_error_state.dart';
import 'package:test_apis/features/presentation/widgets/categories_floating_action_button.dart';
import 'package:test_apis/features/presentation/widgets/categories_initial_state.dart';
import 'package:test_apis/features/presentation/widgets/categories_loading_state.dart';
import 'package:test_apis/features/presentation/widgets/categories_success_state.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: const CategoriesAppBar(),
      body: BlocProvider(
        create: (context) => SimpleDI.instance.categoriesCubit,
        child: const CategoriesBody(),
      ),
      floatingActionButton: const CategoriesFloatingActionButton(),
    );
  }
}

class CategoriesBody extends StatelessWidget {
  const CategoriesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        return state.when(
          initial: () => const CategoriesInitialState(),
          loading: () => const CategoriesLoadingState(),
          success: (categories) =>
              CategoriesSuccessState(categories: categories),
          error: (message) => CategoriesErrorState(message: message),
        );
      },
    );
  }
}
