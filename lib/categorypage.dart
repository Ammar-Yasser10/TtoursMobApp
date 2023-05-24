//import 'package:elmatbakh/categoryCard.dart';
import 'package:flutter/material.dart';
import 'package:taswiha/FeedPage.dart';
import 'package:taswiha/bottomNavbar.dart';
import 'package:taswiha/userPage.dart';
import 'CategoryCard.dart';
import 'catlist.dart';
import 'Category.dart';
import 'PostPage.dart';
import 'loginpage.dart';
import 'searchPage.dart';

class CategoryGrid extends StatelessWidget {
  int currentIndex = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose your Category'),
      ),
      body: GridView.count(
        crossAxisSpacing: 10,
        padding: const EdgeInsets.all(10),
        crossAxisCount: 2,
        children: categoriesList.map((c) {
          return CategoryCard(cat: c);
        }).toList(),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          switch (index) {
            case 0: // Home button
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => CategoryGrid()),
              // );
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
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => CategoryGrid()),
              // );
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
