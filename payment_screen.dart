import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pay/pay.dart';
import './defaultConfigPayJson.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'defaultConfigPayJson.dart' as payment_configurations;






class payment_screen extends StatefulWidget {
  static const routename = '/payment_screen';



  @override
  State<payment_screen> createState() => _payment_screenState();
}

class _payment_screenState extends State<payment_screen> {
  //final Future<defaultConfigPayJson> _googlePayConfigFuture;


  Pay _payClient;
  bool _hasApplePay = false;
  bool _hasGooglePay = false;


  int n = 0;

  Future <void> _checkIfApplePayInstalled() async {
    _hasApplePay = await _payClient.userCanPay(PayProvider.apple_pay);

    if (_hasApplePay) {
      setState(() {
        n = 1;
      });
      print('Apple Pay is available on this device!');
    } else {
      print('Apple Pay is not available on this device!');
    }
  }

  Future<void> _checkIfGooglePayInstalled() async {
    _hasGooglePay = await _payClient.userCanPay(PayProvider.google_pay);
    if (_hasGooglePay) {
      setState(() {
        n = 1;
      });
      print('Google Pay is available on this device!');
    } else {
      print('Google Pay is not available on this device!');
    }
  }


  final Cardinput = TextEditingController();
  final Nameinput = TextEditingController();
  final Amountinput = TextEditingController();
  final Coupeninput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("make your payment"),
      ),
      body: (n == 0)
          ? Card(
          child: Container(
            margin: EdgeInsets.all(10),
            child:
            Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              TextField(
                decoration: InputDecoration(labelText: 'GooglePay Number'),
                controller: Cardinput,
                keyboardType: TextInputType.number,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Name in Google Pay'),
                controller: Nameinput,
                keyboardType: TextInputType.name,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: Amountinput,
                keyboardType: TextInputType.number,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Discount Coupen'),
                controller: Coupeninput,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _checkIfGooglePayInstalled,
                child: Text('Make Payment'),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "ingrediants same as the required ingrediants for the recipy",
                    textAlign: TextAlign.center,
                  )),
            ]),
          ))
          : Center(
        child: Text("your googlepay number is incorrect"),
      ),
    );
  }


}
