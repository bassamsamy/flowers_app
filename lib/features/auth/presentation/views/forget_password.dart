import 'package:flowers_app/core/di/di.dart';
import 'package:flowers_app/core/exceptions/ErrorMessageHandler.dart';
import 'package:flowers_app/core/exceptions/exceptions_impl.dart';
import 'package:flowers_app/core/resources/AppColors.dart';
import 'package:flowers_app/core/widgets/CustomBtn.dart';
import 'package:flowers_app/core/widgets/CustomTxtField.dart';
import 'package:flowers_app/features/auth/presentation/cubits/forget_password_cubtit/forget_password_cubit.dart';
import 'package:flowers_app/features/auth/presentation/cubits/forget_password_cubtit/forget_password_intent.dart';
import 'package:flowers_app/features/auth/presentation/cubits/forget_password_cubtit/forget_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});

  final GlobalKey<FormState> _key = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final forgetPasswordViewModel = getIt<ForgetPasswordViewModel>();

  bool isErrorOccur = false;
  String? error;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => forgetPasswordViewModel,
      child: BlocConsumer<ForgetPasswordViewModel, ForgetPasswordState>(
        listener: (context, state) {
          if (state is InvalidForgetPasswordState) {
            isErrorOccur = true;
            if(state.errorex is! NetworkError ){

            error = handleErrorMessage(state.errorex, context);
            }else{
                ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(
                    handleErrorMessage(state.errorex, context),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            }
            _key.currentState!.validate();
          } else if (state is LoadForgetPasswordState) {
          } else if (state is NavigatForgetPasswordState) {
            Navigator.pushNamed(context, state.route,
                arguments: emailController.text);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is LoadForgetPasswordState,
            blur: 0.01,
            color: AppColors.grey,
            progressIndicator: const CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
            child: Scaffold(
              appBar: AppBar(
                title: const Text(
                  'Password',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Form(
                  key: _key,
                  child: Column(
                    children: [
                      const Center(
                        child: Text(
                          'Forget Password',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColors.blackTextColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          'Please enter your email associated\n to your account',
                          style: TextStyle(
                              color: AppColors.textgrey,
                              fontSize: 14,
                              fontFamily: Theme.of(context)
                                  .appBarTheme
                                  .titleTextStyle!
                                  .fontFamily),
                        ),
                      ),
                      const SizedBox(height: 40),
                      CustomTxtField(
                        LabelName: 'Email',
                        controller: emailController,
                        onchanged: (val) {
                          emailController.text = val;
                        },
                        validator: (val) {
                          if (isErrorOccur) {
                            isErrorOccur = false;
                            return error;
                          } else if (val == null ||
                              !val.contains('@') ||
                              val.trim().isEmpty ||
                              val.contains(' ')) {
                            return "This Email is not valid";
                          }
                        },
                      ),
                      const SizedBox(height: 50),
                      BlocBuilder<ForgetPasswordViewModel, ForgetPasswordState>(
                        builder: (context, state) {
                          return Custombtn(
                            Name: 'Continue',
                            onPressed: () {
                              if (_key.currentState!.validate()) {
                                FocusScope.of(context).unfocus();
                                forgetPasswordViewModel.doIntent(
                                  SendOtp(email: emailController.text),
                                );
                              }
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
