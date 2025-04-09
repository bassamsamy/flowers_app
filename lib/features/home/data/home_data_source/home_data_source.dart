import '../../../../core/models/best_seller_model.dart';
import '../../../../core/models/category_model.dart';
import '../../../../core/models/occasion_model.dart';

abstract class HomeDataSource {
  Future<List<CategoryModel>> getCategories();
  Future<List<OccasionModel>> getOccasions();
  Future<List<BestSellerModel>> getBestSeller();
}
