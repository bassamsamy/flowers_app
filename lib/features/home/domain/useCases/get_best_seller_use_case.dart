

import 'package:injectable/injectable.dart';

import '../../../../core/models/best_seller_model.dart';
import '../../../../core/models/result.dart';
import '../home_repo/home_repo.dart';
@injectable
class GetBestSellerUseCase {
  final HomeRepo repo;

  GetBestSellerUseCase(this.repo);

  Future<Result<List<BestSellerModel>>> call() => repo.getBestSeller();
}
