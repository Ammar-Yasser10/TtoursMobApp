import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:taswiha/globals.dart';
import 'toursit.dart';
import 'PostPage.dart';
import 'bottomNavbar.dart';
import 'categorypage.dart';
import 'searchPage.dart';

class UserPage extends StatefulWidget {
  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  // Stream<DocumentSnapshot<Map<String, dynamic>>> getUserStream() {
  //   return FirebaseFirestore.instance
  //       .collection('Users')
  //       .doc(myGlobalVariable)
  //       .snapshots();
  // }
var userInstance=FirebaseFirestore.instance.collection('Users').doc(myGlobalVariable).snapshots();
  @override
  Widget build(BuildContext context) {
    int currentIndex = 4;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
      ),
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream:userInstance,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            var data = snapshot.data!.data();
            var uname = data!['username'];
            var followers = data['followers'];
            var following = data['following'];

            return Column(
              children: <Widget>[
                const SizedBox(height: 20.0),
                const CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('assets/profile_image.jpg'),
                ),
                const SizedBox(height: 10.0),
                Text(
                  uname,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10.0),
                const Text(
                  'Bio',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _buildStatColumn('Followers', '${followers}'),
                    _buildStatColumn('Following', '${following}'),
                  ],
                ),
                const SizedBox(height: 20.0),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 3,
                    children: List.generate(9, (index) {
                      return Container(
                        margin: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/post_image_$index.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return Text('No data available');
          }
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          switch (index) {
            case 0: // Home button
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CategoryGrid()),
              );
              break;
            case 1: // Search button
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchPage()),
              );
              break;
            case 2: // Publish button
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => PostPage()),
              // );
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
      )
    );
  }

  Widget _buildStatColumn(String title, String value) {
    return Column(
      children: <Widget>[
        Text(
          value,
          style: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5.0),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16.0,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}


  // Widget _buildStatColumn(String title, String value) {
  //   return Column(
  //     children: <Widget>[
  //       Text(
  //         value,
  //         style: const TextStyle(
  //           fontSize: 24.0,
  //           fontWeight: FontWeight.bold,
  //         ),
  //       ),
  //       const SizedBox(height: 5.0),
  //       Text(
  //         title,
  //         style: const TextStyle(
  //           fontSize: 16.0,
  //           color: Colors.grey,
  //         ),
  //       ),
  //     ],
  //   );
  // }
