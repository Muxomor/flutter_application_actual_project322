// ignore_for_file: prefer_const_constructors


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_actual_project322/database/ClientOrdersCollection.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
OrdersCollection order = OrdersCollection();
 Widget OrderCard(BuildContext context, dynamic docs) {
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
            trailing: IconButton(icon: Icon(Icons.delete), onPressed: () async{},),
          ),
        )
      ]),
    );
  }

  
  final String Uid = FirebaseAuth.instance.currentUser!.uid.toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
     StreamBuilder(
      stream: FirebaseFirestore.instance.collection('orders').snapshots(),
      builder: (context,snapshot){
        if(!snapshot.hasData){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        else{
          var orders = snapshot.data!.docs.where((element) => element['uid']==Uid).toList();
          return ListView.builder(
          itemCount: orders.length,
          itemBuilder : (context,index){
            return OrderCard(context, orders[index]);
          },
          );
        }
      },
     ),
      bottomSheet: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () {},
              child: const Text('Перейти к оплате'),
            ),
          ),
        ],
      ),
    );
  }
}
