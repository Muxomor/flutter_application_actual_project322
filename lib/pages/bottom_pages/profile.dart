import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class profilePage extends StatefulWidget {
  const profilePage({super.key});

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Image.asset(
                  'images/placeholder.png',
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'username',
                      enabled: false,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'example@example.com',
                      enabled: false,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'bithday date',
                      enabled: false,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('История заказов'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
//      body: Column(
//        children: [
//          Row(
//            children: [
//              Image.asset(
//                'images/placeholder.png',
//                width: MediaQuery.of(context).size.width * 0.3,
//                height: MediaQuery.of(context).size.height * 0.2,
//              ),
//              SizedBox(
//                height: MediaQuery.of(context).size.height * 0.03,
//              ),
//              Container(
//                height: 200,
//                child: const Column(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: [
//                    Text("Имя"),
//                    Text("Фамилия"),
//                  ],
//                ),
//              )
//            ],
//          )
//        ],
//      ),
//    );
//  }
//}
