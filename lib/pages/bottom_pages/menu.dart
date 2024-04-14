import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_actual_project322/database/ClientOrdersCollection.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

TextEditingController searchController = TextEditingController();
final OrdersCollection orders = OrdersCollection();
final uid = FirebaseAuth.instance.currentUser!.uid;

class _MenuPageState extends State<MenuPage> {
  Widget cardFood(BuildContext context, dynamic docs) {
    return Card(
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
            Text('${docs['weight']} грамм.'),
            Text('${docs['price']} rub.')
          ],
        ),
        leading: Image.network(docs['image']),
        trailing: ElevatedButton(
            onPressed: () async {
              await FirebaseFirestore.instance
                  .collection('orders')
                  .get()
                  .then((value) async {
                await orders.addOrdersCollection(docs);
              });
              //await orders.addOrdersCollection(docs);
              showDialog(
                context: context,
                builder: (context) => const AlertDialog(
                  title: Text('Добавлен'),
                  content: Text('Заказ добавлен'),
                ),
              );
            },
            child: const Icon(Icons.add_shopping_cart)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.search,
          color: Colors.white,
        ),
        title: TextField(
          controller: searchController,
          style: const TextStyle(color: Colors.white),
          onChanged: (value) {
            setState(() {
              value = searchController.text;
            });
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                searchController.clear();
              });
            },
            icon: const Icon(
              Icons.cancel,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('foods').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            var food = snapshot.data!.docs
                .where((food) => food['name']
                        .toLowerCase()
                        .contains(searchController.text.toLowerCase())
                    ? true
                    : false)
                .toList();
            return ListView.builder(
              itemCount: food.length,
              itemBuilder: ((context, index) {
                return cardFood(context, food[index]);
              }),
            );
          }
        },
      ),
    );
  }
}
