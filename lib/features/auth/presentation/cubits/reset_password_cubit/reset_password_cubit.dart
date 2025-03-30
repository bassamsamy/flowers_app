import 'package:flowers_app/core/models/result.dart';
import 'package:flowers_app/core/routes_manager/routes_names.dart';
import 'package:flowers_app/features/auth/domain/useCases/reset_password_use_case.dart';
import 'package:flowers_app/features/auth/presentation/cubits/reset_password_cubit/reset_password_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class ResetPasswordViewModel extends Cubit<ResetPasswordState> {
  ResetPasswordViewModel({required this.resetPasswordUseCase})
      : super(ValidRestPasswordState());
  ResetPasswordUseCase resetPasswordUseCase;
  void doIntent(ResetPasswordIntent intent) {
    switch (intent) {
      case ResetPasswordInt():
        {
          _resetPassword(intent.email, intent.newPassword);
        }
    }
  }

  void _resetPassword(String email, String newPassword) async {
    emit(LoadingResetPasswordState());
    var data = await resetPasswordUseCase.resetPassword(email, newPassword);
    switch (data) {
      case Success():
        {
          emit(
            NaviageRestPasswordState(route:RoutesNames.layout),
          );
        }
      case Error():
        {
          emit(InvalidResetPasswordState(exception: data.exception));
        }
    }
  }
}

sealed class ResetPasswordIntent {}

class ResetPasswordInt extends ResetPasswordIntent {
  String email;
  String newPassword;
  ResetPasswordInt({required this.email, required this.newPassword});
}
