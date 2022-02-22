import 'package:a14_sqflite/database/database_helper.dart';
import 'package:a14_sqflite/screen/update_student.dart';
import 'package:flutter/material.dart';
import 'add_student.dart';

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
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      fullscreenDialog: true,
                      builder: (context) {
                        return AddStudent();
                      },
                    )).then((value) {
                  if (value == 'success') {
                    setState(() {});
                  }
                });
              },
              icon: Icon(Icons.add)),

          IconButton(onPressed: (){
            DatabaseHelper().delete();
            setState(() {
              
            });
          }, icon: Icon(Icons.delete_forever))
        ],
        centerTitle: true,
        title: Text('Student Database'),
      ),
      body: FutureBuilder<List<Map>>(
          future: DatabaseHelper().getAllStudents(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    Map? student = snapshot.data?[index];
                    return Card(
                      child: Column(
                        children: [
                          // Text(student?['id'].toString()),
                          CircleAvatar(child: Text((index + 1).toString())),
                          ListTile(
                            leading: Icon(Icons.person),
                            title: Text('Name'),
                            subtitle: Text(student?['name']),
                            trailing: IconButton(
                                onPressed: () async{
                                  var result = await Navigator.push(context,
                                      MaterialPageRoute(builder: ((context) {
                                    return UpdateStudent(
                                        id: student?["id"],
                                        name: student?["name"],
                                        address: student?["address"],
                                        phone: student?["phone"],
                                        email: student?["email"]);
                                  })));
                                  if(result == 'success'){
                                    setState(() {
                                      
                                    });
                                  }
                                },
                                icon: Icon(Icons.edit)),
                          ),
                          ListTile(
                            leading: Icon(Icons.location_city),
                            title: Text('Address'),
                            subtitle: Text(student?['address']),
                            trailing: IconButton(
                                onPressed: () {
                                  DatabaseHelper()
                                      .deleteStudent(student?["id"]);
                                  setState(() {
                                    
                                  });
                                },
                                icon: Icon(Icons.delete)),
                          ),
                          ListTile(
                            leading: Icon(Icons.phone),
                            title: Text('Phone'),
                            subtitle: Text(student?['phone']),
                          ),
                          ListTile(
                            leading: Icon(Icons.email),
                            title: Text('Email'),
                            subtitle: Text(student?['email']),
                          ),
                        ],
                      ),
                    );
                  });
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
            'name': 'MyoMinLatt',
            'address': 'YGN',
            'phone': '091234567',
            'email': 'myo@gmail.com'
          });
          print(result);
          setState(() {
            
          });
        },
      ),
    );
  }
}
