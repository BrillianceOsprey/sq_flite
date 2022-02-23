import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  late Database _db;
  static const String tableName = 'student';
  DatabaseHelper() {
    _createDatabase();
  }

  Future<Database> _createDatabase() async {
    var dataPath = await getDatabasesPath(); // folder
    String path = join(dataPath, 'student.db'); // db
    _db = await openDatabase(path); // initialize

    await _db.execute(
        'CREATE TABLE IF NOT EXISTS $tableName(id INTEGER PRIMARY KEY NOT NULL, name TEXT, address TEXT, phone TEXT, email TEXT)');
    return _db;
  }

  Future<int> insertStudent(Map<String, dynamic> student) async {
    _db = await _createDatabase();
    return _db.insert(tableName, student);
  }

  Future<List<Map<String, dynamic>>> getAllStudents() async {
    _db = await _createDatabase();
    return _db
        .query(tableName, columns: ["id", "name", "address", "phone", "email"]);
  }

  Future<int> updateStudent(Map<String, dynamic> student, int id) async {
    _db = await _createDatabase();
    return _db.update(tableName, student, where: 'id=?', whereArgs: [id]);
  }

  Future<int> deleteStudent(int id) async {
    _db = await _createDatabase();
    return _db.delete(tableName, where: 'id=?', whereArgs: [id]);
  }

  Future<int> deleteAll() async {
    _db = await _createDatabase();
    return _db.rawDelete('DELETE FROM $tableName');
  }
}
