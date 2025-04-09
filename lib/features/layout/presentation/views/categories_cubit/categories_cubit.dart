import 'package:flowers_app/core/models/result.dart';
import 'package:flowers_app/features/home/domain/useCases/get_category_products_use_case.dart';
import 'package:flowers_app/features/layout/presentation/views/categories_cubit/categories_intent.dart';
import 'package:flowers_app/features/layout/presentation/views/categories_cubit/categories_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class CategoryViewModel extends Cubit<CategoryProductsState> {
  CategoryViewModel({required this.getCategoryProductsUseCase})
      : super(LoadingCategoryProductsState());
  GetCategoryProductsUseCase getCategoryProductsUseCase;
  void doIntent(CategoryProductsIntent intent) {
    switch (intent) {
      case LoadCategoryProductsIntent():
        {
          _loadCategoryProducts(intent.id);
        }
    }
  }

  void _loadCategoryProducts(Map<String,dynamic>id) async {
    emit(LoadingCategoryProductsState());
    var response = await getCategoryProductsUseCase.getProducts(id);
    switch (response) {
      case Success():
        {
          emit(
            SuccessCategoryProductsState(products: response.data),
          );
        }
      case Error():
        {
          emit(FailCategoryProductsState(error: response.exception));
        }
    }
  }
}

