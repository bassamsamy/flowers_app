import 'package:flowers_app/features/home/domain/entities/product_entity.dart';

abstract class CategoryProductsState{}

abstract class IntialCategoryProductsState extends CategoryProductsState{}

class LoadingCategoryProductsState extends CategoryProductsState {}

class SuccessCategoryProductsState extends CategoryProductsState {
  List<ProductEntity>? products;
  SuccessCategoryProductsState({
    required this.products,
  });
}

class FailCategoryProductsState extends CategoryProductsState {
  Exception? error;
  FailCategoryProductsState({this.error});
}
 