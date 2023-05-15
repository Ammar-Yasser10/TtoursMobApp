//import 'package:elmatbakh/categoryCard.dart';
import 'package:flutter/material.dart';
import 'CategoryCard.dart';
import 'catlist.dart';
import 'Category.dart';
import 'PostPage.dart';
import 'loginpage.dart';

class CategoryGrid extends StatelessWidget {

@override
Widget build(BuildContext context){
  return Scaffold(
appBar: AppBar(title: Text('Choose your Category'),),
body: 
GridView.count(crossAxisCount: 2, crossAxisSpacing: 40,
children:
categoriesList.map(
  (c){return CategoryCard(cat:c);}).toList(),),
 );
}}