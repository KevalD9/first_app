import 'package:flutter/material.dart';
import 'package:firstapp/screens.dart' show CreateNote;
//import 'package:cloud_firestore/cloud_firestore.dart';

class NoteScreen extends StatefulWidget {
  static String id = 'note_screen';

  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {

  //final _firestore = Firestore.instance;

  @override
  Widget build(BuildContext context) {

    //notesStream();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('NoteIt',style: TextStyle(color: Colors.orangeAccent),),
          leading: Icon(
            Icons.account_circle,
            color: Colors.orangeAccent,
          ),
          actions: <Widget>[
            FlatButton(
              child: Icon(
                Icons.settings, color: Colors.orangeAccent
              ),
              onPressed: (){
                print('setings pressed');
              },
            ),
          ],
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('Add Note Pressed');
            Navigator.pushNamed(context, CreateNote.id);
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.orangeAccent,
        ),

        body: SafeArea(
          child: Text('Hello'),
        ),
      ),
    );
  }

//  void notesStream() async {
//    await for (var snapshot in _firestore.collection('users').snapshots()) {
//      for (var note in snapshot.documents) {
//        print(note.data);
//      }
//    }
//  }
}
