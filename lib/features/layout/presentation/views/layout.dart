import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
     body: 
      Center(child: Text("layout",style: TextStyle(fontSize: 50),),),
    );
  }
}
