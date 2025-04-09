
import 'package:injectable/injectable.dart';

import '../../../../core/models/occasion_model.dart';
import '../../../../core/models/result.dart';
import '../home_repo/home_repo.dart';
@injectable
class GetOccasionsUseCase {
  final HomeRepo repo;

  GetOccasionsUseCase(this.repo);

  Future<Result<List<OccasionModel>>> call() => repo.getOccasions();
}
