import 'package:english_words/english_words.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
final _randomwordpairs = <WordPair>[];
final _saveWordPair = Set<WordPair> ();
Widget _buildList() {
  return ListView.builder(
    padding: EdgeInsets.all(8),
    itemBuilder: (context, item) {
      if (item.isOdd) return Divider();
    final index = item ~/ 2;
    if (index >= _randomwordpairs.length){
      _randomwordpairs.addAll(generateWordPairs().take(10));

    }
    return _buildRow(_randomwordpairs[index]);
    },
  );
}
 Widget _buildRow(WordPair pair){
  final alreadSaved =_saveWordPair.contains(pair);
  return ListTile(title: Text(pair.asPascalCase,style: TextStyle(fontSize: 18),),
  trailing: Icon(alreadSaved ? Icons.favorite : Icons.favorite_border,color: alreadSaved ? Colors.red : null),
  onTap: () {
    setState(() {
      if(alreadSaved){
        _saveWordPair.remove(pair);
      }else{
        _saveWordPair.add(pair);
      }
    });
  },
  
  );

 }
void _pushSaved(){
  Navigator.of(context).push(
    MaterialPageRoute(builder: (BuildContext context) {
    final Iterable<ListTile> tiles =
    _saveWordPair.map((WordPair pair) {
return ListTile(
  title: Text(pair.asCamelCase,style: TextStyle(fontSize: 18),),
);
    });
      final List<Widget> divided = ListTile.divideTiles(
        context: context,
        tiles: tiles).toList();
        return Scaffold(
          appBar: AppBar(title: Text('word pair')),
          body: ListView(children: divided,),
        );
  
    }
    )
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("WorkPair"),
      actions: <Widget>   [
    IconButton( icon: Icon(Icons.list ) , onPressed: _pushSaved)      ],
      
      ),
      body: _buildList(),
    );
  }
}
