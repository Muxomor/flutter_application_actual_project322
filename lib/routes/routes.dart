import 'package:flutter_application_actual_project322/pages/authPage.dart';
import 'package:flutter_application_actual_project322/pages/home.dart';
import 'package:flutter_application_actual_project322/pages/landing.dart';
import 'package:flutter_application_actual_project322/pages/reg.dart';

final routes = {
  '/':(context)=>const LandingPage(),
  '/auth': (context)=>const Authpage(),
  '/reg':(context)=>const RegistrationPage(),
  '/home':(context)=>const HomePage(),
};