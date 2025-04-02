import 'package:flowers_app/core/di/di.dart';
import 'package:flowers_app/core/exceptions/ErrorMessageHandler.dart';
import 'package:flowers_app/core/resources/AppColors.dart';
import 'package:flowers_app/core/resources/validation.dart';
import 'package:flowers_app/core/widgets/CustomBtn.dart';
import 'package:flowers_app/core/widgets/CustomTxtField.dart';
import 'package:flowers_app/features/auth/presentation/cubits/reset_password_cubit/reset_password_cubit.dart';
import 'package:flowers_app/features/auth/presentation/cubits/reset_password_cubit/reset_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({super.key, required this.arguments});
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final _key = GlobalKey<FormState>();
  final dynamic arguments;
  final resetModel = getIt.get<ResetPasswordViewModel>();
  @override
  Widget build(context) {
    var emails = arguments as String;
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
        create: (context) => resetModel,
        child: BlocConsumer<ResetPasswordViewModel, ResetPasswordState>(
          listener: (context, state) {
            if (state is NaviageRestPasswordState) {
              Navigator.pushReplacementNamed(context, state.route);
            }
            if (state is InvalidResetPasswordState) {
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
          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: state is LoadingResetPasswordState,
              blur: 0.01,
              color: AppColors.grey,
              progressIndicator: const CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: SingleChildScrollView(
                  child: Form(
                    key: _key,
                    child: Column(
                      children: [
                        const Text(
                          'Reset Password',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: AppColors.blackTextColor,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'Password must not be empty and must contain\n6 characters with upper case letter and one\nnumber at least',
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColors.textgrey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomTxtField(
                          LabelName: 'New Password',
                          controller: newPasswordController,
                          onchanged: (val) {},
                          validator: (val) {
                            return Validation.validatePasswordTextField(val);
                          },
                          isSecured: true,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTxtField(
                          LabelName: 'Confirm Password',
                          isSecured: true,
                          controller: confirmPasswordController,
                          onchanged: (val) {},
                          validator: (val) {
                            return Validation.validateConfirmPassword(
                                val, newPasswordController.text);
                          },
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        Custombtn(
                          Name: 'Confirm',
                          onPressed: () {
                            if (_key.currentState!.validate()) {
                              FocusScope.of(context).unfocus();
                              resetModel.doIntent(
                                ResetPasswordInt(
                                    email: emails,
                                    newPassword: newPasswordController.text),
                              );
                            }
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
      ),
    );
  }
}
