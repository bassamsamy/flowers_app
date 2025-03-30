import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/models/error_model.dart';
import '../../../../../core/models/result.dart';
import '../../../domain/useCases/login_use_case.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;

  LoginCubit(this._loginUseCase) : super(LoginInitial());
static LoginCubit get(context) => BlocProvider.of(context);
  Future<void> login(String email, String password,bool rememberMe) async {
    emit(LoginLoading());
    final result = await _loginUseCase(email, password, rememberMe);
    switch (result) {
      case Success():
        emit(LoginSuccess());
      case Error():
        emit(LoginFailure(result.exception.toString()));
    }
  }
  void checkBoxPressed() {
    emit(LoginCheckBoxPressed());
  }
}
