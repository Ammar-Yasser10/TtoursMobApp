//  import 'dart:html';
<<<<<<< Updated upstream
=======

// import 'package:flutter/material.dart';

//  class PostPage extends StatelessWidget {
//   late File file;

//   handleImageCapture(context) async {
//     Navigator.pop(context);
//     // XFile? file = await ImagePicker().pickImage(source: ImageSource.camera);
//   }

//   handleChooseImage(context) async {
//     Navigator.pop(context);
//     // XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
//   }

//   selectImage(parentcontext) {
//     return showDialog(
//         context: parentcontext,
//         builder: (context) {
//           return SimpleDialog(
//             title: const Text('create post'),
//             children: [
//               SimpleDialogOption(
//                 child: const Text('capture photo'),
//                 onPressed: () => handleImageCapture,
//               ),
//               SimpleDialogOption(
//                 child: const Text('choose from gallery'),
//                 onPressed: () => handleChooseImage,
//               ),
//               SimpleDialogOption(
//                 child: const Text('cancel'),
//                 onPressed: () => Navigator.pop(context),
//               )
//             ],
//           );
//         });
//   }

//   @override
//   Widget build(BuildContext context) {
//     double cardheightwidth = 120.0;
//     double iconsize = 60.0;

//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.cyan,
//           leading: IconButton(
//             icon: const Icon(Icons.arrow_back, color: Colors.white),
//             onPressed: () => null,
//           ),
//           title: const Text("Create post"),
//           centerTitle: true,
//         ),
//         body: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         GestureDetector(
//                           onTap: () => selectImage(context),
//                           child: SizedBox(
//                             height: cardheightwidth,
//                             width: cardheightwidth,
//                             child: Card(
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10)),
//                               elevation: 20,
//                               child: Center(
//                                 child: Icon(
//                                   Icons.image_outlined,
//                                   size: iconsize,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: () => selectImage(context),
//                           child: SizedBox(
//                             height: cardheightwidth,
//                             width: cardheightwidth,
//                             child: Card(
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10)),
//                               elevation: 20,
//                               child: Center(
//                                 child: Icon(
//                                   Icons.image_outlined,
//                                   size: iconsize,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: () => selectImage(context),
//                           child: SizedBox(
//                             height: cardheightwidth,
//                             width: cardheightwidth,
//                             child: Card(
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10)),
//                               elevation: 20,
//                               child: Center(
//                                 child: Icon(
//                                   Icons.image_outlined,
//                                   size: iconsize,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   margin: const EdgeInsets.all(14),
//                   child: TextFormField(
//                     decoration: const InputDecoration(
//                       border: UnderlineInputBorder(),
//                       labelText: 'Title',
//                       icon: Icon(Icons.account_circle_outlined),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: const EdgeInsets.all(10),
//                   child: TextFormField(
//                     decoration: const InputDecoration(
//                       border: UnderlineInputBorder(),
//                       labelText: 'Description',
//                       icon: Icon(Icons.text_format_rounded),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: const EdgeInsets.all(10),
//                   child: TextFormField(
//                     decoration: const InputDecoration(
//                       border: UnderlineInputBorder(),
//                       labelText: 'Location',
//                       icon: Icon(Icons.pin_drop_rounded),
//                     ),
//                   ),
//                 ),
//                 const ElevatedButton(
//                   onPressed: null,
//                   child: Text('Use Current Location'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//  import 'dart:html';
import 'dart:io';

>>>>>>> Stashed changes
import 'package:flutter/material.dart';
import 'package:taswiha/searchPage.dart';
import 'bottomNavbar.dart';
import 'categorypage.dart';
import 'userPage.dart';
<<<<<<< Updated upstream
// import 'package:image_picker/image_picker.dart';

class PostPage extends StatelessWidget {
  // late File file;
=======
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
  XFile? imageFile;
>>>>>>> Stashed changes

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

  handleImageCapture() async {
    Navigator.pop(context);
    imageFile = (await ImagePicker().pickImage(source: ImageSource.camera))!;
    setState(() {});
  }

  handleChooseImage() async {
    Navigator.pop(context);
    imageFile = (await ImagePicker().pickImage(source: ImageSource.gallery))!;
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
                      ),
                      // GestureDetector(
                      //   // onTap: () => selectImage(context),
                      //   child: SizedBox(
                      //     height: cardheightwidth,
                      //     width: cardheightwidth,
                      //     child: Card(
                      //       shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(10)),
                      //       elevation: 20,
                      //       child: Center(
                      //         child: Icon(
                      //           Icons.image_outlined,
                      //           size: iconsize,
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // GestureDetector(
                      //   // onTap: () => selectImage(context),
                      //   child: SizedBox(
                      //     height: cardheightwidth,
                      //     width: cardheightwidth,
                      //     child: Card(
                      //       shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(10)),
                      //       elevation: 20,
                      //       child: Center(
                      //         child: Icon(
                      //           Icons.image_outlined,
                      //           size: iconsize,
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
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
                margin: const EdgeInsets.all(14),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Title',
                    icon: Icon(Icons.account_circle_outlined),
                  ),
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
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Location',
                    icon: Icon(Icons.pin_drop_rounded),
                  ),
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
                ),
              ),
              const ElevatedButton(
                onPressed: null,
                child: Text('Publish'),
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
