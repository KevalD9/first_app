import 'package:flutter/material.dart';

class NoteScreen extends StatefulWidget {
  static String id = 'note_screen';

  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('NoteIt'),
        ),
        body: SafeArea(
          child: Text('Hello'),
        ),
      ),
    );
  }
}
