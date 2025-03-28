import 'package:flowers_app/core/resources/AppColors.dart';
import 'package:flowers_app/core/routes_manager/routes_names.dart';
import 'package:flowers_app/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:flowers_app/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../core/widgets/CustomBtn.dart';
import '../../../../core/widgets/CustomTxtField.dart';
import '../cubits/login_cubit/login_cubit.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.pushNamed(context, RoutesNames.layout);
        }
        if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.exception.toString()),
            backgroundColor: Colors.red,
          ));
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
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    CustomTextField(
                      controller: _emailController,
                      hintText: "Enter Your email",
                      labelText: "Email",
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    CustomTextField(
                      controller: _passwordController,
                      hintText: "Enter Your password",
                      labelText: "Password",
                    ),
                    CustomButton(text: "Login", onPressed: () {},color: AppColors.primaryColor,)

                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
