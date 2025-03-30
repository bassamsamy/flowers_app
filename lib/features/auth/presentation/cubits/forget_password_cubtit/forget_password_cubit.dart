import 'package:flowers_app/core/models/result.dart';
import 'package:flowers_app/core/routes_manager/routes_names.dart';
import 'package:flowers_app/features/auth/domain/useCases/forget_password_use_case.dart';
import 'package:flowers_app/features/auth/presentation/cubits/forget_password_cubtit/forget_password_intent.dart';
import 'package:flowers_app/features/auth/presentation/cubits/forget_password_cubtit/forget_password_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class ForgetPasswordViewModel extends Cubit<ForgetPasswordState> {
  ForgetPasswordUseCase forgetPasswordUseCase;
  ForgetPasswordViewModel({required this.forgetPasswordUseCase})
      : super(ValidForgetPasswordState());
  void doIntent(ForgetPasswordIntent intent) {
    switch (intent) {
      case SendOtp():
        {
          _forgetPassword(intent.email);
        }
    }
  }

  void _forgetPassword(String email) async {
    emit(LoadForgetPasswordState());
    var data = await forgetPasswordUseCase.forgetPassword(email);
    switch (data) {
      case Success():
        {
          emit(NavigatForgetPasswordState(route: RoutesNames.opt),);
          
        }
      case Error():
        {
          emit(
            InvalidForgetPasswordState(
              errorex:data.exception,
            ),
          );
        }
    }
  }
}
