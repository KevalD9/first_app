import 'package:firstapp/screens/create_note.dart';
import 'package:firstapp/screens/notes_screen.dart';
import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/login_screen.dart';
import 'screens/notes_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() => runApp(NoteDown());

class NoteDown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id : (context) => WelcomeScreen(),
        RegistrationScreen.id : (context) => RegistrationScreen(),
        LoginScreen.id : (context) => LoginScreen(),
        NotesScreen.id : (context) => NotesScreen(),
        CreateNote.id : (context) => CreateNote(),
      },
    );
  }
}


//StreamBuilder(
//stream: FirebaseAuth.instance.onAuthStateChanged,
//builder: (BuildContext context, snapshot) {
//if (snapshot.connectionState == ConnectionState.waiting) {
//return Center(
//child: Text('Loading...'),
//);
//} else {
//if (snapshot.hasData) {
//return NotesScreen();
//} else {
//return WelcomeScreen();
//}
//}
//},
//),