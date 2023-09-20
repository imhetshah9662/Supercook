import 'package:flutter/material.dart';
import 'Category_meals_Screen.dart';


class CategoryItem extends StatelessWidget{
  @override
  final String id;
  final String title;
  final Color color;
  CategoryItem(this.id,this.title,this.color);

  void selectCategory(BuildContext ctx)
  {
    Navigator.of(ctx).pushNamed(
      CatagoryMealsScreen.routeName, arguments: {'id': id,'title': title,}
    );
  }

  Widget build(BuildContext context){
    return InkWell(
      onTap: ()  => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.all(15),
          child: Text(title,style: Theme.of(context).textTheme.titleLarge,),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors:<Color>[
              color.withOpacity(0.2),
              Colors.orange,
              Color(0xffac255e),
              Color(0xffca485c),
              Color(0xffe16b5c),
              Color(0xfff39060),
              Color(0xffffb56b),
              Colors.orange,
              Colors.pinkAccent,
            ],
              //[color.withOpacity(0.7),
             // color],

              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        );



  }

}