import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  late Database _db;
  static const String tableName = 'student';
  DatabaseHelper() {
    createDatabase();
  }

  Future<Database> createDatabase() async {
    var dataPath = await getDatabasesPath(); // foler
    String path = join(dataPath, 'student.db'); // db
    _db = await openDatabase(path); // initialize

    await _db.execute(
        'CREATE TABLE IF NOT EXISTS $tableName(id INT PRIMARY KEY, name TEXT, address TEXT, phone TEXT, email TEXT)');
    // create table
    return _db;
  }

  Future<int> insertStudent(Map<String, dynamic> student) async {
    _db = await createDatabase(); // create _db if not exit
    return await _db.insert(tableName, student);
  }

  Future<List<Map<String, dynamic>>> getAllStudents() async {
    _db = await createDatabase();
    return await _db
        .query(tableName, columns: ['id', 'name', 'address', 'phone', 'email']);
  }

  Future<int> updateStudent(Map<String, dynamic> student, int id) async {
    _db = await createDatabase();
    return await _db.update(tableName, student, where: 'id=?', whereArgs: [id]);
  }

  Future<int> deleteStudent(int id) async {
    _db = await createDatabase();
    return await _db.delete(tableName, where: 'id=?', whereArgs: [id]);
  }

  Future<int> delete() async {
    _db = await createDatabase();
    return await _db.rawDelete('DELETE FROM $tableName');
  }
}






















// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

// class DatabaseHelper {
//   late Database _db;
//   static const String tableName = 'student';

//   Future<Database> createDatabase() async {
//     var dataPath = await getDatabasesPath(); // folder
//     String path = join(dataPath, 'student.db'); // db
//     _db = await openDatabase(path); // initialize

//     await _db.execute(
//         'CREATE TABLE IF NOT EXISTS $tableName(id INT PRIMARY KEY, name TEXT, address TEXT, phone TEXT, email TEXT)');
//     // create table
//     return _db;
//   }

//   Future<int> insertStudent(Map<String, dynamic> student) async {
//     _db = await createDatabase(); // create database if no exit
//     return await _db.insert(tableName, student);
//   }

//   Future<List<Map<String, dynamic>>> getAllStudents() async {
//     _db = await createDatabase();
//     return await _db
//         .query(tableName, columns: ['id', 'name', 'address', 'phone', 'email']);
//   }

//   Future<int> updateStudent(Map<String, dynamic> student, int id) async {
//     _db = await createDatabase();
//     return await _db.update(tableName, student, where: 'id=?', whereArgs: [id]);
//   }

//   Future<int> deleteStudent(int id) async {
//     _db = await createDatabase();
//     return await _db.delete(tableName, where: 'id=?', whereArgs: [id]);
//   }

//   Future<int> delete() async {
//     _db = await createDatabase();
//     return await _db.rawDelete('DELETE FROM $tableName');
//   }
// }





