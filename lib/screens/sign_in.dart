// ignore_for_file: unused_field, prefer_final_fields

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_practice45_firebase_hw/config/widgets.dart';
import 'package:flutter_practice45_firebase_hw/screens/home.dart';
import 'package:flutter_practice45_firebase_hw/screens/sign_up.dart';
import 'package:flutter_practice45_firebase_hw/services/auth.dart';

class SignInScreen extends StatefulWidget {
  static const String id = "/sign_in_screen";
  const SignInScreen({
    super.key,
  });

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> with CustomWidgets {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FocusNode _focusNode = FocusNode();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(milliseconds: 100),
      () {
        _focusNode.requestFocus();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: _isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.red[800],
                ),
              )
            : GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Sign in.",
                          style: TextStyle(
                              color: Colors.red[800],
                              fontSize: MediaQuery.of(context).size.width / 9,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 17,
                      ),
                      customTextField(context, "Email", _emailController,
                          focusNode: _focusNode),
                      customTextField(context, "Password", _passwordController,
                          isObscure: true),
                      customButton(context, "Sign in", () async {
                        setState(() {
                          _isLoading = true;
                        });
                        if (_emailController.text
                                .trim()
                                .contains("@gmail.com") &&
                            _passwordController.text.trim().length > 6) {
                          String email = _emailController.text.trim();
                          String password = _passwordController.text.trim();
                          bool answer =
                              await AuthService.signIn(email, password);
                          if (answer) {
                            Navigator.pushReplacementNamed(
                                context, HomeScreen.id);
                          }
                         
                        }
                         setState(() {
                            _isLoading = false;
                          });
                          _emailController.clear();
                          _passwordController.clear();
                      }),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 45,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          customText("Don't have an account?"),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 40,
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                    context, SignUpScreen.id);
                              },
                              child: customText("Sign up",
                                  color: Colors.red[800]!))
                        ],
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
