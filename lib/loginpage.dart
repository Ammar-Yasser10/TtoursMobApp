import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:provider/provider.dart';
import 'package:taswiha/categorypage.dart';
import 'package:taswiha/toursit.dart';
import 'auth.dart';
import 'touristList.dart';
import 'registerpage.dart';
import 'searchPage.dart';

<<<<<<< Updated upstream
class LoginPage extends StatelessWidget {
  navigateToCategoryPage(BuildContext context) {}

  bool checkUser(String u, String p) {
    return tlist.contains(Tourist(username: u, password: p));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
=======
class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var usernameController = TextEditingController();
  var authenticationMode = 0;
  void loginORsignup() async {
    await Firebase.initializeApp();
    // final authenticationInstance = FirebaseAuth.instance;
//TO GET ID BASED ON A SPECIFIC FIELD NAME

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
    {
      // we need to 1) send email and password to authentication SDK to create an account
      // 2) when successful we need to add the username to a new collection in our DB called users
      authResult = await FirebaseAuth.instance.createUserWithEmailAndPassword(
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
        'email': email,
      });
    } else //log in
    {
      authResult = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.of(context).pushNamed('categoryroute');
      final collectionRef = FirebaseFirestore.instance.collection('Users');
      final QuerySnapshot querySnapshot =
          await collectionRef.where('email', isEqualTo: email).get();
      var snapshot = await collectionRef.get();
      if (querySnapshot.docs.isNotEmpty) {
        for (DocumentSnapshot documentSnapshot in querySnapshot.docs) {
          final documentId = documentSnapshot.id;
          myGlobalVariable = documentId;
          final data = documentSnapshot.data();
          print("USER ID IS SAVED IN:");
          print(documentId);
          // Access other fields within the document using data['field_name']
          // print('Document ID: $documentId');
          // print('Field value: ${data['field_name']}');
        }
      }
    }
  }

  void toggleAuthMode() {
    setState(() {
      authenticationMode == 0 ? authenticationMode = 1 : authenticationMode = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
>>>>>>> Stashed changes
      appBar: AppBar(
        title: Text('Taswiha Tours Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Taswiha Tours',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
<<<<<<< Updated upstream
            SizedBox(height: 16),
            Text(
              'username',
              style: TextStyle(fontSize: 16),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
=======
            const SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email",
>>>>>>> Stashed changes
                ),
              ),
            ),
<<<<<<< Updated upstream
            Text(
              'Password',
              style: TextStyle(fontSize: 16),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
=======
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password",
>>>>>>> Stashed changes
                ),
                obscureText: true,
              ),
            ),
<<<<<<< Updated upstream
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (DummyNameFilledByFlutter) {
                  return CategoryGrid();
                }));
              },
              child: Text('Login'),
=======
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
              onPressed: () async {
                try {
// 		await Firebase.initializeApp();
// 		// setState(() { _initialized = true; });
//      var chatsInstance = FirebaseFirestore.instance.collection("Users");
//   var stream = chatsInstance.snapshots();

//   stream.listen((snapshot) {for (var document in snapshot.docs) {
//          print(document.data()['name'] + ", by " + document.data()['username']);
// }});
                  loginORsignup();
                } catch (e) {
                  // setState(() { _error = true; });
                }
              },
              child:
                  (authenticationMode == 1) ? Text("Sign up") : Text("Login"),
>>>>>>> Stashed changes
            ),
            SizedBox(height: 10),
            RichText(
              text: TextSpan(
                // text: "Don't have an account? ",
                // style: DefaultTextStyle.of(context).style,
                children: [
                  TextSpan(
<<<<<<< Updated upstream
                    text: 'Sign up',
                    style: TextStyle(
=======
                    text: (authenticationMode == 1)
                        ? "Have an account, Login"
                        : "Signup",
                    style: const TextStyle(
>>>>>>> Stashed changes
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
<<<<<<< Updated upstream
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (DummyNameFilledByFlutter) {
                          return RegistrationPage();
                        }));
=======
                        toggleAuthMode();
>>>>>>> Stashed changes
                      },
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            RichText(
              text: TextSpan(
                // text: 'Continue as a ',
                // style: DefaultTextStyle.of(context).style,
                children: [
                  TextSpan(
                    text: 'guest',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
<<<<<<< Updated upstream
                      color: Colors.blue,
=======
                      color: Colors.blueGrey,
>>>>>>> Stashed changes
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Handle guest button press
<<<<<<< Updated upstream
=======
                        isGuest = true;
                        Navigator.of(context).pushNamed('categoryroute');
>>>>>>> Stashed changes
                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
<<<<<<< Updated upstream
    );
  }
}

// class LoginPage extends StatefulWidget {
// @override
// _LoginScreenState createState() => _LoginScreenState();


// }
// class _LoginScreenState extends State<LoginPage> {

// var emailController = TextEditingController();
// var passwordController = TextEditingController();
// var confirmPasswordController = TextEditingController();

// var authenticationMode = 0;
// // 0 for login and 1 for signup.
// // when 0: only email and password fields appear + button login + button sign up instead
// // when 1: email and password and confimp password appear + button sign up + button login instead
// void loginORsignup() async{
// if(authenticationMode==1){
// await Provider.of<AuthProvider>(context, listen:false).signup(em:emailController.text.trim(),pass: passwordController.text.trim());
// }
// }
// void toggleAuthMode() {
// setState(() {
// authenticationMode==0? authenticationMode=1: authenticationMode=0;
// });
// }

//   @override
//  Widget build(BuildContext context) {
// return Scaffold(
// body: Container(width: double.infinity,height: 400,margin: EdgeInsets.only(top: 100, left: 10, right: 10),
// child: 
// Card(elevation: 5,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
// child: Padding( padding: const EdgeInsets.all(8.0), child: Column(
// children: [ Center( child: Text( "TaswihaTours",style: TextStyle(fontSize: 30),),),
// TextField(
// decoration: InputDecoration(labelText: "Email"), controller: emailController,
// keyboardType: TextInputType.emailAddress, ),

// TextField(
// decoration: InputDecoration(labelText: "Password"), controller: passwordController,
// obscureText: true, ),

// if (authenticationMode == 1) TextField(
// decoration: InputDecoration(labelText: "Confirm Password"), controller: confirmPasswordController,
// obscureText: true,),
 
// ElevatedButton( onPressed: () {loginORsignup();},
//   child: (authenticationMode==1)? Text("Sign up"): Text("Login"),),
 
// TextButton( onPressed: () {toggleAuthMode();},
//   child:(authenticationMode==1)? Text("Login instead"): Text("Sign up instead"),),],),),),),);}
// }

=======
    ));
  }
}
>>>>>>> Stashed changes
