import '../../../../core/models/best_seller_model.dart';
import '../../../../core/models/category_model.dart';
import '../../../../core/models/occasion_model.dart';
import '../../../../core/models/result.dart';

abstract class HomeRepo {
  Future<Result<List<CategoryModel>>> getCategories();
  Future<Result<List<OccasionModel>>> getOccasions();
  Future<Result<List<BestSellerModel>>> getBestSeller();
}
