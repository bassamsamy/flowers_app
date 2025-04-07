import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../core/resources/AppColors.dart';
import '../../../../core/resources/validation.dart';
import '../../../../core/routes_manager/routes_names.dart';
import '../cubits/signup_cubit/signup_cubit.dart';
import 'widgets/custom_button.dart';
import 'widgets/custom_text_field.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var cubit = SignUpCubit.get(context);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          Navigator.pushNamed(context, RoutesNames.layout);
        }
        if (state is SignUpFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignUpLoading,
          color: AppColors.primaryColor,
          progressIndicator: const CircularProgressIndicator(
            color: AppColors.primaryColor,
          ),
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Sign Up'),
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
                        controller: _userNameController,
                        hintText: "Enter your username",
                        labelText: "Username",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your username";
                          }
                          if (value.length < 3) {
                            return "Username must be at least 3 characters long";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      CustomTextField(
                        controller: _firstNameController,
                        hintText: "Enter your first name",
                        labelText: "First Name",
                        validator: Validation.validateNameTextField,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      CustomTextField(
                        controller: _lastNameController,
                        hintText: "Enter your last name",
                        labelText: "Last Name",
                        validator: Validation.validateNameTextField,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      CustomTextField(
                        controller: _emailController,
                        hintText: "Enter your email",
                        labelText: "Email",
                        validator: Validation.validateEmailTextField,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      CustomTextField(
                        controller: _passwordController,
                        hintText: "Enter your password",
                        labelText: "Password",
                        validator: Validation.validatePasswordTextField,
                        obscureText: true,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      CustomTextField(
                        controller: _rePasswordController,
                        hintText: "Re-enter your password",
                        labelText: "Confirm Password",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please confirm your password";
                          }
                          if (value != _passwordController.text) {
                            return "Passwords do not match";
                          }
                          return null;
                        },
                        obscureText: true,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      CustomTextField(
                        controller: _phoneController,
                        hintText: "Enter your phone number",
                        labelText: "Phone",
                        validator: Validation.validatePhoneTextField,
                      ),
                      SizedBox(height: screenHeight * 0.05),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Gender: ",
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.blackTextColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Row(
                            children: [
                              Radio<String>(
                                value: "Male",
                                groupValue: cubit.gender,
                                onChanged: (value) {
                                  cubit.setGender(value!);
                                },
                              ),
                              const Text(
                                "Male",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.blackTextColor,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Radio<String>(
                                value: "Female",
                                groupValue: cubit.gender,
                                onChanged: (value) {
                                  cubit.setGender(value!);
                                },
                              ),
                              const Text(
                                "Female",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.blackTextColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.05),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "By signing up, you agree to our ",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.blackTextColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, RoutesNames.terms);
                            },
                            child: Text(
                              "Terms of Service",
                              style: theme.textTheme.bodyMedium?.copyWith(
                                  color: AppColors.primaryColor,
                                  decoration: TextDecoration.underline,
                                  decorationStyle: TextDecorationStyle.solid,
                                  decorationColor: AppColors.primaryColor),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.05),
                      CustomButton(
                        text: "Sign Up",
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            cubit.signUp(
                              _userNameController.text,
                              _firstNameController.text,
                              _lastNameController.text,
                              _emailController.text,
                              _passwordController.text,
                              _rePasswordController.text,
                              _phoneController.text,
                              cubit.gender!,
                              
                            );
                          }
                        },
                        backgroundColor: AppColors.primaryColor,
                        borderColor: AppColors.primaryColor,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account? ",
                            style: theme.textTheme.bodyMedium
                                ?.copyWith(color: AppColors.blackTextColor),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, RoutesNames.login);
                            },
                            child: Text(
                              "Log in",
                              style: theme.textTheme.bodyMedium?.copyWith(
                                  color: AppColors.primaryColor,
                                  decoration: TextDecoration.underline,
                                  decorationStyle: TextDecorationStyle.solid,
                                  decorationColor: AppColors.primaryColor),
                            ),
                          ),
                        ],
                      ),
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
