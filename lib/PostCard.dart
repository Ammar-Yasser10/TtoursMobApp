
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:taswiha/globals.dart';
import 'Category.dart';
import 'post.dart';
import 'globals.dart';
import 'ratingWidget.dart';
//Class Category needs to be implemented ABDO

class PostCard extends StatelessWidget {
 
  // Category rec;
  Post post;
   List likedField=[];
   List dislikedField=[];
   bool isPostLiked=false;
  PostCard({required this.post}){
  if(isGuest==false){
 var likedInstance=FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid).snapshots().listen((snapshot) {
    likedField = snapshot.data()!['likedPosts'];
    dislikedField=snapshot.data()!['dislikedPosts'];
    isPostLiked=likedField.contains(post.pid);
  });
  }
  }
  

  checkPostDetails(BuildContext myContext) {
    Navigator.of(myContext)
        .pushNamed('/PostDetailsRoute', arguments: {'Post': post});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        Navigator.of(context)
          .pushNamed('/PostDetailsRoute', arguments: {'Post': post}),
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(children: [
        
          Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  border: Border.symmetric(
                      vertical: BorderSide.none,
                      horizontal: BorderSide(
                          color: Color.fromARGB(255, 161, 248, 61),
                          width: 0.5)),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        (post.title),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 30),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      (post.location),
                      style: const TextStyle(color: Colors.black, fontSize: 10),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                 ClipRRect(
  child: Container(
    child: Builder(
      builder: (BuildContext context) {
        try {
          return Image.memory(
            base64Decode(post.imageURL), // Assuming post.imageURL is a Uint8List
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
          );
          
        } catch (e) {
          print('Error loading image: $e');
          return Image.network(
            post.imageURL,
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
          );
        }
      },
    ),
  ),
)
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Row(children: [
                  LikeButton(
                    size: 30,
                    circleColor: const CircleColor(
                        start: Color(0xff00ddff), end: Color(0xff0099cc)),
                    bubblesColor: const BubblesColor(
                      dotPrimaryColor: Color(0xff33b5e5),
                      dotSecondaryColor: Color(0xff0099cc),
                    ),
                    
                    likeCount: post.likes,
                  onTap:(c) async {
                      if (isGuest == true) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Sign-In Required'),
        content: Text('You need to be signed in to interact.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
} else {
  if (likedField.contains(post.pid)) {
        likedField.remove(post.pid);
    await FirebaseFirestore.instance.collection('Posts').doc(post.pid).update({
      'likes': post.likes - 1,
    });
    await FirebaseFirestore.instance.collection('Users').doc(FirebaseAuth.instance.currentUser!.uid).update({
      'likedPosts': likedField,
    });
 
  } else {
    likedField.add(post.pid);
    await FirebaseFirestore.instance.collection('Posts').doc(post.pid).update({
      'likes': post.likes + 1,
    });
    await FirebaseFirestore.instance.collection('Users').doc(FirebaseAuth.instance.currentUser!.uid).update({
      'likedPosts': likedField,
    });
   

  }
  
}
                  },
                  likeBuilder: (bool isLiked) {
                      return Icon(
                        Icons.favorite,
                        color: isPostLiked ? Colors.red : Colors.grey,
                        size: 30,
                      );
                    },
                  ),
                ]),
                Row(children: [
                  const Icon(
                    Icons.comment,
                    color: Colors.grey,
                  ),
                  Text(("${post.noComments}"))
                ]),
                Row(children: [
                  LikeButton(
                    size: 30,
                    circleColor: const CircleColor(
                        start: Color(0xff00ddff), end: Color(0xff0099cc)),
                    bubblesColor: const BubblesColor(
                      dotPrimaryColor: Color(0xff33b5e5),
                      dotSecondaryColor: Color(0xff0099cc),
                    ),
                    likeBuilder: (bool isLiked) {
                      return Icon(
                        Icons.thumb_down_alt_rounded,
                        color: isLiked ? Colors.black : Colors.grey,
                        size: 30,
                      );
                    },
                    likeCount: post.noDislikes,
                    onTap:(c) async { 
                      if (isGuest == true) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Sign-In Required'),
        content: Text('You need to be signed in to interact.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
} else {
  if (dislikedField.contains(post.pid)) {
        dislikedField.remove(post.pid);
    await FirebaseFirestore.instance.collection('Posts').doc(post.pid).update({
      'dislikes': post.noDislikes - 1,
    });
    await FirebaseFirestore.instance.collection('Users').doc(FirebaseAuth.instance.currentUser!.uid).update({
      'dislikedPosts': dislikedField,
    });
 
  } else {
    dislikedField.add(post.pid);
    await FirebaseFirestore.instance.collection('Posts').doc(post.pid).update({
      'dislikes': post.noDislikes + 1,
    });
    await FirebaseFirestore.instance.collection('Users').doc(FirebaseAuth.instance.currentUser!.uid).update({
      'dislikedPosts': dislikedField,
    });
   

  }
  
}
                  },
                  ),
                ]),
                Row(children: [RatingWidget()],)
              ]),
              SingleChildScrollView(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      (post.description),
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }

}
