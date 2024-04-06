import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _orderPageState();
}

class _orderPageState extends State<OrderPage> {
  int itemQnt = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Card(
              child: ListTile(
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
                trailing: SizedBox(
                  width: 200,
                  height: 200,
                  child: Row(
                    children: <Widget>[
                      ElevatedButton(
                          onPressed: () => setState(() {
                                if (itemQnt == 1) {
                                } else {
                                  itemQnt--;
                                }
                              }),
                          child: const Text('-')),
                      Text(itemQnt.toString()),
                      ElevatedButton(
                          onPressed: () => setState(() {
                                itemQnt++;
                              }),
                          child: const Text('+')),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () {},
              child: Text('Перейти к оплате'),
              style: const ButtonStyle(
                
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
