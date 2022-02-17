// @14.8 SQLite Database (Student Database) [Part 1]
// @14.9 SQLite Database (Student Database) [Part 2]
// @14.10 SQLite Database (Student Database) [Part 3]


import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      home: MyApp(),
    )
  );
}
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sqflite Database'),
      ),
    );
  }
}

