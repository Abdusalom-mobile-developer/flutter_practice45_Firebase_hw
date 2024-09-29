// ignore_for_file: unused_field, prefer_final_fields

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_practice45_firebase_hw/config/widgets.dart';
import 'package:flutter_practice45_firebase_hw/screens/home.dart';
import 'package:flutter_practice45_firebase_hw/screens/sign_in.dart';
import 'package:flutter_practice45_firebase_hw/services/auth.dart';

class SplashScreen extends StatefulWidget {
  static const String id = "/splash_screen";
  const SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with CustomWidgets {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(milliseconds: 2350),
      () {
        bool check = AuthService.isLoggedin();
        check
            ? Navigator.pushReplacementNamed(context, HomeScreen.id)
            : Navigator.pushReplacementNamed(context, SignInScreen.id);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
        child: CircularProgressIndicator(
          color: Colors.red[800],
        ),
      )),
    );
  }
}
