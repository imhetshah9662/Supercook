

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'payment_screen.dart';





class LocationScreen extends StatefulWidget {
  static const routeName = '/Location_screen';



  @override
  State<LocationScreen> createState() => LocationScreenState();
}

class  LocationScreenState extends State<LocationScreen> {

  final Sourceinput = TextEditingController();
  final Destinationinput = TextEditingController();

  void setpay(BuildContext ctx){
      Navigator.of(ctx).pushNamed(payment_screen.routename,);
    }
    void SaveAddress(){
    print("Your Address is saved");
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter Your location!"),
      ),
      body:
           Card(
          child: Container(
            margin: EdgeInsets.all(10),
            child:
            Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              TextField(
                decoration: InputDecoration(labelText: '*Enter Flat/Building No*'),
                controller: Sourceinput,
                keyboardType: TextInputType.number,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Area Name'),
                controller: Destinationinput,
                keyboardType: TextInputType.name,
              ),
              SizedBox(height: 10),
              Row(crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                SizedBox(height: 10,),
                ElevatedButton(
                onPressed: SaveAddress,
                child: Text('Save Address'),
              ),
                SizedBox(height: 10,),
              ElevatedButton(onPressed: () => setpay(context), child: Text('Make Payment')
              ),
             ]),
            ]),
          )),
    );
  }
}