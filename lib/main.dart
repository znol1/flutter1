import 'package:flutter/material.dart';
import 'package:rememder/models/note.dart';
import 'package:intl/intl.dart';
import './functions/date.dart';

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
    Note(id: '2', date: DateTime.now(), title: 'Two', name: 'Name2'),
    Note(id: '2', date: DateTime.now(), title: 'Two', name: 'Name2'),
    Note(id: '2', date: DateTime.now(), title: 'Two', name: 'Name2'),
    Note(id: '2', date: DateTime.now(), title: 'Two', name: 'Name2'),
    Note(id: '2', date: DateTime.now(), title: 'Two', name: 'Name2'),
    Note(id: '2', date: DateTime.now(), title: 'Two', name: 'Name3'),
    Note(id: '2', date: DateTime.now(), title: 'Two', name: 'Name3'),
    Note(id: '2', date: DateTime.now(), title: 'Two', name: 'Name3'),
    Note(id: '2', date: DateTime.now(), title: 'Two', name: 'Name3'),
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
      body: ListView.builder(
        padding: EdgeInsets.all(20),
        itemBuilder: (context, item) {
          if (item.isOdd) return SizedBox(height: 5);

          final index = item ~/ 2;
          while (_notes.length > index) {
            return _buildRow(_notes[index]);
          }
        },
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
        gradient: (() {
          if (element.name == 'Name1') {
            return LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  const Color.fromRGBO(204, 43, 94, 100),
                  const Color.fromRGBO(117, 58, 136, 100)
                ]);
          } else if (element.name == 'Name2') {
            return LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  const Color.fromRGBO(252, 74, 26, 100),
                  const Color.fromRGBO(247, 183, 51, 100)
                ]);
          } else if (element.name == 'Name3') {
            return LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  const Color.fromRGBO(0, 201, 255, 100),
                  const Color.fromRGBO(146, 254, 157, 100)
                ]);
          }
        }()),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(element.name),
          Text(element.title),
          Text(rusDate(DateFormat.yMMMd().format(element.date)))
        ],
      ),
    );
  }
}
