import 'package:flutter/material.dart';
import 'package:flutter_application_actual_project322/database/firebase_auth/model.dart';
import 'package:flutter_application_actual_project322/pages/authPage.dart';
import 'package:flutter_application_actual_project322/pages/home.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userModel? UserModel = Provider.of<userModel?>(context);
    final bool check = UserModel!=null;

    return check? const HomePage():const Authpage();
  }
}