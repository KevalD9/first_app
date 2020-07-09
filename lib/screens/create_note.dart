import 'package:flutter/cupertino.dart';
import 'notes_screen.dart';
import 'package:flutter/material.dart';

class CreateNote extends StatefulWidget {
  static String id = 'create_note';

  @override
  _CreateNoteState createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {

  TextEditingController _noteController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: FlatButton(
            child: Icon(
                Icons.arrow_back_ios,
                size: 25.0,
                color: Colors.orangeAccent,
            ),
            onPressed: (){
              print('Back-Pressed');
              Navigator.of(context).pop();
            },
          ),
          actions: <Widget>[
            FlatButton(
              child: Icon(
                Icons.check,
                size: 35.0,
                color: Colors.orangeAccent,
              ),
              onPressed: () {
                print('Save-Pressed');
              },
            ),
          ],
          title: Text(
            'Notes',
            style: TextStyle(
                color: Colors.orangeAccent,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.black,
            child: Hero(
              tag: 'NoteTap',
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    buildBody(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBody(){
    return Material(
      color: Colors.black,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0,top: 10.0),
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              maxLines: null,
              controller: _noteController,
              cursorColor: Colors.orangeAccent,
              autofocus: true,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
