import 'package:flowers_app/features/home/domain/entities/product_entity.dart';

abstract class OccasionProductsState{}

abstract class IntialOccasionProductsState extends OccasionProductsState{}

class LoadingOccasionProductsState extends OccasionProductsState {}

class SuccessOccasionProductsState extends OccasionProductsState {
  List<ProductEntity>? products;
  SuccessOccasionProductsState({
    required this.products,
  });
}

class FailOccasionProductsState extends OccasionProductsState {
  Exception? error;
  FailOccasionProductsState({this.error});
}
 