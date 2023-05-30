import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taswiha/PostPage.dart';
import 'package:taswiha/categorypage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'auth.dart';
import 'loginpage.dart';
import 'categorypage.dart';
import 'registerpage.dart';
import 'FeedPage.dart';
import 'PostPage.dart';
import 'searchPage.dart';
import 'PostDetails.dart';
import 'userPage.dart';
Future<void> main() async {
  runApp(const MyApp());
    await Firebase.initializeApp();

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override 
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (ctx) => AuthProvider()),
        ],
        child: MaterialApp(
          title: 'Taswiha Tours',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: LoginPage(),
          routes: {
            'categoryroute': (dummyCtx) => CategoryGrid(),
            'registrationroute': (dummyCtx) => RegistrationPage(),
            'MainMenu': (dummyCtx) => FeedPage(),
            'searchroute': (dummyCtx) => SearchPage(),
            'userRoute': (dummyCtx) => UserPage(),  
            '/postplace': (dummyCtx) => PostPage(),
            '/PostDetailsRoute':(dummyCtx) => PostDetails()
          },
        ));
  }
}

