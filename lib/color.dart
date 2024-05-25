import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Mycolor extends StatefulWidget {
  const Mycolor({super.key});

  @override
  State<Mycolor> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Mycolor> {
  final Map<String, Color> colors = {
    'purple': Colors.purple,
    'red': Colors.red,
    'black': Colors.black,
    'yellow': Colors.yellow,
    'teal': Colors.teal,
    'orange': Colors.orange,
  };

  Color? selectedColor;

  void initState(){
  _getStoreColor();
  super.initState();
  }


void _getStoreColor ()async{
  SharedPreferences prefs =await SharedPreferences.getInstance();
  String? colorName =prefs.getString('color');
  setState(() {
    selectedColor = colors[colorName];
  });
}



void _setColor(String colorName, Color color) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(colorName, color.toString()); // Assuming colorName is a string key
  setState(() {
    selectedColor = color;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select a Color"),
      backgroundColor: selectedColor ?? Colors.black12,
      
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (var entry in colors.entries)
            Container(
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: entry.value,
                  minimumSize: Size(300, 60),
                ),
                child: Text(entry.key, style: TextStyle(color: Colors.white)),
                onPressed: () => _setColor( entry.key,entry.value),
              ),
            ),
        ],
      ),
    );
  }
}
