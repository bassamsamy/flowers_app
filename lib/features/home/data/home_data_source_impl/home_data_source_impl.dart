import 'package:flowers_app/core/api_manager/api_constants.dart';
import 'package:flowers_app/core/api_manager/api_execute.dart';
import 'package:flowers_app/core/api_manager/api_manger.dart';
import 'package:flowers_app/core/models/result.dart';
import 'package:flowers_app/features/home/data/home_data_source/home_data_source.dart';
import 'package:flowers_app/features/home/data/models/occasions_model/occasion.dart';
import 'package:flowers_app/features/home/data/models/occasions_model/occasions_model.dart';
import 'package:flowers_app/features/home/data/models/product_model.dart/product_response/product_response.dart';
import 'package:flowers_app/features/home/domain/entities/occasion_entity.dart';
import 'package:flowers_app/features/home/domain/entities/product_entity.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:HomeDataSource)
class HomeDataSourceImpl implements HomeDataSource{
  HomeDataSourceImpl({required this.apiManager});
  ApiManager apiManager;

  @override
  Future<Result<List<ProductEntity>?>> getProducts(occasionId) {
     return ApiExecute.executeApi<List<ProductEntity>>(()async{
      var response= await apiManager.get(ApiConstants.getOccasionProducts,queryParams: occasionId);
     var responseDto= ProductResponse.fromJson(response.data);
     var OccasionProducts=responseDto.products;
     var OccasionProductsList=OccasionProducts?.map((occasionProduct)=>occasionProduct.toProductEntity()).toList()??[];
     return OccasionProductsList;
    });
  }
}