import 'package:flowers_app/core/models/result.dart';
import 'package:flowers_app/features/home/domain/entities/product_entity.dart';

abstract class HomeRepo {
  Future<Result<List<ProductEntity>?>> getProducts(Map<String,dynamic>occasionId);
}

