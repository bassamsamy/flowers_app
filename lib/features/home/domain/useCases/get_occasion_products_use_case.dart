import 'package:flowers_app/core/models/result.dart';
import 'package:flowers_app/features/home/domain/entities/product_entity.dart';
import 'package:flowers_app/features/home/domain/home_repo/home_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetOccasionProductsUseCase {
  GetOccasionProductsUseCase({required this.homeRepo});
  HomeRepo homeRepo;
  Future<Result<List<ProductEntity>?>> getProducts(Map<String,dynamic>occasionId){
    return homeRepo.getProducts(occasionId);
  }
}