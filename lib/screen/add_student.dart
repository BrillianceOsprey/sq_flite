import 'package:a14_sqflite/database/database_helper.dart';
import 'package:a14_sqflite/model/student.dart';
import 'package:flutter/material.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({Key? key}) : super(key: key);

  @override
  _AddStudentState createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    String? name, address, phone, email;
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Student'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (name) {
                    if (name == null || name.isEmpty) {
                      return 'Please enter your name';
                    }
                  },
                  onSaved: (value) {
                    name = value;
                  },
                  decoration: InputDecoration(
                      labelText: 'Name',
                      hintText: 'Enter Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (address) {
                    if (address == null || address.isEmpty) {
                      return 'Please enter your name';
                    }
                  },
                  onSaved: (value) {
                    address = value;
                  },
                  decoration: InputDecoration(
                      labelText: 'Address',
                      hintText: 'Enter your address',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (phone) {
                    if (phone == null || phone.isEmpty) {
                      return 'Please enter your name';
                    }
                  },
                  onSaved: (value) {
                    phone = value;
                  },
                  decoration: InputDecoration(
                      labelText: 'Phone',
                      hintText: 'Enter your phone',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (email) {
                    if (email == null || email.isEmpty) {
                      return 'Please enter your name';
                    }
                  },
                  onSaved: (value) {
                    email = value;
                  },
                  decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
              ElevatedButton.icon(
                  onPressed: () async {
                    if (_formKey.currentState != null &&
                        _formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      int id = await DatabaseHelper().insertStudent(
                          Student.insertStudent(
                              name: name ?? '',
                              address: address ?? '',
                              phone: phone ?? '',
                              email: email ?? ''));
                              print(id);
                      Navigator.pop(context, 'success');
                    }
                    
                  },
                  icon: Icon(Icons.save),
                  label: Text("Save"))
            ],
          ),
        ),
      ),
    );
  }
}
