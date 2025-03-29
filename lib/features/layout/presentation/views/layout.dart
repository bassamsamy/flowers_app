import 'package:flowers_app/core/models/user_model.dart';
import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    print(UserModel.instance.token);
    return Scaffold(
      body: Center(
        child: Text(
          UserModel.instance.firstName ?? "null",
          style: TextStyle(fontSize: 50, color: Colors.black),
        ),
      ),
    );
  }
}
