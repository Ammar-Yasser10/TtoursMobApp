import 'package:flutter/material.dart';
import 'PostCard.dart';
import 'Category.dart';
import 'postList.dart';
class FeedPage extends StatelessWidget {
  //Category category;
  //KitchenScreen({required this.category});

  //Implementation of this page needs to be changed to fit the database 

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String, Category>;
    final category = routeArgs['category'];

    final postsInThatCategory = postlist.where((element) { //needs to be implemeetd in the post class or database
      return element.cid.contains(category!.id);}).toList();

    return Scaffold(
      appBar: AppBar(title: Text(category!.title),),
      body: ListView.builder(
      itemBuilder: (ctx, index) {return PostCard(post: postsInThatCategory[index]);
      },itemCount: postsInThatCategory.length,
      scrollDirection: Axis.vertical,),);
  }
}