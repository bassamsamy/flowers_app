import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/models/result.dart';
import '../../../data/repo/auto_login_repo.dart';

part 'auto_login_state.dart';

class AutoLoginCubit extends Cubit<AutoLoginState> {
  AutoLoginCubit(this._autoLoginRepo) : super(AutoLoginInitial());
  final AutoLoginRepo _autoLoginRepo;

  Future<void> autoLogin() async {
    emit(AutoLoginLoading());
    final result = await _autoLoginRepo.autoLogin();
    if (result is Success) {
      emit(AutoLoginSuccess());
    } else if (result is Error) {
      emit(AutoLoginFailure(result.exception.toString()));
    }
  }
}
