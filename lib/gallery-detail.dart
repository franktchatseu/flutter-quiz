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
  List<dynamic> imagesData = [];
  int current_page = 1;
  int per_page = 10;
  int total_page;
  ScrollController _scrollController = new ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData(widget.city);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (current_page < total_page) {
          ++current_page;
          this.getData(widget.city);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "images of ${widget.city}  page ${current_page}/${total_page}"),
        ),
        body: (this.imagesData == null
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                controller: this._scrollController,
                itemCount: this.imagesData == null ? 0 : this.imagesData.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        width: double.infinity,
                        child: Card(
                          color: Colors.blue,
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                  child: Text(
                                this.imagesData[index]["tags"],
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Card(
                            color: Colors.red,
                            child: Image.network(
                                this.imagesData[index]["webformatURL"]),
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.deepOrangeAccent,
                        height: 8,
                      )
                    ],
                  );
                })));
  }

  getData(city) {
    String url =
        "https://pixabay.com/api/?key=18183860-1983a89c724eae08522fd2668&q=${city}&page=${current_page}&per_page=${per_page}";
    http.get(url).then((resp) {
      setState(() {
        var parseData = json.decode(resp.body);
        this.imagesData.addAll(parseData['hits']);
        //recuperation du total de page
        if (parseData["totalHits"] % current_page == 0) {
          this.total_page = parseData["totalHits"] ~/ per_page;
        } else {
          this.total_page = 1 + (parseData["totalHits"] / per_page).floor();
        }
        print(imagesData);
      });
    }).catchError((error) {});
  }
}
