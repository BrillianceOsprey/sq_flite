
import 'package:flutter/material.dart';
import '../database/database_helper.dart';
import '../model/student.dart';

class UpdateStudent extends StatefulWidget {
  final int id;
  final String name;
  final String address;
  final String phone;
  final String email;
  UpdateStudent({required this.id, required this.name, required this.address, required this.phone, required this.email});

  @override
  _UpdateStudentState createState() => _UpdateStudentState();
}

class _UpdateStudentState extends State<UpdateStudent> {
  final _formKey = GlobalKey<FormState>();
  int? id;
  String? name, address, phone, email;
  @override
  void initState() {
    id = widget.id;
    name = widget.name;
    address = widget.address;
    phone = widget.phone;
    email = widget.phone;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Student'),
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
                  initialValue: address,
                  validator: (address) {
                    if (address == null || address.isEmpty) {
                      return 'Please enter your address';
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
                  initialValue: phone,
                  validator: (phone) {
                    if (phone == null || phone.isEmpty) {
                      return 'Please enter your phone';
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
                  initialValue: email,
                  validator: (email) {
                    if (email == null || email.isEmpty) {
                      return 'Please enter your email';
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
                      int result = await DatabaseHelper().updateStudent(
                        Student.insertStudent(
                          name: name ?? '', 
                          address: address ?? '', 
                          phone: phone ?? '', 
                          email: email ?? ''), 
                        id!);
                        print(result);
                    }
                    Navigator.pop(context, 'success');
                  },
                  icon: Icon(Icons.edit),
                  label: Text("Edit"))
            ],
          ),
        ),
      ),
    
    );
  }
}

