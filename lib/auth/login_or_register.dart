import 'package:flutter/material.dart';
import 'package:flutter_learn/pages/login_page.dart';
import 'package:flutter_learn/pages/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginpage = true;

  void tooglePages() {
    setState(() {
      showLoginpage = !showLoginpage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginpage) {
      return LoginPage(onTap: tooglePages);
    } else {
      return RegisterPage(onTap: tooglePages);
    }
  }
}
