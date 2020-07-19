import 'package:firstapp/screens/note_screen.dart';
import 'package:flutter/material.dart';
import 'screens.dart';

void main() => runApp(NoteIt());

class NoteIt extends StatelessWidget {
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
        NoteScreen.id : (context) => NoteScreen(),
      },
    );
  }
}
