import 'package:a14_sqflite/model/student.dart';
import 'package:flutter/material.dart';

import '../database/database_helper.dart';

class UpdateScreen extends StatefulWidget {
  int id;
  String name;
  String address;
  String phone;
  String email;
  UpdateScreen(this.id, this.name, this.address, this.phone, this.email);

  @override
  _UpdateScreenState createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  int? id;
  String? name, address, phone, email;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    id = widget.id;
    name = widget.name;
    address = widget.address;
    phone = widget.phone;
    email = widget.email;
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Student"),
      ),
      body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    initialValue: name,
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
                    initialValue: address,
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
                    initialValue: phone,
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
                    initialValue: email,
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
                        int resultId = await DatabaseHelper().updateStudent(
                          Student.insertStudent(
                              name: name ?? '',
                              address: address ?? '',
                              phone: phone ?? '',
                              email: email ?? ''),
                          id!,
                          // Student.insertStudent(name: name!, address: address!, phone: phone!, email: email!)
                          // _CastError (Null check operator used on a null value)
                        );
                        print(resultId);
                        Navigator.pop(context, 'success');
                      }
                    },
                    icon: Icon(Icons.edit),
                    label: Text('Edit')),
              ],
            ),
          )),
    );
  }
}
