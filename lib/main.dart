import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_learn/auth/login_or_register.dart';

void main() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  runApp(const MaterialApp(
      debugShowCheckedModeBanner: false, home: LoginOrRegister()));
}
