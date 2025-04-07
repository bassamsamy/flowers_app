part of 'signup_cubit.dart';

abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {}

class SignUpFailure extends SignUpState {
  final String error;

  SignUpFailure(this.error);
}
class SignUpGenderChanged extends SignUpState {
  final String gender;

  SignUpGenderChanged(this.gender);
}
class SignUpTermsAgreed extends SignUpState {
  final bool isAgreed;

  SignUpTermsAgreed(this.isAgreed);
}