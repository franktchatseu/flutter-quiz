import 'package:flutter/material.dart';
import 'package:flutterapplication/gallery-detail.dart';
import './quiz.dart';

class Gallery extends StatefulWidget {
  //stockage de la ville
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  String keyword = "";

  TextEditingController textEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery',style: TextStyle(fontSize: 20,backgroundColor: Colors.blue),),
      ),
      body:Column(
        children: [
          Container(
            child: TextField(
              decoration: InputDecoration(hintText: "enter the name of city"),
              style: TextStyle(fontSize: 22),
              controller: textEditingController,
              onChanged: (value){
                setState(() {
                  this.keyword = value;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(child: RaisedButton(
              child: Text("Get Images",style: TextStyle(fontSize: 22,color: Colors.white),),
              color: Colors.blue,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>GalleryDetail(this.keyword)));
              },
            ),
            width: double.infinity,),
          ),
        ],
      )
    );
  }
}
