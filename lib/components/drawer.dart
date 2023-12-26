import 'package:flutter/material.dart';
import 'package:flutter_learn/components/list_tile.dart';

class MyDrawer extends StatelessWidget {
  final Function()? profile;
  final Function()? logout;
  const MyDrawer({super.key, required this.logout, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: Column(
        children: [
          SizedBox(height: 100.0),
          Icon(Icons.person, color: Colors.white, size: 64),
          MyListOfDrawer(
              listIcon: Icons.home,
              listTitle: "Home",
              onTap: () => Navigator.pop(context)),
          MyListOfDrawer(
              listIcon: Icons.person_2, listTitle: "Profile", onTap: profile),
          MyListOfDrawer(
              listIcon: Icons.logout, listTitle: "Logout", onTap: logout),
        ],
      ),
    );
  }
}
