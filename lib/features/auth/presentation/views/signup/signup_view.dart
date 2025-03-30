import 'package:flutter/material.dart';
import '../../../../../core/di/di.dart';
import '../../../../../core/resources/AppColors.dart';
import '../../../../../core/resources/app_string.dart';
import '../../../../../core/resources/validation.dart';
import '../../../../../core/routes_manager/routes_names.dart';
import '../../../domain/use_cases/signup_use_case.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '../../../../../core/models/result.dart';
import '../../../../../core/models/user_model.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  static const String routeName = '/signup';
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
  bool _isTermsAccepted = false;
  String? _selectedGender;

  final SignUpUseCase _signUpUseCase = getIt<SignUpUseCase>();

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

  Future<void> _sendDataToServer() async {
    final userData = {
      'userName': _userNameController.text,
      'firstName': _firstNameController.text,
      'lastName': _lastNameController.text,
      'email': _emailController.text,
      'password': _passwordController.text,
      'phoneNumber': _phoneNumberController.text,
      'gender': _selectedGender,
      'termsAccepted': _isTermsAccepted,
      'profileImage': null,
      'role': 'user',
      'wishlist': [],
      'addresses': [],
      '_id': null,
      'createdAt': DateTime.now().toIso8601String(),
    };

    try {
      final result = await _signUpUseCase.call(userData, isVerified: false);
      if (result is Success) {
        UserModel.instance.setFromJson(result.data);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Signup successful!')),
        );
      } else if (result is Error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(result.exception?.toString() ?? 'Error')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $e')),
      );
    }
  }

  void _onSignUp() async {
    if (_formKey.currentState?.validate() ?? false) {
      await _sendDataToServer();
    }
  }

  Widget buildGenderSelection() {
    return Row(
      children: [
        Expanded(
          child: RadioListTile<String>(
            title: const Text('Male'),
            value: 'Male',
            groupValue: _selectedGender,
            onChanged: (value) {
              setState(() {
                _selectedGender = value;
              });
            },
          ),
        ),
        Expanded(
          child: RadioListTile<String>(
            title: const Text('Female'),
            value: 'Female',
            groupValue: _selectedGender,
            onChanged: (value) {
              setState(() {
                _selectedGender = value;
              });
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.signup),
        backgroundColor: AppColors.backgroundColor,
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
                validator: (value) =>
                    Validation.validateEmailTextField(value ?? ''),
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
                  if (value == null || !RegExp(r'^01\d{9}$').hasMatch(value)) {
                    return AppStrings.enterYourPhoneNumber;
                  }
                  return null;
                },
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildGenderSelection(),
                  if (_selectedGender == null)
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Please select your gender',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                        ),
                      ),
                    ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: _isTermsAccepted,
                        onChanged: (value) {
                          setState(() {
                            _isTermsAccepted = value ?? false;
                          });
                        },
                      ),
                      const Text(
                        'Creating an account, you agree to our ',
                        style: TextStyle(color: AppColors.blackTextColor),
                      ),
                      GestureDetector(
                        onTap: () {
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RoutesNames.termsAndConditions);
                            },
                          );
                        },
                        child: const Text(
                          'Terms & Conditions',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  CustomElevatedButton(
                    label: AppStrings.signup,
                    onTap: _onSignUp,
                    backgroundColor: AppColors.primaryColor,
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
            ],
          ),
        ),
      ),
    );
  }
}
