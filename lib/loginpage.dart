import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:provider/provider.dart';
import 'package:taswiha/categorypage.dart';
import 'package:taswiha/toursit.dart';
import 'auth.dart';
import 'touristList.dart';
import 'registerpage.dart';


class LoginPage extends StatelessWidget {
  navigateToCategoryPage(BuildContext context){
   


  }
  bool checkUser(String u, String p){
    return tlist.contains(Tourist(username: u, password: p));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                ),
              ),
            ),
            Text(
              'Password',
              style: TextStyle(fontSize: 16),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed:(){Navigator.of(context).push( MaterialPageRoute( 
                                           builder: (DummyNameFilledByFlutter)
                                                      {return CategoryGrid();}
  						         ));
                       },
              child: Text('Login'),
            ),
            SizedBox(height: 10),
            RichText(
              text: TextSpan(
                // text: "Don't have an account? ",
                // style: DefaultTextStyle.of(context).style,
                children: [
                  TextSpan(
                    text: 'Sign up',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = (){Navigator.of(context).push( MaterialPageRoute( 
                                           builder: (DummyNameFilledByFlutter)
                                                      {return RegistrationPage();}
  						         ));} ,
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
                      color: Colors.blue,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Handle guest button press
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

