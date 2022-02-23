import 'package:a14_sqflite/database/database_helper.dart';
import 'package:a14_sqflite/model/student.dart';
import 'package:a14_sqflite/screen/add_student.dart';
import 'package:a14_sqflite/screen/update_student.dart';
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
        actions: [
          IconButton(
              onPressed: () async {
                var popResult = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return AddStudent();
                }));
                if (popResult == "success") {
                  setState(() {});
                }
              },
              icon: Icon(Icons.add)),
          IconButton(
              onPressed: () {
                DatabaseHelper().deleteAll();
                setState(() {});
              },
              icon: Icon(Icons.delete))
        ],
        centerTitle: true,
        title: Text('Student DB(sqflite'),
      ),
      body: FutureBuilder<List<Map>>(
          future: DatabaseHelper().getAllStudents(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    Map? student = snapshot.data![index];
                    return Card(
                      child: Column(
                        children: [
                          CircleAvatar(
                            child: Text((index + 1).toString()),
                          ),
                          // CircleAvatar(child: Text(student["id"].toString())),
                          ListTile(
                            trailing: IconButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return UpdateScreen(
                                        student["id"],
                                        student["name"],
                                        student["address"],
                                        student["phone"],
                                        student["email"]);
                                  })).then((value) {
                                    if (value == "success") {
                                      setState(() {});
                                    }
                                  });
                                },
                                icon: Icon(Icons.edit)),
                            leading: Icon(Icons.person),
                            title: Text("Name"),
                            subtitle: Text(student["name"]),
                          ),
                          ListTile(
                            trailing: IconButton(
                                onPressed: () async {
                                  await DatabaseHelper()
                                      .deleteStudent(student["id"]);
                                  setState(() {});
                                },
                                icon: Icon(Icons.delete)),
                            leading: Icon(Icons.location_on_outlined),
                            title: Text("Address"),
                            subtitle: Text(student["address"]),
                          ),
                          ListTile(
                            leading: Icon(Icons.phone),
                            title: Text("phone"),
                            subtitle: Text(student["phone"]),
                          ),
                          ListTile(
                            leading: Icon(Icons.email),
                            title: Text("email"),
                            subtitle: Text(student["email"]),
                          ),
                        ],
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Snapshot has error'),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await DatabaseHelper().insertStudent(Student.insertStudent(
              name: "name",
              address: "address",
              phone: "phone",
              email: "email"));
          setState(() {});
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
