import 'package:flutter/material.dart';
import 'package:taswiha/PostPage.dart';
import 'package:taswiha/categorypage.dart';
import 'package:taswiha/searchPage.dart';
import 'package:taswiha/userPage.dart';
import 'PostCard.dart';
import 'Category.dart';
import 'bottomNavbar.dart';
import 'postList.dart';

class FeedPage extends StatelessWidget {
  //Category category;
  //KitchenScreen({required this.category});

  //Implementation of this page needs to be changed to fit the database
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Category>;
    final category = routeArgs['category'];

    final postsInThatCategory = postlist.where((element) {
      //needs to be implemeetd in the post class or database
      return element.cid.contains(category!.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category!.title),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return PostCard(post: postsInThatCategory[index]);
        },
        itemCount: postsInThatCategory.length,
        scrollDirection: Axis.vertical,
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
