abstract class ForgetPasswordIntent {}

class SendOtp extends ForgetPasswordIntent {
  String email;
  SendOtp({required this.email});
}
