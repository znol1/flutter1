import 'package:flutter/material.dart';
import 'package:rememder/models/note.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Напоминалка'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final List<Note> _notes = [
    Note(id: '1', date: DateTime.now(), title: 'One', name: 'Name1'),
    Note(id: '2', date: DateTime.now(), title: 'Two', name: 'Name2'),
  ];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        height: 500,
        child: ListView.builder(
          padding: EdgeInsets.all(20),
          itemBuilder: (context, item) {
            if (item.isOdd) return SizedBox(height: 10);

            final index = item ~/ 2;
            while (_notes.length > index) {
              return _buildRow(_notes[index]);
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildRow(element) {
    return Container(
      padding: EdgeInsets.all(30),
      transform: Matrix4.rotationZ(0.01),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.5,
          color: Color(0xFFFF000000),
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(element.name), Text(element.title)]),
    );
  }
}
