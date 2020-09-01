import 'package:flutter/material.dart';
import 'package:flutterapplication/gallery.dart';
import 'package:flutterapplication/quiz.dart';
import 'package:flutterapplication/weather.dart';
class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.orange,Colors.white
                    ]
                )
            ),
            child: Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('images/logo.png'),
                radius: 40,
              ),
            ),
          ),
          ListTile(
            title: Text('Quiz',style: TextStyle(fontSize:22,color: Colors.lightBlue),),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.push(context,MaterialPageRoute(builder: (context)=>Quiz()));
            },
          ),
          Divider(color: Colors.green,),
          ListTile(
            title: Text('Weather',style: TextStyle(fontSize:22,color: Colors.lightBlue),),
            subtitle: Text('la meteo'),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Weather()));
            },
          ),
          Divider(color: Colors.green,),
          ListTile(
            title: Text('Gallery',style: TextStyle(fontSize:22,color: Colors.lightBlue),),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Gallery()));
            },
          ),
        ],
      ),
    );
  }
}
