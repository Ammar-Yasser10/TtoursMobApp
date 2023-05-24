import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'Category.dart';
import 'post.dart';
//Class Category needs to be implemented ABDO

class PostCard extends StatelessWidget {
  // Category rec;
  Post post;
  PostCard({required this.post});

  checkPostDetails(BuildContext myContext) {
    Navigator.of(myContext)
        .pushNamed('/PostDetailsRoute', arguments: {'Post': post});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => checkPostDetails(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(children: [
          // Stack(
          //   children: [
          //     ClipRRect(
          //         child: Image.network(
          //       post.imageURL, //CATEGORY ATTRIBUTES
          //       height: 250,
          //       width: double.infinity,
          //       fit: BoxFit.cover,
          //     )),
          //     Positioned.fill(
          //       child: ClipRRect(
          //         child: Container(
          //           color: Colors.black38,
          //           child: Center(
          //             child: Text(
          //               post.title, //CATEGORY ATTRIBUTES
          //               softWrap: true,
          //               overflow: TextOverflow.fade,
          //               style: TextStyle(color: Colors.white, fontSize: 30),
          //               textAlign: TextAlign.center,
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          // Container(
          //     child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceAround,
          //         children: [
          //           Row(children: [
          //             Icon(Icons.thumb_up),
          //             Text(("${post.likes}"))
          //           ]), // NO 1, Rating
          //           Row(children: [
          //             Icon(Icons.comment),
          //             Text(("${post.noComments}"))
          //           ]), //NO 2, Comment section
          //           // Row(children: [Icon(Icons.verified), Text(rec.isVegetarian ? 'Vegetarian' : 'Non-Vegetarian')]) //NO 3, ???
          //         ]))

          Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  border: Border.symmetric(
                      vertical: BorderSide.none,
                      horizontal: BorderSide(
                          color: Color.fromARGB(255, 161, 248, 61),
                          width: 0.5)),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        (post.title),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 30),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      (post.location),
                      style: const TextStyle(color: Colors.black, fontSize: 10),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  ClipRRect(
                      child: Image.network(
                    post.imageURL, //CATEGORY ATTRIBUTES
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Row(children: [
                  LikeButton(
                    size: 30,
                    circleColor: const CircleColor(
                        start: Color(0xff00ddff), end: Color(0xff0099cc)),
                    bubblesColor: const BubblesColor(
                      dotPrimaryColor: Color(0xff33b5e5),
                      dotSecondaryColor: Color(0xff0099cc),
                    ),
                    likeBuilder: (bool isLiked) {
                      return Icon(
                        Icons.favorite,
                        color: isLiked ? Colors.red : Colors.grey,
                        size: 30,
                      );
                    },
                    likeCount: post.likes,
                  ),
                ]),
                Row(children: [
                  const Icon(
                    Icons.comment,
                    color: Colors.grey,
                  ),
                  Text(("${post.noComments}"))
                ]),
                Row(children: [
                  LikeButton(
                    size: 30,
                    circleColor: const CircleColor(
                        start: Color(0xff00ddff), end: Color(0xff0099cc)),
                    bubblesColor: const BubblesColor(
                      dotPrimaryColor: Color(0xff33b5e5),
                      dotSecondaryColor: Color(0xff0099cc),
                    ),
                    likeBuilder: (bool isLiked) {
                      return Icon(
                        Icons.thumb_down_alt_rounded,
                        color: isLiked ? Colors.black : Colors.grey,
                        size: 30,
                      );
                    },
                    likeCount: post.noDislikes,
                  ),
                ]),
              ]),
              SingleChildScrollView(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      (post.description),
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }

  String getDifficulty(int difficulty) {
    if (difficulty == 1) {
      return 'Easy';
    } else if (difficulty == 2) {
      return 'Medium';
    } else {
      return 'Hard';
    }
  }
}
