import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
class AuthProvider with ChangeNotifier {
Future<void> signup({required String em, required String pass}) async {
final url =
Uri.parse('https://www.googleapis.com/identitytoolkit/v3/relyingparty/signupNewUser?key=AIzaSyDmg4qKTShtylsCNh8Vbk49_4KLXNYAZnc');

try { 
      final response = await http.post( url, 
				     body: json.encode( {
			'email': em,
			'password': pass,
			'returnSecureToken': true, },),);

var decodedResponse = json.decode(response.body) as Map<String, dynamic>;
print("token=" + decodedResponse['idToken']);
print("Expires=" + decodedResponse['expiresIn']);
print("local ID=" + decodedResponse['localId']);
}
 catch (err) {print(err.toString());
}}}
