import 'package:cloud_firestore/cloud_firestore.dart';
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

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _menuPageState();
}

class _menuPageState extends State<MenuPage> {
  Widget cardFood(BuildContext context, dynamic docs) {
    return ListView(children: [
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
          Text(docs['weight'].toString() ),
          Text(docs['price'].toString())
        ],
      ),
      leading: Image.network(docs['image']),
      trailing: ElevatedButton(
          onPressed: () {}, child: const Icon(Icons.add_shopping_cart)),
    ),
          )
        ]);
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
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: ((context, index) {
                return cardFood(context, snapshot.data!.docs[index]);
              }),
            );
          }
        },
      ),
    );
  }
}
