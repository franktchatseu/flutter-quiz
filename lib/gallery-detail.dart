import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class GalleryDetail extends StatefulWidget {
  String city;
  GalleryDetail(this.city);
  @override
  _GalleryDetailState createState() => _GalleryDetailState();
}

class _GalleryDetailState extends State<GalleryDetail> {
  var imagesData;
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
        title: Text("images of ${widget.city}"),
      ),
      body: (this.imagesData == null?Center(child: CircularProgressIndicator())
          :ListView.builder(
          itemCount: this.imagesData == null? 0: this.imagesData.length,
          itemBuilder: (context,index){
              return Column(
                children: [
                Container(
                width: double.infinity,
                child: Card(
                  color: Colors.blue,
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text(this.imagesData[index]["tags"],style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),))
                  ),
                ),
              ),
                  Container(
                    child: Card(
                      color: Colors.red,
                      child: Image.network(this.imagesData[index]["webformatURL"]),
                    ),
                  ),
                  Divider(
                    color: Colors.deepOrangeAccent,
                  )
                ],
              );

          }
        )
      )
    );
  }

  getData(city){
    String url ="https://pixabay.com/api/?key=18183860-1983a89c724eae08522fd2668&q=${city}&page=1&per_page=4";
    http.get(url).then((resp){
      setState(() {
        var parseDate = json.decode(resp.body);
        this.imagesData = parseDate['hits'];
        print(imagesData);
      });
    }).catchError((error){

    });
  }
}
