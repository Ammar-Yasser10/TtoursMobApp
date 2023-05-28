// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:provider/provider.dart';
import 'package:taswiha/categorypage.dart';
import 'package:taswiha/toursit.dart';
import 'auth.dart';
import 'touristList.dart';
import 'registerpage.dart';
import 'searchPage.dart';

class LoginPage extends StatefulWidget {
  
  @override
  State<LoginPage> createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
var passwordController = TextEditingController();
var usernameController = TextEditingController();
var authenticationMode=0;
void loginORsignup() async {
  await Firebase.initializeApp();
  // final authenticationInstance = FirebaseAuth.instance;
// final collectionRef = FirebaseFirestore.instance.collection('Users');
//TO GET ID BASED ON A SPECIFIC FIELD NAME
// final QuerySnapshot querySnapshot = await collectionRef.where('email', isEqualTo: 'yassin@hotmail.com').get();
// var snapshot= await collectionRef.get();
// if(querySnapshot.docs.isNotEmpty){
// for (DocumentSnapshot documentSnapshot in querySnapshot.docs) {
//     final documentId = documentSnapshot.id;
//     final data = documentSnapshot.data();
//     print("USER ID IS SAVED IN:");
//     print(documentId);
//     // Access other fields within the document using data['field_name']
//     // print('Document ID: $documentId');
//     // print('Field value: ${data['field_name']}');
//   }
// }

//TO GET DATA OF A RECORD WHEN GIVING THE ID 
// final documentRef = FirebaseFirestore.instance.collection('Users').doc('your_document_id');
// final snapshot= await documentRef.get();
// if(snapshot.exists){
//   print(snapshot.data());
// }

var email = emailController.text.trim();
var password = passwordController.text.trim();
var username = usernameController.text.trim();
UserCredential authResult;
if (authenticationMode == 1) // sign up
{ // we need to 1) send email and password to authentication SDK to create an account
   // 2) when successful we need to add the username to a new collection in our DB called users
authResult= await FirebaseAuth.instance.createUserWithEmailAndPassword(
email: email,
password: password,
);

// when done registering, let's read the username entered by the user
// and add it to collection users in the db along with the email
// we will add it into a new document inside collection users, 
// but we will not let firebase choose an auto-id for that document, so we will access the auth result
// to get the user and then its id using user.uid (both are keywords)
await FirebaseFirestore.instance
.collection('Users')
.doc(authResult.user!.uid)
.set({
'username': username,
'email': email,});
}
else //log in 
{
authResult = await FirebaseAuth.instance.signInWithEmailAndPassword(
email: email,
password: password,
);
Navigator.of(context).pushNamed('categoryroute');}
}



  void toggleAuthMode() {
setState(() {
authenticationMode==0? authenticationMode=1: authenticationMode=0;
});}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Taswiha Tours Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Taswiha Tours',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email", 
                ),
                controller: emailController,
              ),
            ),
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password", 
                ),
                controller: passwordController,
                obscureText: true,
              ),
            
            ),
            if (authenticationMode == 1) 
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                labelText: "Username", 
                ),
                controller: usernameController,
                obscureText: false,
              ),
            ),

            const SizedBox(height: 16),
            ElevatedButton(
              onPressed:() async {
                	try {
// 		await Firebase.initializeApp();
// 		// setState(() { _initialized = true; });
//      var chatsInstance = FirebaseFirestore.instance.collection("Users");
//   var stream = chatsInstance.snapshots();
  
//   stream.listen((snapshot) {for (var document in snapshot.docs) { 
//          print(document.data()['name'] + ", by " + document.data()['username']);
// }});
loginORsignup();
	} 
	catch(e) {
		// setState(() { _error = true; });
	}
                       },
              child: (authenticationMode==1)? Text("Sign up"): Text("Login"),
            ),
            const SizedBox(height: 10),
            RichText(
              text: TextSpan(
                // text: "Don't have an account? ",
                // style: DefaultTextStyle.of(context).style,
                children: [
                  TextSpan(
                    text: (authenticationMode==1)?"Have an account, Login":"Signup",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = (){toggleAuthMode();} ,
                  ),
                ],
                
              ),
            ),
            const SizedBox(height: 8),
            RichText(
              text: TextSpan(
                // text: 'Continue as a ',
                // style: DefaultTextStyle.of(context).style,
                children: [
                  TextSpan(
                    text: 'guest',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Handle guest button press
                        FirebaseAuth.instance.signOut();

                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}