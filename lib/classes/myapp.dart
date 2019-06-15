import 'package:flutter/material.dart';
import 'package:bitcoin_tracker/classes/maindata.dart';
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: MainData(),
    );
  }
}