import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:taswiha/PostPage.dart';
import 'package:taswiha/categorypage.dart';
import 'package:taswiha/post.dart';
import 'package:taswiha/searchPage.dart';
import 'package:taswiha/userPage.dart';
import 'PostCard.dart';
import 'Category.dart';
import 'bottomNavbar.dart';
import 'globals.dart';

class FeedPage extends StatelessWidget {
  //Category category;
  //KitchenScreen({required this.category});

  //Implementation of this page needs to be changed to fit the database
  int currentIndex = 0;
  var postInstance=FirebaseFirestore.instance.collection('Posts').snapshots();
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Category>;
    var category = routeArgs['category'];
print(category!.id);
    // final postsInThatCategory = postlist.where((element) {
    //   //needs to be implemeetd in the post class or database
    //   // return element.cid.contains(category!.id);
    // }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category!.title),
      ),
       body:StreamBuilder<QuerySnapshot>(
  stream: postInstance,
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(child: CircularProgressIndicator());
    }
    var myDocuments = snapshot.data!.docs;
    return ListView.builder(
      itemBuilder: (ctx, index) {
        Post post;
        var document = myDocuments[index];
        final data = document.data() as Map;
        final uname = data['username'];
        final location = data['location'];
        var imgBase64 = data['imageUrl'];
        final likes = data['likes'];
        final dislikes = data['dislikes'];
        var cid = data['cid'];
        final description = data['description'];
        final noComments = data['noComments'];
        final uid = data['uid'];
        final pid = data['pid'];
        final rating=data['rating'];
        print(cid);
        print(myGlobalVariable);
        if (cid == category.id) {
        post = Post(
            title: uname,
            location: location,
            cid: cid,
            imageURL: imgBase64,
            comments: [''],
            likes: likes,
            description: description,
            noComments: noComments,
            noDislikes: dislikes,
            uid: uid,
            pid: pid,
            rating: rating
          );
          return PostCard(post: post);
        } else {
          return Container();
        }
      },
      itemCount: myDocuments.length,
      scrollDirection: Axis.vertical,
    );
  },
), 
      
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          switch (index) {
            case 0: // Home button
              // Handle navigation logic for home page
              break;
            case 1: // Search button
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchPage()),
              );
              break;
            case 2: // Publish button
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PostPage()),
              );
              break;
            case 3: // Categories button
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CategoryGrid()),
              );
              break;
            case 4: // User button
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserPage()),
              );
              break;
          }
        },
      ),
    );
  }
}
