// @14.8 SQLite Database (Student Database) [Part 1]
// @14.9 SQLite Database (Student Database) [Part 2]
// @14.10 SQLite Database (Student Database) [Part 3]
// @14.11 SQLite Database (Student Database) [Part 4]
// @14.12 SQLite Database (Student Database) [Part 5]
// @14.13 SQLite Database (Student Database) [Part 6]
// @14.14 SQLite Database (Student Database) [Part 7]/ Student Form
// @14.15 SQLite Database (Student Database) [Part 8]/ add
// @14.16 SQLite Database (Student Database) [Part 9]/ edit



import 'package:a14_sqflite/screen/home_screen.dart';
import 'package:flutter/material.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized(); // need to search
  runApp(
    MyApp()
  );
}
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

