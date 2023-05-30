
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
    var commentController=TextEditingController();
   
   
    void addComment()async{
      var comment=commentController.text.trim();
var cid=0;
final documentRef = FirebaseFirestore.instance.collection('Users').doc(FirebaseAuth.instance.currentUser!.uid);
final snapshot= await documentRef.get();
var u=snapshot.data()!['username'];
var generate=await FirebaseFirestore.instance.collection('Comments').add({
  'text':comment,
  'uid':FirebaseAuth.instance.currentUser!.uid,
  'timeCreated':Timestamp.now(),
  'pid':postPid,
  'username':u,

});
await FirebaseFirestore.instance.collection('Posts').doc(postPid).update({
 'noComments':postComm + 1
});
String postId = generate.id; // Get the auto-generated ID of the newly created document

await FirebaseFirestore.instance.collection('Posts').doc(postId).update({
  'pid': postId,
});
    }
    // final postTitle = post?['Post']?.title;
    // final postTitle = post?['Post']?.title;

    // Build your UI using the extracted post properties
    return Scaffold(
  appBar: AppBar(
    title: Text('Post Details'),
  ),
  body: SingleChildScrollView(
    child: Column(
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
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Comment',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    controller: commentController,
                    onChanged: (value) {
                      // Handle comment input
                    },
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      addComment();
                    },
                    icon: Icon(Icons.send),
                    label: Text('Post Comment'),
                  ),
                  StreamBuilder<QuerySnapshot>(
  stream: FirebaseFirestore.instance.collection('Comments').snapshots(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(child: CircularProgressIndicator());
    }
    var myDocuments = snapshot.data!.docs;
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: myDocuments.length,
      itemBuilder: (ctx, index) {
        var document = myDocuments[index];
        final data = document.data() as Map;
        final text = data['text'];
        final pid=data['pid'];

        if(pid==postPid){
return ListTile(
          title: Text(text),
        );
        }
        else{
          return Container();
        }
        
      },
    );
  },
),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                // Additional widgets can be added here if needed
              ]),
            ],
          ),
        ),
      ],
    ),
  ),
);

  }
}
