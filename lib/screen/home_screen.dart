import 'package:a14_sqflite/database/database_helper.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Student Database'),
      ),
      body: FutureBuilder<List<Map>>(
          future: DatabaseHelper().getAllStudents(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data.toString());
            } else if (snapshot.hasError) {
              return Text(snapshot.data.toString());
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          DatabaseHelper databaseHelper = DatabaseHelper();
          var result = await databaseHelper.insertStudent({
            'name': 'U Min',
            'address': 'MDY',
            'phone': '091234567',
            'email': 'min@gmail.com'
          });
          print(result);
        },
      ),
    );
  }
}
