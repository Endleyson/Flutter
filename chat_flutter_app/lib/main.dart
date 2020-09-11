import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:chat/chat_screen.dart';
import 'package:flutter/widgets.dart';

void main() async {
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green[900],
          hintColor: Colors.green[700],
          iconTheme: IconThemeData(
          color:  Colors.green[800],
          )
      ),
      home: ChatScreen(),
    );
  }
}