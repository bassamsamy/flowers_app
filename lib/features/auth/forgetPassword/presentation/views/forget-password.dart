import 'package:flowers_app/core/widgets/CustomBtn.dart';
import 'package:flowers_app/core/widgets/CustomTxtField.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});

  GlobalKey<FormState> _key = GlobalKey();
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text(
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
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
               Center(
                child: Text(
                  textAlign: TextAlign.center,
                  'Please enter your email associated\n to your account',
                  style: TextStyle(

                    fontSize: 14,
                    fontFamily: Theme.of(context).appBarTheme.titleTextStyle!.fontFamily
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              CustomTxtField(
                LabelName: 'Email',
                controller: emailController,
                onchanged: (val) {
                  emailController.text = val;
                },
                validator: (val) {
                  if (val == null ||
                      !val.contains('@') ||
                      val.trim().isEmpty ||
                      val.contains(' ')) {
                    return "Invalid Email";
                  }
                },
              ),
             const SizedBox(
                height: 50,
              ),
              Custombtn(
                Name: 'Continue',
                onPressed: () {
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
