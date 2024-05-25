import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImagePage extends StatefulWidget {
  const ImagePage({Key? key}) : super(key: key);

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  final Map<String, String> images = {
    'images/1.jpg ': 'images/1.jpg',
    'images/0001.png': 'images/0001.png',
    'images/0002.png': 'images/0002.png',
    'images/0003.png': 'images/0003.png',
    'images/0004.png': 'images/0004.png',
    'images/0006.png': 'images/0006.png',
  };

  late String? selectedImage;

  @override
  void initState() {
    _getStoreImage();
    super.initState();
  }

  void _getStoreImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? imageName = prefs.getString('image');
    if (imageName != null && images.containsKey(imageName)) {
      setState(() {
        selectedImage = imageName;
      });
    }
  }

  void _setImage(String imageName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('image', imageName);
    setState(() {
      selectedImage = imageName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select image"),
        backgroundColor: Colors.blue, // Change to your desired color
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (var entry in images.entries)
            Container(
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
              child: ElevatedButton(
  style: ElevatedButton.styleFrom(
    minimumSize: Size(300, 60),
  ),
  onPressed: () => _setImage(entry.key),
  child: Container(
    width: 300,
    height: 60,
    child: Image.asset(
      entry.key.toString(), // Assuming entry.key is the image path
      fit: BoxFit.contain, // Adjust this property according to your need
    ),
  ),
),
 
            ),
        ],
      ),
    );
  }
}