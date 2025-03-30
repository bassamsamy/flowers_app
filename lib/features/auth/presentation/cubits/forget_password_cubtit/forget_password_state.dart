abstract class ForgetPasswordState {}

class ValidForgetPasswordState extends ForgetPasswordState {}

class NavigatForgetPasswordState extends ForgetPasswordState {
  String route;
  NavigatForgetPasswordState({required this.route});
}

class InvalidForgetPasswordState extends ForgetPasswordState {
  Exception ? errorex;
  InvalidForgetPasswordState({this.errorex});
}

class LoadForgetPasswordState extends ForgetPasswordState {}
