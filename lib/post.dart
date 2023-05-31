// import 'Category.dart';
// class Post{
//   String place;
//   List cid;
//   String imageURL;
//   Category cat;
//   List comments;
//   int likes;
//   String Recommendation;
//   int noComments;
//   Post({required this.place,required this.cid,required this.imageURL,required this.cat, required this.comments, required this.likes,
//    required this.Recommendation,required this.noComments});

//   get categoryID => null;
// }
import 'Category.dart';

class Post {
  String title;
  String location;
  int cid;
  var imageURL;
  // Category cat;
  List comments;
  int likes;
  String description;
  int noComments;
  int noDislikes;
  String pid;
  String uid;
  int rating;
  Post(
      {required this.title,
      required this.location,
      required this.cid,
      required this.imageURL,
      // required this.cat,
      required this.comments,
      required this.likes,
      required this.description,
      required this.noComments,
      required this.noDislikes,
      required this.pid,
      required this.uid,
      required this.rating});

  get categoryID => null;
}
