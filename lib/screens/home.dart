// ignore_for_file: unused_field, prefer_final_fields

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_practice45_firebase_hw/config/widgets.dart';
import 'package:flutter_practice45_firebase_hw/screens/sign_in.dart';
import 'package:flutter_practice45_firebase_hw/services/auth.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "/home_screen";
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with CustomWidgets {
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(milliseconds: 100),
      () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red[800],
        title: Text("Home Screen.",
            style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width / 17,
                fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
              onPressed: () {
                AuthService.logOut();
                Navigator.pushReplacementNamed(context, SignInScreen.id);
              },
              icon: Icon(
                Icons.logout_rounded,
                color: Colors.white,
                size: MediaQuery.of(context).size.width / 14,
              ))
        ],
      ),
      body: SafeArea(
          child: Center(
        child: Text("Home Screen.",
            style: TextStyle(
                color: Colors.red[800],
                fontSize: MediaQuery.of(context).size.width / 9,
                fontWeight: FontWeight.bold)),
      )),
    );
  }
}
