import 'package:flowers_app/core/api_manager/api_manger.dart';
import 'package:flowers_app/features/home/data/home_data_source/home_data_source.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:HomeDataSource)
class HomeDataSourceImpl implements HomeDataSource{
  HomeDataSourceImpl({required this.apiManager});
  ApiManager apiManager;
}