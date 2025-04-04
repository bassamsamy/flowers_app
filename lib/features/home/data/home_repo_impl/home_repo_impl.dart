import 'package:flowers_app/features/home/data/home_data_source/home_data_source.dart';
import 'package:flowers_app/features/home/domain/home_repo/home_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  HomeRepoImpl({required this.homeDataSource});

  HomeDataSource homeDataSource;
}
