import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/components/like_button.dart';
import 'package:flutter_learn/pages/home_page.dart';

class WallPost extends StatefulWidget {
  final String message;
  final String user;
  final String postId;
  final List<String> likes;
  const WallPost(
      {super.key,
      required this.message,
      required this.user,
      required this.likes,
      required this.postId});

  @override
  State<WallPost> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<WallPost> {
  bool isLiked = false;
  final auth = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    isLiked = widget.likes.contains(auth?.email);
  }

  void istoggle() {
    setState(() {
      isLiked = !isLiked;
    });
    DocumentReference postRef =
        FirebaseFirestore.instance.collection("User Posts").doc(widget.postId);
    if (isLiked) {
      postRef.update({
        'Likes': FieldValue.arrayUnion([auth?.email])
      });
    } else {
      postRef.update({
        'Likes': FieldValue.arrayRemove([auth?.email])
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      margin: EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0),
      padding: EdgeInsets.all(24.0),
      child: Row(
        children: [
          Container(
            decoration:
                BoxDecoration(color: Colors.grey[400], shape: BoxShape.circle),
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.all(10.0),
            child: Icon(Icons.person_2_outlined, color: Colors.white),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.user,
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Container(
                child: Row(
                  children: [
                    Text(widget.message),
                    SizedBox(
                      width: 5.0,
                    ),
                    LikeButton(
                        isLiked: isLiked,
                        onTap: () {
                          istoggle();
                          ;
                        }),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      widget.likes.length.toString(),
                      style: TextStyle(color: Colors.grey[500]),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
