
import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:taswiha/ratingWidget.dart';
import 'package:taswiha/searchPage.dart';
import 'bottomNavbar.dart';
import 'categorypage.dart';
import 'globals.dart';
import 'userPage.dart';
import 'package:taswiha/searchPage.dart';
import 'package:geolocator/geolocator.dart';
import 'bottomNavbar.dart';
import 'categorypage.dart';
import 'userPage.dart';
import 'package:image_picker/image_picker.dart';

class PostPage extends StatefulWidget {
  @override
  _PostPage createState() => _PostPage();
}

class _PostPage extends State<PostPage> {
  var titleController=TextEditingController();
  var locationController=TextEditingController();
  var descriptionController=TextEditingController();
  var categoryController=TextEditingController();

  void setRating(int rating) {
    setState(() {
      selectedRating = rating;
    });
  }
   void showSignInDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sign-In Required'),
          content: const Text('You need to be signed in to interact.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Future<void> addPost() async {
var title = titleController.text.trim();
var location = locationController.text.trim();
var description = descriptionController.text.trim();
var category=categoryController.text.trim();
var rating=selectedRating;
var cid=0;

switch(category){
  case 'hotels':
  cid=1;
  break;
  case 'restaurants':
  cid=3;
  break;
  case 'museums':
  cid=2;
  break;
  case 'clubs':
  cid=4;
  break;
}
final documentRef = FirebaseFirestore.instance.collection('Users').doc(FirebaseAuth.instance.currentUser!.uid);
final snapshot= await documentRef.get();
var u=snapshot.data()!['username'];
var generate=await FirebaseFirestore.instance.collection('Posts').add({
  'cid':cid,
  'description':description ,
  'dislikes':0,
  'likes':0,
  'location':location,
  'noComments':0,
  'uid':FirebaseAuth.instance.currentUser!.uid,
  'timeCreated':Timestamp.now(),
  'imageUrl':base64Image,
  'username':u,
  'comments':[],
  'rating':rating

});
String postId = generate.id; // Get the auto-generated ID of the newly created document

await FirebaseFirestore.instance.collection('Posts').doc(postId).update({
  'pid': postId,
});
  }
  
  XFile? imageFile;
XFile? capturedImage;
var base64Image;
  int selectedRating = 0;


  Future<void> _getLocation() async {
    try {
      Position position = await getCurrentLocation();
      // Do something with the retrieved position
      print('Latitude: ${position.latitude}, Longitude: ${position.longitude}');
    } catch (e) {
      // Handle error
      print('Error getting location: $e');
    }
  }

  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled');
    }

    // Check location permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permissions are permanently denied');
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        throw Exception('Location permissions are denied');
      }
    }

    // Get the current location
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    return position;
  }

Future<void> handleImageCapture() async {
  Navigator.pop(context);
  final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);

  if (pickedFile != null) {
    capturedImage = XFile(pickedFile.path);
    setState(() {});

    // Convert the captured image to a format that Firestore can accept
    List<int> imageBytes = await capturedImage!.readAsBytes();
    base64Image = base64Encode(imageBytes);
    // Now you can store the `base64Image` string in Firestore
  }
}


  handleChooseImage() async {
    Navigator.pop(context);
   final pickedFile = (await ImagePicker().pickImage(source: ImageSource.gallery))!;
   if (pickedFile != null) {
    capturedImage = XFile(pickedFile.path);
    setState(() {});

    // Convert the captured image to a format that Firestore can accept
    List<int> imageBytes = await capturedImage!.readAsBytes();
    base64Image = base64Encode(imageBytes);
    // Now you can store the `base64Image` string in Firestore
  }
    setState(() {});
  }

  selectImage(parentcontext) {
    return showDialog(
        context: parentcontext,
        builder: (context) {
          return SimpleDialog(
            title: const Text('Photo'),
            children: [
              SimpleDialogOption(
                child: const Text('capture photo'),
                onPressed: () => handleImageCapture(),
              ),
              SimpleDialogOption(
                child: const Text('choose from gallery'),
                onPressed: () => handleChooseImage(),
              ),
              SimpleDialogOption(
                child: const Text('cancel'),
                onPressed: () => Navigator.pop(context),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    double cardheightwidth = 60.0;
    double iconsize = 60.0;
    int currentIndex = 2;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text("Create post"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => selectImage(context),
                        child: SizedBox(
                          height: cardheightwidth,
                          width: cardheightwidth,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            elevation: 20,
                            child: Center(
                              child: imageFile == null
                                  ? Icon(Icons.image)
                                  : Image.file(
                                      File(imageFile!
                                          .path), // Display the selected image
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Container(
                margin: const EdgeInsets.all(10),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Location',
                    icon: Icon(Icons.pin_drop_rounded),
                  ),
                  controller: locationController,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Description',
                    icon: Icon(Icons.text_format_rounded),
                  ),
                  controller: descriptionController,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Category',
                    icon: Icon(Icons.view_compact_rounded),
                  ),
                  controller: categoryController,
                ),
              ),
              Container(
                  margin: const EdgeInsets.all(10), child:Row(
      children: [
        PopupMenuButton<int>(
          itemBuilder: (context) => List<PopupMenuEntry<int>>.generate(
            5,
            (index) => PopupMenuItem<int>(
              value: index + 1,
              child: ListTile(
                leading: Icon(
                  Icons.star,
                  color:
                      selectedRating >= index + 1 ? Colors.amber : Colors.grey,
                ),
                title: Text('${index + 1}'),
              ),
            ),
          ),
          child: IconButton(
            onPressed: isGuest ? showSignInDialog : null,
            icon: Icon(
              Icons.star,
              color: selectedRating > 0 ? Colors.amber : Colors.grey,
            ),
          ),
          onSelected: (value) {
            if (!isGuest) {
              setRating(value);
            } else {
              showSignInDialog();
            }
          },
        ),
        Text(selectedRating > 0 ? 'Chosen rate: $selectedRating' : 'Rating'),
      ],
    )),
              ElevatedButton(
                onPressed: () async {
                  addPost();
                  print(base64Image);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CategoryGrid()),
                  );
                },
                child: Text('Post'),
              ),
            ],
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
      ),
    );
  }
}

Future<Position> getCurrentLocation() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Check if location services are enabled
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are disabled, handle accordingly
    return Future.error('Location services are disabled');
  }

  // Check location permission
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.deniedForever) {
    // Location permissions are permanently denied, handle accordingly
    return Future.error('Location permissions are permanently denied');
  }

  if (permission == LocationPermission.denied) {
    // Location permissions are denied, ask for permission
    permission = await Geolocator.requestPermission();
    if (permission != LocationPermission.whileInUse &&
        permission != LocationPermission.always) {
      // Location permissions are denied, handle accordingly
      return Future.error('Location permissions are denied');
    }
  }

  // Get the current location
  Position position = await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high,
  );

  return position;
}