import 'package:flutter/material.dart';
import 'loginpage.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  late String _name;
  late String _username;
  late String _password;
  late String _nationality;
  final List<String> _nationalities = [
    'United States',
    'Canada',
    'United Kingdom',
    'Australia',
    'Other'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Name'),
              onChanged: (value) {
                setState(() {
                  _name = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(labelText: 'Username'),
              onChanged: (value) {
                setState(() {
                  _username = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
              onChanged: (value) {
                setState(() {
                  _password = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            // DropdownButtonFormField(
            //   decoration: InputDecoration(labelText: 'Nationality'),
            //   value: "choose",
            //   items: _nationalities.map((String value) {
            //     return DropdownMenuItem<String>(
            //       value: value,
            //       child: Text(value),
            //     );
            //   }).toList(),
            //   onChanged: (value) {
            //     setState(() {
            //       _nationality =value! ;
            //     });
            //   },
            // ),
            SizedBox(height: 32.0),
            ElevatedButton(
              child: Text('Register'),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (DummyNameFilledByFlutter) {
                  return LoginPage();
                }));
                // Perform registration logic here
                print('Name: $_name');
                print('Username: $_username');
                print('Password: $_password');
                // print('Nationality: $_nationality');
              },
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: RegistrationPage(),
  ));
}
