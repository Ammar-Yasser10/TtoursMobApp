//  import 'dart:html';
import 'package:flutter/material.dart';
import 'package:taswiha/searchPage.dart';

import 'bottomNavbar.dart';
import 'categorypage.dart';
import 'userPage.dart';
// import 'package:image_picker/image_picker.dart';

class PostPage extends StatelessWidget {
  // late File file;

  // handleImageCapture(context) async {
  //   Navigator.pop(context);
  //   XFile? file = await ImagePicker().pickImage(source: ImageSource.camera);
  // }

  // handleChooseImage(context) async {
  //   Navigator.pop(context);
  //   XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
  // }

  // selectImage(parentcontext) {
  //   // return showDialog(
  //   //     context: parentcontext,
  //   //     builder: (context) {
  //   //       return SimpleDialog(
  //   //         title: const Text('create post'),
  //   //         children: [
  //   //           SimpleDialogOption(
  //   //             child: const Text('capture photo'),
  //   //             onPressed: () => handleImageCapture,
  //   //           ),
  //   //           SimpleDialogOption(
  //   //             child: const Text('choose from gallery'),
  //   //             onPressed: () => handleChooseImage,
  //   //           ),
  //   //           SimpleDialogOption(
  //   //             child: const Text('cancel'),
  //   //             onPressed: () => Navigator.pop(context),
  //   //           )
  //   //         ],
  //   //       );
  //   //     });
  // }

  @override
  Widget build(BuildContext context) {
    double cardheightwidth = 120.0;
    double iconsize = 60.0;

    int currentIndex = 2;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back, color: Colors.white),
        //   // onPressed: () => null,
        // ),
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
                        // onTap: () =>null,
                        child: SizedBox(
                          height: cardheightwidth,
                          width: cardheightwidth,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            elevation: 20,
                            child: Center(
                              child: Icon(
                                Icons.image_outlined,
                                size: iconsize,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        // onTap: () => selectImage(context),
                        child: SizedBox(
                          height: cardheightwidth,
                          width: cardheightwidth,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            elevation: 20,
                            child: Center(
                              child: Icon(
                                Icons.image_outlined,
                                size: iconsize,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        // onTap: () => selectImage(context),
                        child: SizedBox(
                          height: cardheightwidth,
                          width: cardheightwidth,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            elevation: 20,
                            child: Center(
                              child: Icon(
                                Icons.image_outlined,
                                size: iconsize,
                              ),
                            ),
                          ),
                        ),
                      ),
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
              const ElevatedButton(
                onPressed: null,
                child: Text('Use Current Location'),
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
