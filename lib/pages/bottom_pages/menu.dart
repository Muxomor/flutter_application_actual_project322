import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_actual_project322/pages/home.dart';

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

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  Widget cardFood(BuildContext context, dynamic docs) {
    return SizedBox(
      height: 100,
      child: ListView(children: [ 
        Card(
          child: ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(docs['name']),
              ],
            ),
            subtitle: Column(
              children: [
                Text(docs['composition'].toString()),
                Text(docs['weight'].toString() + ' грамм.'),
                Text(docs['price'].toString() + ' rub.')
              ],
            ),
            leading: Image.network(docs['image']),
            trailing: ElevatedButton(
                onPressed: () {}, child: const Icon(Icons.add_shopping_cart)),
          ),
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('foods').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            var food = snapshot.data!.docs
                .where((element) => element['name']
                        .toLowerCase()
                        .contains(searchController.text.toLowerCase())
                    ? true
                    : false)
                .toList();
            return SizedBox(
              height: 400,
              child: ListView.builder(
                itemCount: food.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: ((context, index) {
                  return cardFood(context, food[index]);
                }),
              ),
            );
          }
        },
      ),
    );
  }
}
