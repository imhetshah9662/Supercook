import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/main_drawer.dart';

class FilterScreen extends StatefulWidget{
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FilterScreen(this.currentFilters,this.saveFilters);
  @override
  FilterScreenState createState() => FilterScreenState();
}

class FilterScreenState extends State<FilterScreen> {
  bool glutenFree = false;
  bool vegetarian = false;
  bool vegan = false;
  bool lactoseFree = false;
  @override
  void initState() {
    // TODO: implement initState
    glutenFree = widget.currentFilters['gluten'];
    lactoseFree = widget.currentFilters['lactose'];
    vegetarian = widget.currentFilters['vegetarian'];
    vegan = widget.currentFilters['vegan'];
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Your Filters'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.save),
            onPressed: () {
          final  selectedFilters = {
            'gluten': glutenFree,
            'lactose': lactoseFree,
            'vegan': vegan,
            'vegetarian': vegetarian,
          };
              widget.saveFilters(selectedFilters);

  },


          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Adjust your meal Selection',),
          ),
          Expanded(child: ListView(
            children: <Widget>[
              SwitchListTile(title: Text('Gluten-Free'),
                value: glutenFree,
                subtitle: Text('only include gluten free meals'),
                onChanged: (newValue) {
                    setState(() {
                      glutenFree = newValue;
                    });
                },
              ),
              SwitchListTile(title: Text('Lactose-Free'),
                value: lactoseFree,
                subtitle: Text('only include Lactose free meals'),
                onChanged: (newValue) {
                  setState(() {
                    lactoseFree = newValue;
                  });
                },
              ),
              SwitchListTile(title: Text('Vegetarian'),
                value: vegetarian,
                subtitle: Text('only include vegetarian meals'),
                onChanged: (newValue) {
                  setState(() {
                    vegetarian = newValue;
                  });
                },
              ),
              SwitchListTile(title: Text('Vegan'),
                value: vegan,
                subtitle: Text('only include vegan meals'),
                onChanged: (newValue) {
                  setState(() {
                    vegan = newValue;
                  });
                },
              ),
            ],
          ),),
        ],
      ),
    );
  }
}