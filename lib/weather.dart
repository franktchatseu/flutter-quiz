import 'package:flutter/material.dart';
import './quiz.dart';

class Weather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather',style: TextStyle(fontSize: 20,backgroundColor: Colors.blue),),
      ),
      body: Center(
        child: Text('la meteo à votre disposition',style: TextStyle(fontSize: 22),),
      ),
    );
  }
}
