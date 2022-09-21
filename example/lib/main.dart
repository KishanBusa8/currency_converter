import 'package:currency_converter/Currency.dart';
import 'package:currency_converter/currency_converter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //def variable
  String? usdToInr;

  @override
  void initState() {
    super.initState();
// add in initState
    convert();
  }

// call function to convert
  void convert() async {
    var usdConvert = await CurrencyConverter.convert(
        from: Currency.usd, to: Currency.inr, amount: 1);
    setState(() {
      usdToInr = usdConvert.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Money Convertor Example'),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "1 USD = ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    Text(
                      "$usdToInr ${Currency.inr.toUpperCase()}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.green),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
