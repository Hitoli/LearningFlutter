import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "New Flutter Practice App",
        home: Container(
          color: Colors.amber,
          child: const Center(
            child: Text(
              "Hello World",
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ));
  }
}
