import 'package:flutter/material.dart';
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Column(
        children: [
          SizedBox(height: 20),
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage("https://via.placeholder.com/150"),
          ),
          SizedBox(height: 10),
          Text("Nour Mohamed", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          Text("Nour_Mohamed@gmail.com", style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}