
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'globals.dart';

class PostDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Extract the 'post' object from the arguments
    final post =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    // Access the post object's properties
    // final postId = post?['Post']?.id;
    List likedField=[];
    List dislikedField=[];
    bool isPostLiked=false;
    final postTitle = post?['Post']?.title;
    final postDescription = post?['Post']?.description;
    final postLocation=post?['Post']?.location;
    final postImg = post?['Post']?.imageURL;
    final postLikes = post?['Post']?.likes;
    final postDislikes=post?['Post']?.noDislikes;
    final postPid=post?['Post']?.pid;
    final postComm=post?['Post']?.noComments;
    // final postTitle = post?['Post']?.title;
    // final postTitle = post?['Post']?.title;

    // Build your UI using the extracted post properties
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Details'),
      ),
      body: Column(
        children: [
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 4,
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        border: Border.symmetric(
                          vertical: BorderSide.none,
                          horizontal: BorderSide(
                            color: Color.fromARGB(255, 161, 248, 61),
                            width: 0.5,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              postTitle!,
                              style: const TextStyle(color: Colors.black, fontSize: 30),
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
                            postLocation!,
                            style: const TextStyle(color: Colors.black, fontSize: 10),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        ClipRRect(
                          child: Builder(
                            builder: (BuildContext context) {
                              try {
                                return Image.memory(
                                  base64Decode(postImg), // Assuming post.imageURL is a Uint8List
                                  height: 250,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                );
                               
                              } catch (e) {
                                print('Error loading image: $e');
                                 return Image.network(
                                  postImg!,
                                  height: 250,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    // SingleChildScrollView(
                    //   padding: const EdgeInsets.all(10),
                    //   child: Column(
                    //     children: [
                    //       Text(
                    //         postDescription!,
                    //         style: const TextStyle(color: Colors.black, fontSize: 20),
                    //         textAlign: TextAlign.start,
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Comment',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onChanged: (value) {
                        // Handle comment input
                      },
                    ),
                                        StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                    stream: FirebaseFirestore.instance.collection('Posts').doc(postPid).snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var data = snapshot.data!.data();
                      List comments = data!['comments'];
                      return ListView.builder(
                      shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                      itemCount: comments.length,
                      itemBuilder: (ctx, index) {
                        final comment = comments[index];
                        final commentText = comment as String;
                        return ListTile(
                          title: Text(commentText),
                        );
                      },
                      
      );
    } else {
      return CircularProgressIndicator();
    }
  },
)

                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
