import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:intl/intl.dart';
class WeatherDetail extends StatefulWidget {
  String city;
  WeatherDetail(this.city);

  @override
  _WeatherDetailState createState() => _WeatherDetailState();
}

class _WeatherDetailState extends State<WeatherDetail> {

  var weatherData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData(widget.city);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text("la météo de la ville:  ${widget.city}"),
      ),
      body: (weatherData == null?Center(
        child: CircularProgressIndicator(),
      ):
      ( weatherData == null || weatherData['list']==null) ?Center(
          child: Text('La ville est introuvable !!!',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.red),)
            )
          :ListView.builder(
            itemCount: weatherData == null || weatherData['list']==null ? 0 : weatherData['list'].length,
              itemBuilder: (context,index){
                return Card(
                  color: Colors.deepOrangeAccent,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage('images/${weatherData['list'][index]['weather'][0]['main'].toLowerCase()}.jpeg'),
                              radius: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                      children: [
                                      Text("${DateFormat('E-dd/mm/yyyy').format(DateTime.fromMicrosecondsSinceEpoch(weatherData['list'][index]['dt']*1000000)) }",style: TextStyle(fontSize: 22,color: Colors.white),),
                                      Text(" | ${weatherData['list'][index]['weather'][0]['main'].toLowerCase().toString()}",style: TextStyle(fontSize: 25,color: Colors.black45,fontWeight: FontWeight.bold,),),

                                    ],
                                  ),
                                  Text("${DateFormat('HH:mm').format(DateTime.fromMicrosecondsSinceEpoch(weatherData['list'][index]['dt']*1000000)) }",style: TextStyle(fontSize: 18,color: Colors.white),),

                                ],
                              ),
                            )
                          ],
                        ),
                        Text("${weatherData['list'][index]['main']['temp'].round()} C",style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                );
              })
      ));
  }

  //recuperation des donnnees de la meteo
  getData(city){
    String url ="http://api.openweathermap.org/data/2.5/forecast?q=${city}&appid=5332519fc155e6fae0d3c625a24a5b09";
    http.get(url).then((resp){
      setState(() {
        this.weatherData = json.decode(resp.body);
        print(weatherData);
      });
    }).catchError((error){
      print(error);
    });
  }
}
