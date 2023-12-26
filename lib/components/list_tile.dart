import 'dart:ffi';

import 'package:flutter/material.dart';

class MyListOfDrawer extends StatelessWidget {
  final IconData listIcon;
  final String listTitle;
  final Function()? onTap;

  const MyListOfDrawer(
      {super.key,
      required this.listIcon,
      required this.listTitle,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Icon(listIcon, color: Colors.white),
        title: Text(
          listTitle,
          style: TextStyle(color: Colors.white),
        ),
        onTap: onTap,
      ),
    );
  }
}
