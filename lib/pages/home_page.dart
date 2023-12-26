import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/components/drawer.dart';
import 'package:flutter_learn/components/text_field.dart';
import 'package:flutter_learn/components/wall_post.dart';
import 'package:flutter_learn/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final textController = TextEditingController();
  final currentUser = FirebaseAuth.instance.currentUser;
  final firebasestore = FirebaseFirestore.instance.collection("User Posts");

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  void goToProfile() {
    Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MyProfilePage()));
  }

  void postMessage() {
    if (textController.text.isNotEmpty) {
      firebasestore.add({
        'User_Email': currentUser?.email,
        'Message': textController.text,
        'TimeStamp': Timestamp.now(),
        'Likes': [],
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      drawer: MyDrawer(
        logout: signOut,
        profile: goToProfile,
      ),
      appBar: AppBar(
        title: Text(
          "The Wall",
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.grey[900],
        actions: [IconButton(onPressed: signOut, icon: Icon(Icons.logout))],
      ),
      body: Center(
        child: Column(children: [
          //The wall
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("User Posts")
                  .orderBy("TimeStamp", descending: false)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final post = snapshot.data?.docs[index];
                        print("post==>${post?.data()}");
                        return WallPost(
                            message: post?['Message'] ?? '',
                            user: post?['User_Email'] ?? '',
                            likes: List<String>.from(post?['Likes'] ?? []),
                            postId: post?.id ?? '');
                      });
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("Error+ ${snapshot.error}"),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),

          // Posting Content Editor
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              children: [
                Expanded(
                  child: MyTextField(
                      controller: textController,
                      hintText: "Post Something Today...",
                      obscureText: false),
                ),
                IconButton(
                    onPressed: () {
                      postMessage();
                      setState(() {
                        textController.clear();
                      });
                    },
                    icon: Icon(Icons.add))
              ],
            ),
          ),

          //Logged In User

          Container(
            child: Text(
              "Logged in as ${currentUser?.email}",
              style: TextStyle(color: Colors.grey[500]),
            ),
            margin: EdgeInsets.only(bottom: 16.0),
          )
        ]),
      ),
    );
  }
}
