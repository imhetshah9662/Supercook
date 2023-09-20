import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import './tabs_screen.dart';
import 'package:redirect_icon/redirect_icon.dart';

class Login_screen extends StatelessWidget {
  static const routename = '/login_screen';
  final Emailinput = TextEditingController();
  final Passwordinput = TextEditingController();



  void LoginVar(BuildContext ctx) {
    if (Emailinput.text == "naneradalsukh@gmail.com" &&
        Passwordinput.text == "flutter" ||
        Emailinput.text == "hetshah@gmail.com" &&
        Passwordinput.text == "flutter" ||
        Emailinput.text == "dummy@gmail.com" && Passwordinput.text == "flutter"

    ) {
      Navigator.of(ctx).pushReplacementNamed(TabsScreen.routename);
    } else {
      Navigator.of(ctx).pushReplacementNamed('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text('SuperCook'),
      ),
      body: Column(
        children: <Widget>[
        // Container(
        //height: 200,
       // width: double.infinity,
       // decoration: const BoxDecoration(
         // image: DecorationImage(
            //  image: AssetImage("assets/image/image.jpeg"),
            //  fit: BoxFit.cover),
       // ),
       //  ),
          SizedBox(height: 10,),
          Image.asset('assets/image/main.jpg'),
          SizedBox(height:25,),
          Card(
          child: Center(
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              TextField(
                decoration: InputDecoration(labelText: ' Email Id'),
                controller: Emailinput,
                keyboardType: TextInputType.name,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'password'),
                controller: Passwordinput,
                keyboardType: TextInputType.name,
              ),
              SizedBox(height: 10),
              Center(
                  child:ElevatedButton(
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.pinkAccent)),
                onPressed: (() => LoginVar(context)),
                child: Text('login',),
                  ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "only authenticated people can login",
                    textAlign: TextAlign.center,
                  )),
            SizedBox(height: 10,),

              Center(
              child: RedirectSocialIcon(
                url: "https://www.linkedin.com/in/het-shah-a79b57258/",
                icon: Icons.add_link,
                radius: 25,
                size: 30,
                iconColor: Colors.amber,
                circleAvatarColor: Colors.yellowAccent,
              ),
              ),
              Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Connect With Me",
                    textAlign: TextAlign.center,
                  )),
            ]),
          )),
      ),
    ],
    ),

    );
  }
}