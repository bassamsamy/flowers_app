import 'package:flowers_app/core/models/result.dart';
import 'package:flowers_app/features/home/domain/useCases/get_occasion_products_use_case.dart';
import 'package:flowers_app/features/home/presentation/cubits/occasion_cubit/occasions_intent.dart';
import 'package:flowers_app/features/home/presentation/cubits/occasion_cubit/occasions_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class OccasionViewModel extends Cubit<OccasionProductsState> {
  OccasionViewModel({required this.getOccasionProductsUseCase})
      : super(LoadingOccasionProductsState());
  GetOccasionProductsUseCase getOccasionProductsUseCase;
  void doIntent(OccasionProductsIntent intent) {
    switch (intent) {
      case LoadOccasionProductsIntent():
        {
          _loadOccasionProducts(intent.id);
        }
    }
  }

  void _loadOccasionProducts(Map<String,dynamic>id) async {
    emit(LoadingOccasionProductsState());
    var response = await getOccasionProductsUseCase.getProducts(id);
    switch (response) {
      case Success():
        {
          emit(
            SuccessOccasionProductsState(products: response.data),
          );
        }
      case Error():
        {
          emit(FailOccasionProductsState(error: response.exception));
        }
    }
  }
}

