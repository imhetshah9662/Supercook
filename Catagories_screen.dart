import 'package:flutter/material.dart';
import './Category_item.dart';
import './dummy_data.dart';
class CatagoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
  appBar:AppBar(title: Text('SuperCook'),),
    body:GridView(
      padding: EdgeInsets.all(15),
     children:
       DUMMY_CATEGORIES.map((catData) => CategoryItem(
               catData.id,
               catData.title,
               catData.color,

       )).toList(),


    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
    childAspectRatio: 3/2,
    crossAxisSpacing: 20,
    mainAxisSpacing: 20),
  )
  );

}
}