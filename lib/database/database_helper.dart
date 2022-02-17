
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper{
  late Database _db;
  static const String tableName = 'student';
  DataBaseHelper(){
    createDatabase();
  }


  Future<Database> createDatabase()async{
    var dataPath = await getDatabasesPath(); //get to create a folder
    String path = join(dataPath, 'student.db'); //db
    _db = await openDatabase(path); // initialize database
    await _db.execute('CREATE TABLE IF NOT EXISTS $tableName(id INT PRIMARY KEY, name TEXT, address TEXT, phone TEXT, )');
    //create table
    return _db;
  }
  
  Future<int> insertDatabase(Map<String, dynamic> student)async{ // to return id
    _db = await createDatabase(); // create database if not exist
    return _db.insert(tableName, student); 
  }

  Future<List<Map<String, dynamic>>> getAllDatabase()async{
    _db = await createDatabase(); // create database if not exist
    return _db.query(tableName, columns: ['id', 'name', 'address', 'phone', 'email']);
  }
}