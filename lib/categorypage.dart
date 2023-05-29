//import 'package:elmatbakh/categoryCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:taswiha/FeedPage.dart';
import 'package:taswiha/bottomNavbar.dart';
import 'package:taswiha/userPage.dart';
import 'CategoryCard.dart';
import 'Category.dart';
import 'PostPage.dart';
import 'loginpage.dart';
import 'searchPage.dart';
import 'globals.dart';

class CategoryGrid extends StatelessWidget {
  int currentIndex = 3;
 var catInstance= FirebaseFirestore.instance.collection("Categories").snapshots();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Categories',
      routes: {
            'categoryroute': (dummyCtx) => CategoryGrid(),
            'MainMenu': (dummyCtx) => FeedPage(),
            'searchroute': (dummyCtx) => SearchPage(),
            'userRoute': (dummyCtx) => UserPage(),  
            '/postplace': (dummyCtx) => PostPage()
          },
      home:Scaffold(
      appBar: AppBar(
        title: const Text('Choose your Category'),
        actions: [IconButton(onPressed:(){
          FirebaseAuth.instance.signOut();
          Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );

        }, icon:Icon(Icons.logout), )],
      ),
       body:StreamBuilder<QuerySnapshot>(
        stream: catInstance,
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting) 
          { return Center(child: CircularProgressIndicator(),); }
          if (snapshot.data == null) {
      return Center(child: Text('No data available'));
    }
          var myDocuments = snapshot.data!.docs;
          return GridView.count(
        crossAxisSpacing: 10,
        padding: const EdgeInsets.all(10),
        crossAxisCount: 2,
        children:List.generate(myDocuments.length, (index){
           final document = myDocuments[index];
              final data = document.data() as Map;
              var cid=data!['id'];
              final t=data!['title'];
              final img=data!['imageUrl'];
              final Category c= Category(id:cid, title:t , imageUrl:img);
              return CategoryCard(cat: c);
        })
      );

        },
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
    ),
    );
    
    
  }
}
