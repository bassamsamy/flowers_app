import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/models/result.dart';
import '../../../domain/useCases/signup.dart';

part 'signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpUseCase _signUpUseCase;
  String? gender;

  SignUpCubit(this._signUpUseCase) : super(SignUpInitial());

  static SignUpCubit get(context) => BlocProvider.of(context);

  Future<void> signUp(
      String firstName,
      String userName,
      String rePassword,
      String lastName,
      String email,
      String password,
      String phone,
      String gender,
      ) async {
    emit(SignUpLoading());
    final result = await _signUpUseCase(
      firstName,
      lastName,
      email,
      password,
      rePassword,
      phone,
      userName,
      gender,
    );
    switch (result) {
      case Success():
        emit(SignUpSuccess());
      case Error():
        emit(SignUpFailure(result.exception.toString()));
    }
  }

  void toggleTermsAgreement(bool isAgreed) {
    emit(SignUpTermsAgreed(isAgreed));
  }

  void setGender(String selectedGender) {
    gender = selectedGender;
    emit(SignUpGenderChanged(gender!));
  }
}
