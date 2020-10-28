import 'package:flutter/material.dart';
import 'package:rememder/models/note.dart';
import 'package:intl/intl.dart';
import 'package:rememder/widgets/new_note.dart';
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
  List<Note> _notes = [
    Note(id: '1', date: DateTime.utc(2020, 11, 1), title: 'One', name: 'Name1'),
    Note(
        id: '2', date: DateTime.utc(2020, 10, 28), title: 'Two', name: 'Name2'),
    Note(
        id: '3', date: DateTime.utc(2020, 05, 15), title: 'Two', name: 'Name3'),
  ];
  List<Note> _note() {
    _notes.sort((a, b) => some(a.date).compareTo(some(b.date)));
    return _notes;
  }

  void _addNewTransaction(String txTitle, String name, DateTime chosenDate) {
    final newTx = Note(
      title: txTitle,
      name: name,
      date: chosenDate,
      id: DateTime.now().toString(),
    );
    setState(() {
      _notes.add(newTx);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _notes.removeWhere((tx) => tx.id == id);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  int some(date) {
    int month = date.month - DateTime.now().month;
    int day = date.day - DateTime.now().day + month * 30;
    if (day < 0) {
      day += 356;
    }
    return day;
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
          while (_note().length > index) {
            return _buildRow(index);
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }

  Widget _buildRow(element) {
    return Container(
      transform: Matrix4.rotationZ(0.01),
      decoration: BoxDecoration(
        color: (() {
          if (_notes[element].date.difference(DateTime.now()).inDays <= 1 &&
              _notes[element].date.difference(DateTime.now()).inDays >= 0) {
            return Colors.red[200];
          } else if (_notes[element].date.difference(DateTime.now()).inDays <=
                  30 &&
              _notes[element].date.difference(DateTime.now()).inDays > 1) {
            return Colors.yellow[200];
          } else {
            return Colors.green[200];
          }
        }()),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(_notes[element].name),
            margin: EdgeInsets.all(20),
          ),
          Text(_notes[element].title),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: Text(
              rusDate(
                DateFormat.yMMMd().format(_notes[element].date),
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.delete,
              color: Theme.of(context).errorColor,
            ),
            onPressed: () => _deleteTransaction(_notes[element].id),
          ),
        ],
      ),
    );
  }
}
