import 'package:a14_sqflite/database/database_helper.dart';
import 'package:a14_sqflite/model/student.dart';
import 'package:flutter/material.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({Key? key}) : super(key: key);

  @override
  _AddStudentState createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  final _formKey = GlobalKey<FormState>();
  String? name, address, phone, email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Student(sqflite'),
      ),
      body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter your name';
                      }
                    },
                    onSaved: (val) {
                      name = val;
                    },
                    decoration: InputDecoration(
                        labelText: "Name",
                        hintText: "Enter your name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter your address';
                      }
                    },
                    onSaved: (val) {
                      address = val;
                    },
                    decoration: InputDecoration(
                        labelText: "Address",
                        hintText: "Enter your address",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter your phone';
                      }
                    },
                    onSaved: (val) {
                      phone = val;
                    },
                    decoration: InputDecoration(
                        labelText: "Phone",
                        hintText: "Enter your phone",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter your email';
                      }
                    },
                    onSaved: (val) {
                      email = val;
                    },
                    decoration: InputDecoration(
                        labelText: "Email",
                        hintText: "Enter your email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12))),
                  ),
                ),
                ElevatedButton.icon(
                    onPressed: () async {
                      if (_formKey.currentState == null ||
                          _formKey.currentState!.validate()) {
                        _formKey.currentState?.save();
                        int resultId = await DatabaseHelper().insertStudent(
                            Student.insertStudent(
                                name: name ?? '',
                                address: address ?? '',
                                phone: phone ?? '',
                                email: email ?? '')
                            // Student.insertStudent(name: name!, address: address!, phone: phone!, email: email!)
                            // _CastError (Null check operator used on a null value)
                            );
                        print(resultId);
                        Navigator.pop(context, 'success');
                      }
                    },
                    icon: Icon(Icons.save),
                    label: Text('Save')),
              ],
            ),
          )),
    );
  }
}
