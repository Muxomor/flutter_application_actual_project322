// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_application_actual_project322/database/firebase_auth/service.dart';
import 'package:flutter_application_actual_project322/pages/bottom_pages/menu.dart';
import 'package:flutter_application_actual_project322/pages/bottom_pages/order.dart';
import 'package:flutter_application_actual_project322/pages/bottom_pages/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthService authService = AuthService();
  String title = "menu";
  int index = 0;
  final pages = [const menuPage(), const orderPage(), const profilePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(index),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                await authService.logOut();
                Navigator.popAndPushNamed(context, "/");
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ))
        ],
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'menu'),
          BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long), label: 'Order'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
        ],
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
            if (index == 0) {
              title = 'Меню';
            } else if (index == 1) {
              title = 'Заказать';
            } else {
              title = 'Профиль';
            }
          });
        },
      ),
    );
  }
}
