import 'package:flutter/cupertino.dart';

class Note {
  final String id;
  final String title;
  final String name;
  final DateTime date;

  Note(
      {@required this.id,
      @required this.date,
      @required this.title,
      @required this.name});
}
