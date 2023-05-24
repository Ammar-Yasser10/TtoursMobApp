import 'Category.dart';

class Post {
  String title;
  String location;
  List cid;
  String imageURL;
  Category cat;
  List comments;
  int likes;
  String description;
  int noComments;
  int noDislikes;
  Post(
      {required this.title,
      required this.location,
      required this.cid,
      required this.imageURL,
      required this.cat,
      required this.comments,
      required this.likes,
      required this.description,
      required this.noComments,
      required this.noDislikes});

  get categoryID => null;
}
