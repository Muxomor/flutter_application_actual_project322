import 'package:flutter/material.dart';

//class menuPage extends StatelessWidget {
//  const menuPage({super.key});
//
//  @override
//  Widget build(BuildContext context) {
//    return const Scaffold(
//      body: Text('menu'),
//    );
//  }
//}
//

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