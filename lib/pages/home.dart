import 'package:flutter/material.dart';
import 'package:flutter_application_actual_project322/pages/bottom_pages/menu.dart';
import 'package:flutter_application_actual_project322/pages/bottom_pages/order.dart';
import 'package:flutter_application_actual_project322/pages/bottom_pages/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String title = "menu";
  int index = 0;
  final pages = [const menuPage(), const orderPage(), const profilePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(index),
      appBar: AppBar(
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
              title = 'История заказов';
            } else {
              title = 'Профиль';
            }
          });
        },
      ),
    );
  }
}

class menuPage extends StatelessWidget {
  const menuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
      ListView(
        children: [
          Card(
            child:ListTile(
              title: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Блюдо'),
                ],
              ),
              subtitle: const Column(
                children: [
                  Text('Описание'),
                  Text('gramm'),
                ],
              ),
              leading: Image.asset('images/placeholder.png'),
            ) ,
          )
        ],

      ),
    );
  }
}

class orderPage extends StatelessWidget {
  const orderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}

class profilePage extends StatelessWidget {
  const profilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}