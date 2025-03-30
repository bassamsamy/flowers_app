sealed class ResetPasswordState {}

class ValidRestPasswordState extends ResetPasswordState {}

class NaviageRestPasswordState extends ResetPasswordState {
  String route;
  NaviageRestPasswordState({required this.route});
}

class InvalidResetPasswordState extends ResetPasswordState {
  Exception ? exception;
  InvalidResetPasswordState({required this.exception});
}
class LoadingResetPasswordState extends ResetPasswordState {}
