import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_3d/the_third.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
 
    
    return Scaffold(
    appBar: AppBar(
    title: const Text('AppBar with hamburger button'),
  ),
  drawer:Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  image: AssetImage("images/1.jpeg"),
                     fit: BoxFit.cover)
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),


      backgroundColor: Color.fromARGB(255, 216, 207, 200),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              height: 12200,
              child: Column(
                children: [
                  Container(
                    child: Center(
                      child: Image(
                        height: 500,
                        image: AssetImage("images/0001.png"),
                      ),
                    ),
                  ),
               Padding(
                 padding: const EdgeInsets.all(12),
                 child: Text(textAlign:TextAlign.justify,"Lorem standard survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum"),
             
               ),
Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyWidget()),
            );
          },
          child: Text("data"),
        ),
      ),
    
             
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
