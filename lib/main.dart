import 'package:flutter/material.dart';
import 'package:flutterapplication/main-drawer.dart';

//methode main
void main(){
  runApp(MaterialApp(home: App(),));
}



class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(title: Text('the app bar'),),
      body: Center(
        child: Text('the body'),
      ),
    );
  }
}


