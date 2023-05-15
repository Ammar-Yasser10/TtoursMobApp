import 'package:flutter/material.dart';
import 'package:taswiha/registerpage.dart';
import 'Category.dart';
import 'FeedPage.dart';

class CategoryCard extends StatelessWidget {
Category cat;
CategoryCard({required this.cat});
navigateToFeedPage(BuildContext myContext){
Navigator.of(myContext).push(MaterialPageRoute(builder:(ctxDummy){return RegistrationPage();}));
}

@override
Widget build(BuildContext context){
return GestureDetector(
  onTap:() => {Navigator.of(context).pushNamed('MainMenu', 
				 arguments: {'category': cat})
},
  child: Container(
child: Column(
  children: [
    SizedBox(height: 20),
    Container(
      constraints: BoxConstraints(
        minHeight: 60,
        maxHeight: 135,
        minWidth: double.infinity,
        maxWidth: double.infinity,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          image: AssetImage('C:\Users\Abdo_\Documents\flutter_application_1\lib\screens\images\park.png'),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple.withOpacity(0.9),
            blurRadius: 0,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Center(
        child: Text(
          cat.title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
    ),
    SizedBox(height: 20),
  ],
)
  ),
);








}
/*GridView.count ( {Key? key,
Axis scrollDirection = Axis.vertical,
bool reverse = false,
ScrollController? controller, bool? primary,
ScrollPhysics? physics,
bool shrinkWrap = false,
EdgeInsetsGeometry? padding, required int crossAxisCount,
double mainAxisSpacing = 0.0,
double crossAxisSpacing = 0.0, 
double childAspectRatio = 1.0,
bool addAutomaticKeepAlives = true,
bool addRepaintBoundaries = true,
bool addSemanticIndexes = true,
double? cacheExtent,
List<Widget> children = const <Widget>[],
int? semanticChildCount,
DragStartBehavior dragStartBehavior = DragStartBehavior.start,

ScrollViewKeyboardDismissBehavior keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
String? restorationId,
Clip clipBehavior = Clip.hardEdge}
)
*/



}



