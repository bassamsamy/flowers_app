import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/models/result.dart';
import '../../../domain/use_cases/login_use_case.dart';

  final LoginUseCase _signupUseCase;

  static SignupCubit get(context) => BlocProvider.of(context);

  Future<void> signup(String email, String password) async {
    final result = await _signupUseCase(email, password);
    switch (result) {
      case Success():
      case Error():
    }
  }

  void checkBoxPressed() {
  }
}
