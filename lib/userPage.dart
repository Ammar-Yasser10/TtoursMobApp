import 'package:flutter/material.dart';

import 'PostPage.dart';
import 'bottomNavbar.dart';
import 'categorypage.dart';
import 'searchPage.dart';

<<<<<<< Updated upstream
class UserPage extends StatelessWidget {
=======
class UserPage extends StatefulWidget {
  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  var uname = '';
  var followers = 0;
  var following = 0;
  void initState() {
    super.initState();
    fetchUser();
  }

  void fetchUser() async {
    var documentRef = await FirebaseFirestore.instance
        .collection('Users')
        .doc(myGlobalVariable)
        .get();
    var data = documentRef;
    uname = data.data()!['username'];
    followers = data.data()!['followers'];
    following = data.data()!['following'];
    if (documentRef.exists) {
      print(documentRef.data());
    }
    print(uname);
  }

>>>>>>> Stashed changes
  @override
  Widget build(BuildContext context) {
    int currentIndex = 4;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 20.0),
          const CircleAvatar(
            radius: 50.0,
            backgroundImage: AssetImage('assets/profile_image.jpg'),
          ),
          const SizedBox(height: 10.0),
<<<<<<< Updated upstream
          const Text(
            'Username',
            style: TextStyle(
=======
          Text(
            uname,
            style: const TextStyle(
>>>>>>> Stashed changes
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
              _buildStatColumn('Followers', '100'),
              _buildStatColumn('Following', '50'),
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
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => UserPage()),
              // );
              break;
          }
        },
      ),
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
