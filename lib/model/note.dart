import 'package:flutter/material.dart';
//import 'package:flutter/foundation.dart';
//import 'package:intl/intl.dart';

class Note {
  final String id;
  String title;
  String content;
  Color color;

  //NoteState state;
  final DateTime createdAt;
  DateTime modifiedAt;

  Note({
    this.id, this.title, this.content, this.color,
    //this.state,
    DateTime createdAt,
    DateTime modifiedAt,
  })  : this.createdAt = createdAt ?? DateTime.now(),
        this.modifiedAt = modifiedAt ?? DateTime.now();

  Map<String, dynamic> toJson() => {
    'title': title,
    'content': content,
    'color': color?.toString(),
    //'state': stateValue,
    'createdAt': (createdAt ?? DateTime.now()).toIso8601String(),
    'modifiedAt': (modifiedAt ?? DateTime.now()).toIso8601String(),
  };

}
