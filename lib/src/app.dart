import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http show get;
import 'models/image_model.dart';
import 'widgets/image_list.dart';

class App extends StatefulWidget {
  @override
  AppState createState()  => AppState();
}

class AppState extends State<App> {

  int imageCount = 0;
  List<ImageModel> images = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ImageList(images),
        appBar: AppBar(
          title: Text("Let's See Some Images!"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _fetchImage,
          tooltip: 'Adds a new image to the list.',
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  void _fetchImage() async {
    imageCount++;
    var response = await http.get('https://jsonplaceholder.typicode.com/photos/$imageCount');
    var imageModel = ImageModel.fromJson(json.decode(response.body));
    setState(() {
      images.add(imageModel);
    });
  }

}