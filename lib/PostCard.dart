import 'package:flutter/material.dart';
import 'Category.dart';
import 'post.dart';
//Class Category needs to be implemented ABDO


class PostCard extends StatelessWidget {
  // Category rec;
Post post;
  PostCard({required this.post});

  checkPostDetails(BuildContext myContext){
    Navigator.of(myContext).pushNamed('/PostDetailsRoute', arguments: {'Post': post});}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => checkPostDetails(context),

      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4, 
        margin: EdgeInsets.all(10),
        child: Column(children: [
          Stack(children:[
            ClipRRect(borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), 
              topRight: Radius.circular(15)),
            child: Image.network(post.imageURL, //CATEGORY ATTRIBUTES
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,)),

            Positioned.fill(child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), 
                topRight: Radius.circular(15)),
              child: Container(
                color: Colors.black38,
                child: Center(child: Text(post.place, //CATEGORY ATTRIBUTES
                  softWrap: true,
                  overflow: TextOverflow.fade,
                  style: TextStyle(color: Colors.white, fontSize: 30),
                textAlign: TextAlign.center,),),
              ),),),
          ],),
          Container(
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:[
                Row(children:[Icon(Icons.thumb_up ), Text(("${post.likes}"))]), // NO 1, Rating 
                 Row(children:[Icon(Icons.comment), Text(("${post.noComments}"))]), //NO 2, Comment section 
                // Row(children: [Icon(Icons.verified), Text(rec.isVegetarian ? 'Vegetarian' : 'Non-Vegetarian')]) //NO 3, ???
              ]
            ))
          ]),
          ),);
  }
  
  String getDifficulty(int difficulty) {
    if (difficulty == 1) return 'Easy';
    else if (difficulty == 2) return 'Medium';
    else return 'Hard';
  }
}