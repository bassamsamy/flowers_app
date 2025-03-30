import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../../../../core/resources/AppColors.dart';
import '../../../../../core/resources/app_string.dart';
import '../../../../../core/routes_manager/routes_names.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

final getIt = GetIt.instance;

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  @override
  void dispose() {
    _userNameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  void _onSignUp() {
    if (_formKey.currentState?.validate() ?? false) {
      // Perform signup logic here
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Signup successful!')),
      );
      Navigator.pushNamed(context, RoutesNames.layout);
    }
  }

  Future<bool> isUserNameUnique(String value) async {
    await Future.delayed(const Duration(seconds: 1));
    return value != "existingUser";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.signup),
          backgroundColor: AppColors.successColor,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  label: AppStrings.userName,
                  controller: _userNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.enterYourUserName;
                    }
                    if (value.length < 3 || value.length > 15) {
                      return AppStrings.enterYourUserName;
                    }
                    if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value)) {
                      return AppStrings.enterYourUserName;
                    }
                    return null;
                  },
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        label: AppStrings.firstName,
                        controller: _firstNameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return AppStrings.enterYourFirstName;
                          }
                          if (value.length < 3 || value.length > 12) {
                            return AppStrings.enterYourFirstName;
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: CustomTextFormField(
                        label: AppStrings.lastName,
                        controller: _lastNameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return AppStrings.enterYourLastName;
                          }
                          if (value.length < 3 || value.length > 12) {
                            return AppStrings.enterYourLastName;
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                CustomTextFormField(
                  label: AppStrings.email,
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.enterYourEmail;
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return AppStrings.emailError;
                    }
                    return null;
                  },
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        label: AppStrings.password,
                        isPassword: true,
                        controller: _passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return AppStrings.enterYourPassword;
                          }
                          if (!RegExp(
                                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$')
                              .hasMatch(value)) {
                            return AppStrings.passwordError;
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: CustomTextFormField(
                        label: AppStrings.pleaseConfirmPassword,
                        isPassword: true,
                        controller: _confirmPasswordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return AppStrings.enterYourPassword;
                          }
                          if (value != _passwordController.text) {
                            return AppStrings.rePasswordError;
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                CustomTextFormField(
                  label: AppStrings.phoneNumber,
                  keyboardType: TextInputType.phone,
                  controller: _phoneNumberController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.enterYourPhoneNumber;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomElevatedButton(
                  label: AppStrings.signup,
                  onTap: _onSignUp,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      AppStrings.alreadyHaveAccount,
                      style: TextStyle(color: AppColors.blackTextColor),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RoutesNames.login);
                      },
                      child: const Text(
                        AppStrings.login,
                        style: TextStyle(
                          color: AppColors.blackTextColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
