abstract class OtpVerifyIntent {}

class VerifyCode extends OtpVerifyIntent {
  String code;
  VerifyCode({required this.code});
}
