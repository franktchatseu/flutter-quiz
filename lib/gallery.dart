import 'package:flutter/material.dart';
import './quiz.dart';

class Gallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery',style: TextStyle(fontSize: 20,backgroundColor: Colors.blue),),
      ),
      body: Center(
        child: Text('MA gallery',style: TextStyle(fontSize: 22),),
      ),
    );
  }
}
