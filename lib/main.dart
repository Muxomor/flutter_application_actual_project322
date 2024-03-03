import 'package:flutter/material.dart';
import 'package:flutter_application_actual_project322/routes/routes.dart';

void main() {
  runApp(const ThemeAppMenu());
}

class ThemeAppMenu extends StatelessWidget {
  const ThemeAppMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: routes,
    );
  }
}