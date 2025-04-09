import 'package:injectable/injectable.dart';

import '../../../../core/api_manager/api_execute.dart';
import '../../../../core/models/best_seller_model.dart';
import '../../../../core/models/category_model.dart';
import '../../../../core/models/occasion_model.dart';
import '../../../../core/models/result.dart';
import '../../domain/home_repo/home_repo.dart';
import '../home_data_source/home_data_source.dart';

@LazySingleton(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  final HomeDataSource dataSource;

  HomeRepoImpl({required this.dataSource});

  @override
  Future<Result<List<CategoryModel>>> getCategories() {
    return ApiExecute.executeApi(() => dataSource.getCategories());
  }

  @override
  Future<Result<List<OccasionModel>>> getOccasions() {
    return ApiExecute.executeApi(() => dataSource.getOccasions());
  }

  @override
  Future<Result<List<BestSellerModel>>> getBestSeller() {
    return ApiExecute.executeApi(() => dataSource.getBestSeller());
  }
}
