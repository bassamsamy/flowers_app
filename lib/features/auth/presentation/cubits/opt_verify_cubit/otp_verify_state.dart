sealed class OtpVerifyState {}

class ValidOtpVerifyState extends OtpVerifyState {}

class NavigatOtpState extends OtpVerifyState {
  String route;
  NavigatOtpState({required this.route});
}

class InvalidOtpVerifyState extends OtpVerifyState {
Exception? exception;
InvalidOtpVerifyState({this.exception});
}

class LoadOtpState extends OtpVerifyState {}
