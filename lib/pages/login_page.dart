import 'package:flutter/material.dart';
import 'package:flutter_learn/components/button.dart';
import 'package:flutter_learn/components/text_field.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //logo
                  const Icon(
                    Icons.person,
                    size: 100,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text("Welcome back, You have been Missed",
                      style: TextStyle(fontSize: 16)),
                  const SizedBox(
                    height: 25,
                  ),
                  MyTextField(
                      controller: emailTextController,
                      hintText: "Email",
                      obscureText: false),
                  const SizedBox(height: 10),
                  MyTextField(
                      controller: passwordTextController,
                      hintText: "Password",
                      obscureText: true),
                  const SizedBox(height: 20),
                  MyButtonComponent(onTap: () {}, text: "Sign In"), //Button
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Not a Member?",
                          style: TextStyle(color: Colors.grey[700])),
                      const SizedBox(width: 5),
                      GestureDetector(
                          onTap: widget.onTap,
                          child: const Text("Register Now",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue)))
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
