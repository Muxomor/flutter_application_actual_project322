import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_actual_project322/routes/routes.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:const FirebaseOptions(
    apiKey: 'AIzaSyCLiSmCVaYxnRZBap-E414RRDIb5m0tFhY', 
    appId: '1:417028569662:android:eb842d256a6fdfa7562f6f', 
    messagingSenderId: '417028569662',
    projectId:'fluttermenuproject',
    storageBucket: 'fluttermenuproject.appspot.com' )
  );
  runApp(const ThemeAppMenu());
}

class ThemeAppMenu extends StatelessWidget {
  const ThemeAppMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      initialData: null,
      value: Service().,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        initialRoute: '/',
        routes: routes,
      ),
    );
  }
}