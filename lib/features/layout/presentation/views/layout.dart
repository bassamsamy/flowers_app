import 'package:flowers_app/core/resources/AppColors.dart';
import 'package:flowers_app/features/layout/presentation/views/profile_Screen.dart';
import 'package:flutter/material.dart';

import 'cart_screen.dart';
import 'categories_screen.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 3;

  final List<Widget> _screens = [
    HomeScreen(),
    CategoriesScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}








