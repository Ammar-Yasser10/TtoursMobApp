//import 'package:elmatbakh/categoryCard.dart';
import 'package:flutter/material.dart';
import 'package:taswiha/FeedPage.dart';
import 'package:taswiha/bottomNavbar.dart';
import 'package:taswiha/userPage.dart';
import 'CategoryCard.dart';
import 'catlist.dart';
import 'Category.dart';
import 'PostDetails.dart';
import 'PostPage.dart';
import 'loginpage.dart';
import 'searchPage.dart';

class CategoryGrid extends StatelessWidget {
  int currentIndex = 3;
<<<<<<< Updated upstream
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
=======
  var catInstance =
      FirebaseFirestore.instance.collection("Categories").snapshots();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Categories',
      routes: {
        'categoryroute': (dummyCtx) => CategoryGrid(),
        'MainMenu': (dummyCtx) => FeedPage(),
        'searchroute': (dummyCtx) => SearchPage(),
        'userRoute': (dummyCtx) => UserPage(),
        '/postplace': (dummyCtx) => PostPage(),
        '/PostDetailsRoute': (dummyCtx) => PostDetails()
      },
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Choose your Category'),
          actions: [
            IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              icon: const Icon(Icons.logout),
            )
          ],
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: catInstance,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.data == null) {
              return const Center(child: Text('No data available'));
            }
            var myDocuments = snapshot.data!.docs;
            return GridView.count(
                crossAxisSpacing: 10,
                padding: const EdgeInsets.all(10),
                crossAxisCount: 2,
                children: List.generate(myDocuments.length, (index) {
                  final document = myDocuments[index];
                  final data = document.data() as Map;
                  var cid = data!['id'];
                  final t = data!['title'];
                  final img = data!['imageUrl'];
                  final Category c = Category(id: cid, title: t, imageUrl: img);
                  return CategoryCard(cat: c);
                }));
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
>>>>>>> Stashed changes
    );
  }
}
