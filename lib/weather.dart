import 'package:flutter/material.dart';
import 'package:flutterapplication/weather-detail.dart';
import './quiz.dart';

class Weather extends StatefulWidget {
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  String city = "Weather";
  TextEditingController textEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(city,style: TextStyle(fontSize: 20,backgroundColor: Colors.blue),),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(hintText: 'entrer le nom de la ville'),
              style: TextStyle(fontSize: 22 ),
              controller: textEditingController,
              onChanged: (value){
                setState(() {
                  this.city = value;
                });
              },
              //permet de soumettre le formulaire en cliquant sur le button ok du telephone
              onSubmitted: (value){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>WeatherDetail(city)));
                textEditingController.text ="";
              },
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: double.infinity,
                child: RaisedButton(
                  color: Colors.deepOrangeAccent,
                  child: Text("Meteo",style: TextStyle(fontSize: 22,color: Colors.white),),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>WeatherDetail(city)));
                    textEditingController.text ="";
                  },
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}
