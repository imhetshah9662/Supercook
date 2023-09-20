import 'package:flutter/material.dart';
import '/Catagories_screen.dart';
import '/favoriteScreen.dart';
import '/main_drawer.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget{
  static const routename = '/tabs_screen';
  final List<Meal> favoriteMeals;
  TabsScreen(this.favoriteMeals);

  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2,  // we can use the bottomnavigationbar for this icons
        child: Scaffold(                      //unselectedcolor,selectedcolor,item,selectedfontsize
          appBar: AppBar(title: Text('Meals'), //type: BottomNavigationbar.shifting, use this functionality
            bottom: TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.category,),text: 'category',),  //bottomnavigatonbaritem for this tab
              Tab(icon: Icon(Icons.star),text: 'Favorites',),
            ],
          ),),
          drawer: MainDrawer(),
          body: TabBarView(
            children: <Widget>[
              CatagoriesScreen(),
              FavouriteScreen(widget.favoriteMeals),
            ],
          ),
        )
    );
  }
}