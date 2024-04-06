// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_application_actual_project322/database/firebase_auth/service.dart';
import 'package:flutter_application_actual_project322/pages/bottom_pages/menu.dart';
import 'package:flutter_application_actual_project322/pages/bottom_pages/order.dart';
import 'package:flutter_application_actual_project322/pages/bottom_pages/profile.dart';

TextEditingController searchController = TextEditingController();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthService authService = AuthService();
  String title = "menu";
  int index = 0;
  final pages = [const MenuPage(), const OrderPage(), const ProfilePage()];

  bool search = false;

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      actions: [
        IconButton(
            onPressed: () async {
              setState(() {
                search = true;
              });
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            )),
        IconButton(
          onPressed: () async {
            await authService.logOut();
            Navigator.popAndPushNamed(context, "/");
          },
          icon: const Icon(
            Icons.logout,
            color: Colors.white,
          ),
        ),
      ],
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
    );
    AppBar searchBar = AppBar(
      leading: const Icon(
        Icons.search,
        color: (Colors.white),
      ),
      title: TextField(
        controller: searchController,
        onChanged: (value) => {
          setState(() {
            value = searchController.text;
          })
        },
      ),
      actions: [
        IconButton(onPressed: (){
          
        }, icon: const Icon(Icons.refresh)),
        IconButton(
            onPressed: () {
              setState(() {
                search = false;
                searchController.clear();
              });
            },
            icon: const Icon(Icons.cancel))
      ],
    );

    return Scaffold(
      body: pages.elementAt(index),
      appBar: search ? searchBar : appBar,
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

