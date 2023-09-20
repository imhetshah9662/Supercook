import 'package:flutter/cupertino.dart';
import '../models/meal.dart';
import '/meal_item.dart';

class FavouriteScreen extends StatelessWidget{
  final List<Meal> favoriteMeals;
  FavouriteScreen(this.favoriteMeals);
  @override
  Widget build(BuildContext context){
    if(favoriteMeals.isEmpty) {
      return Center(child: Text('You Have No Favorite Yet - start adding someone'),);
    } else{
      return  ListView.builder(itemBuilder:  (ctx, index){
        return MealItem(id: favoriteMeals[index].id,
          title: favoriteMeals[index].title,
          imageUrl: favoriteMeals[index].imageUrl,
          duration: favoriteMeals[index].duration,
          affordability: favoriteMeals[index].affordability,
          complexity: favoriteMeals[index].complexity,

        );
      },
        itemCount: favoriteMeals.length,
      );
    }
  }
}