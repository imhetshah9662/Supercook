import 'package:flutter/material.dart';
import 'package:meals_app/Location.dart';
import '/dummy_data.dart';
import './payment_screen.dart';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MealDetailScreen extends StatelessWidget{
  static const routeName = '/meal-detail';
  final Function toggleFavorite;
  final Function isFavorite;

  @override

  void Nothing(BuildContext ctx){
    Navigator.of(ctx).pushNamed(payment_screen.routename,);
  }
  void location(BuildContext ctx){
    Navigator.of(ctx).pushNamed(LocationScreen.routeName,);
  }
  MealDetailScreen(this.toggleFavorite,this.isFavorite);
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(title: Text('$mealId'),
      actions: <Widget>[
        IconButton(onPressed: () => Nothing(context), icon: Icon(Icons.shopping_cart,color: Colors.redAccent,)),
        IconButton(onPressed: () => location(context),icon: Icon(Icons.location_pin,color: Colors.blueAccent,)),
      ],
      ),
      body: SingleChildScrollView(
    child: Column(
        children: <Widget>[
          Container(height: 300,width:double.infinity,
          child: Image.network(selectedMeal.imageUrl,
          fit: BoxFit.cover,),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10,),
            child: Text('ingredients',
            style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          //we can also create Widget buildSectionTitle(String text,BuildContext context){return container}
          //we can pass by buildSectionTitle(context,'steps');
          Container(
            height: 150,
            width: 300,
            decoration: BoxDecoration(color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),),
            child: ListView.builder(itemBuilder: (ctx,index) => Card(color: Theme.of(context).primaryColor,
                                                               child:Padding(padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10)  ,
                                                                 child: Text(selectedMeal.ingredients[index],),
            ),),
              itemCount: selectedMeal.ingredients.length,
          )
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10,),
            child: Text('Steps',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Container(
              height: 150,
              width: 300,
              decoration: BoxDecoration(color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),),
              child: ListView.builder(itemBuilder: (ctx,index) => Column(children:<Widget>[ ListTile(
                leading: CircleAvatar(
                  child: Text('# ${(index + 1)}'),
                ),
                title: Text(selectedMeal.steps[index]),
              ),
              Divider(),
              ],),
                itemCount: selectedMeal.steps.length,
              )
          ),
        ],
      )
      ),
      floatingActionButton: FloatingActionButton(
           child: Icon(isFavorite(mealId) ? Icons.star : Icons.star_border,),
           onPressed: () => toggleFavorite(mealId),
      ),
    );
  }
}