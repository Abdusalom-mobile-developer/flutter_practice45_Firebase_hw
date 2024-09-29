// ignore_for_file: unused_field, prefer_final_fields

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_practice45_firebase_hw/config/widgets.dart';
import 'package:flutter_practice45_firebase_hw/screens/home.dart';
import 'package:flutter_practice45_firebase_hw/screens/sign_in.dart';
import 'package:flutter_practice45_firebase_hw/services/auth.dart';

class SignUpScreen extends StatefulWidget {
  static const String id = "/sign_up_screen";
  const SignUpScreen({
    super.key,
  });

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> with CustomWidgets {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _cpasswordController = TextEditingController();
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
                      Text("Sign up.",
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
                      customTextField(
                          context, "Confirm Password", _cpasswordController,
                          isObscure: true),
                      customButton(context, "Sign up", () async {
                        setState(() {
                          _isLoading = true;
                        });
                        if (_emailController.text.trim().isNotEmpty &&
                            _passwordController.text.trim().isNotEmpty &&
                            _passwordController.text.trim() ==
                                _cpasswordController.text.trim()) {
                          String email = _emailController.text.trim();
                          String password = _passwordController.text.trim();
                          bool checkIfWorked = await AuthService.signUp(email, password);
                          if(checkIfWorked){
                            Navigator.pushReplacementNamed(
                              context, HomeScreen.id);
                          }
                        }
                        _emailController.clear();
                        _passwordController.clear();
                        _cpasswordController.clear();
                        setState(() {
                          _isLoading = false;
                        });
                      }),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 45,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          customText("Already have an account?"),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 40,
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                    context, SignInScreen.id);
                              },
                              child: customText("Sign in",
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
