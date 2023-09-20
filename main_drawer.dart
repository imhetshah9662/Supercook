import 'package:flutter/material.dart';
import 'package:meals_app/tabs_screen.dart';
import '/filters_screen.dart';

class MainDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text('Cooking Up',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 30,color: Theme.of(context).primaryColor),
          ),
          ),
          SizedBox(height: 20,),
          ListTile(
            leading: Icon(Icons.restaurant,
            size: 26,),
            title: Text('Meals',style: TextStyle(fontFamily: 'RobotoCondensed',fontSize: 24,fontWeight: FontWeight.w700,
            ),
            ),
            onTap: ()
            {
              Navigator.of(context).pushReplacementNamed(TabsScreen.routename);
            },
            ),
          ListTile(
            leading: Icon(Icons.settings,
              size: 26,),
            title: Text('Filters',style: TextStyle(fontFamily: 'RobotoCondensed',fontSize: 24,fontWeight: FontWeight.w700,
            ),
            ),
            onTap: ()
            {
              Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}