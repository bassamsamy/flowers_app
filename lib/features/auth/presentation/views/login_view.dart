import 'package:flowers_app/core/resources/AppColors.dart';
import 'package:flowers_app/core/resources/validation.dart';
import 'package:flowers_app/core/routes_manager/routes_names.dart';
import 'package:flowers_app/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:flowers_app/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../cubits/login_cubit/login_cubit.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var cubit = LoginCubit.get(context);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.pushNamed(context, RoutesNames.layout);
        }
        if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is LoginLoading,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Login'),
              leading: const Icon(
                Icons.arrow_back_ios,
                color: AppColors.blackTextColor,
                size: 25,
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.045),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: screenHeight * 0.03),
                      CustomTextField(
                        controller: _emailController,
                        hintText: "Enter Your email",
                        labelText: "Email",
                        validator: Validation.validateEmailTextField,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      CustomTextField(
                        controller: _passwordController,
                        hintText: "Enter Your password",
                        labelText: "Password",
                        validator: Validation.validatePasswordTextField,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Row(
                        children: [
                          StatefulBuilder(
                            builder: (context, setState) {
                              return Checkbox(
                                value: isChecked,
                                onChanged: (value) {
                                  setState(() {
                                    isChecked = value!;
                                  });
                                  cubit.checkBoxPressed();
                                },
                                activeColor: AppColors.primaryColor,
                                checkColor: Colors.white,
                              );
                            },
                          ),
                          const Text(
                            "Remember me",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.blackTextColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(
                                fontSize: 12,
                                decoration: TextDecoration.underline,
                                color: AppColors.blackTextColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.05),
                      CustomButton(
                        text: "Login",
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            cubit.login(
                              _emailController.text,
                              _passwordController.text,
                            );
                          }
                        },
                        backgroundColor: AppColors.primaryColor,
                        borderColor: AppColors.primaryColor,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      CustomButton(
                        text: "Continue as guest",
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            RoutesNames.layout,
                            (route) => false,
                          );
                        },
                        backgroundColor: AppColors.backgroundColor,
                        textColor: const Color(0xFF535353),
                        borderColor: const Color(0xFF535353),
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: theme.textTheme.bodyMedium
                                ?.copyWith(color: AppColors.blackTextColor),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                RoutesNames.signUp,
                              );
                            },
                            child: Text(
                              "Sign up",
                              style: theme.textTheme.bodyMedium?.copyWith(
                                  color: AppColors.primaryColor,
                                  decoration: TextDecoration.underline,
                                  decorationStyle: TextDecorationStyle.solid,
                                  decorationColor: AppColors.primaryColor),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
