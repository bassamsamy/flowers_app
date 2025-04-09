import 'package:injectable/injectable.dart';

import '../../../../core/api_manager/api_constants.dart';
import '../../../../core/api_manager/api_manger.dart';
import '../../../../core/models/best_seller_model.dart';
import '../../../../core/models/category_model.dart';
import '../../../../core/models/occasion_model.dart';
import '../home_data_source/home_data_source.dart';

@LazySingleton(as: HomeDataSource)
class HomeDataSourceImpl implements HomeDataSource {
  final ApiManager apiManager;

  HomeDataSourceImpl({required this.apiManager});

  @override
  Future<List<CategoryModel>> getCategories() async {
    final response = await apiManager.get(ApiConstants.getCategories);
    final data = response.data['data'] as List;
    return data.map((e) => CategoryModel.fromJson(e)).toList();
  }

  @override
  Future<List<OccasionModel>> getOccasions() async {
    final response = await apiManager.get(ApiConstants.getOccasions);
    final data = response.data['data'] as List;
    return data.map((e) => OccasionModel.fromJson(e)).toList();
  }

  @override
  Future<List<BestSellerModel>> getBestSeller() async {
    final response = await apiManager.get(ApiConstants.getBestSeller);
    final data = response.data['data'] as List;
    return data.map((e) => BestSellerModel.fromJson(e)).toList();
  }
}
