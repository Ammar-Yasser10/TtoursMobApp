// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:taswiha/PostPage.dart';
// import 'package:taswiha/categorypage.dart';
// import 'package:taswiha/post.dart';
// import 'package:taswiha/searchPage.dart';
// import 'package:taswiha/userPage.dart';
// import 'PostCard.dart';
// import 'Category.dart';
// import 'bottomNavbar.dart';
// import 'globals.dart';

// // ignore: must_be_immutable
// class PostDetails extends StatelessWidget {
//   int currentIndex = 0;
//   var postInstance = FirebaseFirestore.instance.collection('Posts').snapshots();

//   @override
//   Widget build(BuildContext context) {
//     final routeArgs =
//         ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
//     var vcategory = routeArgs['category'] as Category;
//     print(vcategory.id);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(vcategory.title),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: postInstance,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           var myDocuments = snapshot.data!.docs;
//           return ListView.builder(
//             itemBuilder: (ctx, index) {
//               var document = myDocuments[index];
//               final data = document.data() as Map;
//               final uname = data['username'];
//               final location = data['location'];
//               final img = data['imageUrl'];
//               final likes = data['likes'];
//               final dislikes = data['dislikes'];
//               var cid = data['cid'];
//               final description = data['description'];
//               final noComments = data['noComments'];
//               print(cid);
//               print(myGlobalVariable);
//               if (cid == vcategory.id) {
//                 Post post = Post(
//                     title: uname,
//                     location: location,
//                     cid: cid,
//                     imageURL: img,
//                     comments: [''],
//                     likes: likes,
//                     description: description,
//                     noComments: noComments,
//                     noDislikes: dislikes);
//                 return PostCard(post: post);
//               } else {
//                 return Container();
//               }
//             },
//             itemCount: myDocuments.length,
//             scrollDirection: Axis.vertical,
//           );
//         },
//       ),
//       bottomNavigationBar: CustomBottomNavigationBar(
//         currentIndex: 0,
//         onTap: (index) {
//           switch (index) {
//             case 0: // Home button
//               // Handle navigation logic for home page
//               break;
//             case 1: // Search button
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => SearchPage()),
//               );
//               break;
//             case 2: // Publish button
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => PostPage()),
//               );
//               break;
//             case 3: // Categories button
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => CategoryGrid()),
//               );
//               break;
//             case 4: // User button
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => UserPage()),
//               );
//               break;
//           }
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class PostDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Extract the 'post' object from the arguments
    final post =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    // Access the post object's properties
    // final postId = post?['Post']?.id;
    final postTitle = post?['Post']?.title;
    final postDescription = post?['Post']?.description;

    // Build your UI using the extracted post properties
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Details'),
      ),
      body: Column(
        children: const [
          // Text('Post ID: $postId'),
          // Text('Title: $postTitle'),
          // Text('Description: $postDescription'),
          // Add more widgets as needed

          Card(
            elevation: 4,
            margin: const EdgeInsets.all(10),
          )
        ],
      ),
    );
  }
}
