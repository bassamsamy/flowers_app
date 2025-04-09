import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/models/best_seller_model.dart';
import '../../../../core/models/category_model.dart';
import '../../../../core/models/occasion_model.dart';
import '../../../../core/models/result.dart';
import '../../domain/useCases/get_best_seller_use_case.dart';
import '../../domain/useCases/get_categories_use_case.dart';
import '../../domain/useCases/get_occasions_use_case.dart';
import 'HomeState.dart';
 @injectable
class HomeCubit extends Cubit<HomeState> {
  final GetCategoriesUseCase getAllCategoriesUseCase;
  final GetBestSellerUseCase getBestSellerUseCase;
  final GetOccasionsUseCase getAllOccasionsUseCase;

  HomeCubit({
    required this.getAllCategoriesUseCase,
    required this.getBestSellerUseCase,
    required this.getAllOccasionsUseCase,
  }) : super(HomeInitial());

  List<CategoryModel> categories = [];
  List<BestSellerModel> bestSellers = [];
  List<OccasionModel> occasions = [];

  Future<void> loadHomeData() async {
    emit(HomeLoading());

    final categoryResult = await getAllCategoriesUseCase();
    final bestSellerResult = await getBestSellerUseCase();
    final occasionResult = await getAllOccasionsUseCase();

    // if (categoryResult is Success &&
    //     bestSellerResult is Success &&
    //     occasionResult is Success) {
    //   categories = categoryResult.data ?? [];
    //   bestSellers = bestSellerResult.data ?? [];
    //   occasions = occasionResult.data ?? [];
    //
    //   emit(HomeSuccess());
    // } else {
    //   emit(HomeError("error"));
    // }

    if (categoryResult is Success<List<CategoryModel>> &&
        bestSellerResult is Success<List<BestSellerModel>> &&
        occasionResult is Success<List<OccasionModel>>) {

      categories = (categoryResult as Success<List<CategoryModel>>).data ?? [];
      bestSellers = (bestSellerResult as Success<List<BestSellerModel>>).data ?? [];
      occasions = (occasionResult as Success<List<OccasionModel>>).data ?? [];

      emit(HomeSuccess());
    } else {
      emit(HomeError("error"));
    }

  }
}
