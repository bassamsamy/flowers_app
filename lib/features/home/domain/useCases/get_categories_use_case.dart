import 'package:injectable/injectable.dart';

import '../../../../core/models/category_model.dart';
import '../../../../core/models/result.dart';
import '../home_repo/home_repo.dart';
@injectable
class GetCategoriesUseCase {
  final HomeRepo repo;

  GetCategoriesUseCase(this.repo);

  Future<Result<List<CategoryModel>>> call() => repo.getCategories();
}
