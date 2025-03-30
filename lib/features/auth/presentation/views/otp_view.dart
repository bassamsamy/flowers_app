import 'package:flowers_app/core/di/di.dart';
import 'package:flowers_app/core/exceptions/ErrorMessageHandler.dart';
import 'package:flowers_app/core/exceptions/exceptions_impl.dart';
import 'package:flowers_app/core/resources/AppColors.dart';
import 'package:flowers_app/features/auth/presentation/cubits/forget_password_cubtit/forget_password_cubit.dart';
import 'package:flowers_app/features/auth/presentation/cubits/forget_password_cubtit/forget_password_intent.dart';
import 'package:flowers_app/features/auth/presentation/cubits/opt_verify_cubit/otp_verify_cubit.dart';
import 'package:flowers_app/features/auth/presentation/cubits/opt_verify_cubit/otp_verify_intent.dart';
import 'package:flowers_app/features/auth/presentation/cubits/opt_verify_cubit/otp_verify_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  OtpScreen({super.key, required this.arguments});
  final dynamic arguments;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  OtpVerifyViewModel verifyModel = getIt.get<OtpVerifyViewModel>();

  ForgetPasswordViewModel forgetModel = getIt.get<ForgetPasswordViewModel>();

  bool isResend = false;
  bool isSucess = true;
  final TextEditingController _otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var receivedData = widget.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Password'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
          color: AppColors.blackTextColor,
        ),
      ),
      body: BlocProvider(
        create: (context) => verifyModel,
        child: BlocConsumer<OtpVerifyViewModel, OtpVerifyState>(
          listener: (context, state) {
            if (state is NavigatOtpState) {
              Navigator.pushReplacementNamed(context, state.route,
                  arguments: receivedData);
            }
            if (state is InvalidOtpVerifyState) {
              if (state.exception is NetworkError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.red,
                    content: Text(
                      handleErrorMessage(state.exception, context),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }
            }
          },
          buildWhen: (pervious, current) {
            if (current is InvalidOtpVerifyState || current is LoadOtpState) {
              return true;
            }
            return false;
          },
          builder: (context, state) {
            bool IsInvalid = state is InvalidOtpVerifyState&&state.exception is! NetworkError;
            return ModalProgressHUD(
              inAsyncCall: state is LoadOtpState,
              blur: 0.01,
              color: AppColors.grey,
              progressIndicator: const CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
              child: Column(
                children: [
                  const Text(
                    'Email verification',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blackTextColor,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Please enter your code that send to your\n email address ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textgrey,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Pinput(
                    length: 6,
                    defaultPinTheme: PinTheme(
                      height: 53,
                      width: 53,
                      decoration: BoxDecoration(
                        color: AppColors.white60,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onCompleted: (String verificationCode) {
                      print('donnsnsns');
                      verifyModel.doIntent(
                        VerifyCode(code: verificationCode),
                      );
                    },
                    errorPinTheme: PinTheme(
                      height: 53,
                      width: 53,
                      decoration: BoxDecoration(
                        color: AppColors.backgroundColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.red,
                        ),
                      ),
                    ),
                    errorText: 'Invalid code',
                    forceErrorState: IsInvalid,
                    controller: _otpController,
                    autofocus: true,
                    closeKeyboardWhenCompleted: false,
                    errorBuilder: (errorText, pin) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 5, left: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Icon(
                              Icons.error_outline,
                              color: Colors.red,
                            ),
                            Text(
                              '$errorText',
                              style: const TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  /*
                  OtpTextField(
                    fieldHeight: 53,
                    fieldWidth: 53,
                    clearText: IsInvalid,
                    numberOfFields: 6,
                    enabledBorderColor: IsInvalid ? Colors.red : Colors.blue,
                    borderColor: Colors.blue,
                    showFieldAsBox: true,
                    onCodeChanged: (String code) {},
                    onSubmit: (String verificationCode) {
                      verifyModel.doIntent(
                        VerifyCode(code: verificationCode),
                      );
                    }, // end onSubmit
                  ),*/
                  /*
                  if (IsInvalid)
                    const Padding(
                      padding: const EdgeInsets.only(right: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.error_outline,
                            color: Colors.red,
                          ),
                          Text(
                            'Invalid Code',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),*/
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Didn't receive code? ",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: AppColors.blackTextColor,
                        ),
                      ),
                      isResend
                          ? SizedBox(
                              height: 30,
                              child: TimerCountdown(
                                enableDescriptions: false,
                                timeTextStyle: const TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                                format: CountDownTimerFormat.secondsOnly,
                                endTime: DateTime.now().add(
                                  const Duration(
                                    seconds: 31,
                                  ),
                                ),
                                onEnd: () {
                                  setState(() {
                                    print('ended');
                                    isResend = false;
                                  });
                                },
                              ),
                            )
                          : SizedBox(
                              height: 32,
                              width: 60,
                              child: TextButton(
                                style: const ButtonStyle(
                                  padding:
                                      WidgetStatePropertyAll(EdgeInsets.all(0)),
                                ),
                                onPressed: () {
                                  setState(() {
                                    isResend = true;
                                    forgetModel.doIntent(
                                      SendOtp(email: receivedData),
                                    );
                                  });
                                },
                                child: const Text(
                                  'Resend',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      decorationColor: AppColors.primaryColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.primaryColor),
                                ),
                              ),
                            ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
