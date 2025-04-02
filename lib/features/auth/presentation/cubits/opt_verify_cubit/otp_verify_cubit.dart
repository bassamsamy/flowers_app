import 'package:flowers_app/core/models/result.dart';
import 'package:flowers_app/core/routes_manager/routes_names.dart';
import 'package:flowers_app/features/auth/domain/useCases/verify_otp_use_case.dart';
import 'package:flowers_app/features/auth/presentation/cubits/opt_verify_cubit/otp_verify_intent.dart';
import 'package:flowers_app/features/auth/presentation/cubits/opt_verify_cubit/otp_verify_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class OtpVerifyViewModel extends Cubit<OtpVerifyState> {
  VerifyOtpUseCase verifyOtpUseCase;
  OtpVerifyViewModel({required this.verifyOtpUseCase})
      : super(ValidOtpVerifyState());
  void doIntent(OtpVerifyIntent intent) {
    switch (intent) {
      case VerifyCode():
        {
          _verifyCode(intent.code);
        }
    }
  }

  void _verifyCode(String code) async {
    emit(LoadOtpState());
    var data = await verifyOtpUseCase.verifyCode(code);
    switch (data) {
      case Success():
        {
          emit(
            NavigatOtpState(route: RoutesNames.resetPassword),
          );
        }
      case Error():
        {
          emit(
            InvalidOtpVerifyState(
              exception: data.exception,
            ),
          );
        }
    }
  }
}
