import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'create_note.dart';
import 'package:firstapp/constants.dart';
import 'package:firstapp/validation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

FirebaseUser loggedInUser;

class NotesScreen extends StatefulWidget {
  static String id = 'notes_screen';

  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = Firestore.instance;
  bool showSpinner = false;
  FirebaseUser user;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        setState(() {
          loggedInUser = user;
          //print(loggedInUser.email);
        });
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {

    notesStream();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                print('Sign Out');
                FirebaseAuth.instance.signOut();
              },
              child: Icon(
                Icons.exit_to_app,
                color: Colors.orangeAccent,
              ),
            ),
          ],
          leading: Icon(
            Icons.account_circle,
            color: Colors.orangeAccent,
          ),
          title: Row(
            children: <Widget>[
              Text(
                'Welcome',
                style: TextStyle(color: Colors.orangeAccent),
              ),
              SizedBox(
                width: 5.0,
              ),
              Text(
                loggedInUser.email.substring(0, 5) + "!",
                style: TextStyle(color: Colors.orangeAccent),
              ),
            ],
          ),
        ),
        //floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('Add Note Pressed');
            Navigator.pushNamed(context, CreateNote.id);
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.orangeAccent,
        ),

        body: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate([
                notesCard(context),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  void notesStream() async {
    await for (var snapshot in _firestore.collection('users').snapshots()) {
      for (var note in snapshot.documents) {
        print(note.data);
      }
    }
  }

  //  Widget notesCard(context) {
//    return Hero(
//      tag: 'NoteTap',
//      child: Card(
//        color: Colors.white12,
//        child: InkWell(
//          child: Padding(
//            padding: const EdgeInsets.all(8.0),
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: <Widget>[
//                Padding(
//                  padding: const EdgeInsets.all(8.0),
//                  child: Text(
//                    'Hello',
//                    style: TextStyle(
//                        color: Colors.white,
//                        fontSize: 30.0,
//                        fontWeight: FontWeight.bold),
//                  ),
//                ),
//                Padding(
//                  padding: const EdgeInsets.only(left: 8.0),
//                  child: Text(
//                    'There',
//                    style:
//                        TextStyle(color: Colors.white, fontSize: 15.0 ,fontWeight: FontWeight.w500),
//                  ),
//                ),
//              ],
//            ),
//          ),
//          onTap: (){
//            print('tapped');
//            Navigator.pushNamed(context, CreateNote.id);
//          },
//        ),
//      ),
//    );
//  }

  Widget notesCard(context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('users').snapshots(),
      builder:
          (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            {
              return new Text('Loading...');
            }
            break;
          default:
            final notes = snapshot.data.documents;
            List<ListTile> noteWidgets = [];
            for (var note in notes) {
              final noteTitle = note.data['title'];
              final noteBody = note.data['body'];

              final noteWidget = new ListTile(
                title: Text(
                  '$noteTitle',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  '$noteBody',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w400),
                ),
              );
              noteWidgets.add(noteWidget);
            }
            return GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemCount: notes.toList().length,
                padding: EdgeInsets.all(2.0),
                itemBuilder: (BuildContext context, int index){
                  return Card(
                    elevation: 0,
                    margin: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 5.0),
                    color: Colors.white12,
                    child: InkWell(
                      child: Column(
                        children: noteWidgets,
                      ),
                      onTap: (){
                        print('pressed');
                        Navigator.pushNamed(context, CreateNote.id);
                      },
                    ),
                  );
                });
        }
      },
    );
  }
}