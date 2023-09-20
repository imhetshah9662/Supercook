import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:meals_app/Location.dart';
import 'package:meals_app/filters_screen.dart';
import 'package:meals_app/loginscreen.dart';
import 'package:meals_app/payment_screen.dart';
import '/tabs_screen.dart';
import '/meal_detail_screen.dart';
import 'Catagories_screen.dart';
import 'Category_meals_Screen.dart';
import './dummy_data.dart';
import './models/meal.dart';
import './payment_screen.dart';




void main()
{
  runApp(MyApp());
}
//void main() =>runApp(MyApp());


class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
  }

  class MyAppState extends State<MyApp> {
  Map<String,bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData){
        setState(() {
          _filters = filterData;
          _availableMeals = DUMMY_MEALS.where((meal) {
            if(_filters['gluten'] && !meal.isGlutenFree){
              return false;
            }
            if(_filters['lactose'] && !meal.isLactoseFree){
              return false;
            }
            if(_filters['vegan'] && !meal.isVegan){
              return false;
            }
            if(_filters['vegetarian'] && !meal.isVegetarian){
              return false;
            }
            return true;
          }).toList();
        });
  }

  void _toggleFavorite(String mealId){
    final existingIndex = _favoriteMeals.indexWhere((meal) => meal.id == mealId );
    if(existingIndex >= 0){
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    }
    else{
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),);
      });
    }
  }

  bool _isMealFavorite(String id){
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SuperCook',
      theme: ThemeData(
          primarySwatch: Colors.amber,
          accentColor: Colors.black,
          fontFamily: 'Raleway',
          //this is theme for transaction data
      ),
      //home: CatagoriesScreen(),
          initialRoute: 'categories-screen',
         // '/', // default is '/'

      routes: {  //map
        '/': (ctx) => Login_screen(),
        TabsScreen.routename: (ctx) => TabsScreen(_favoriteMeals),
        CatagoryMealsScreen.routeName: (ctx) => CatagoryMealsScreen(_availableMeals),
        LocationScreen.routeName: (ctx) => LocationScreen(),
        payment_screen.routename: (ctx) => payment_screen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(_toggleFavorite,_isMealFavorite),
        FilterScreen.routeName: (ctx) => FilterScreen(_filters,_setFilters),
      },



    );
  }
}


