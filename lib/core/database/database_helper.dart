import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();
  //creación
  Future<void> _createDB(Database db, int version) async{
    await db.execute('''
      CREATE TABLE books(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        userId INTEGER, 
        title TEXT NOT NULL,
        sinopsis TEXT NOT NULL,
        genero TEXT NOT NULL,
        notas TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE usuarios(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT NOT NULL UNIQUE,
        password TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE secciones(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        bookId INTEGER NOT NULL,
        type TEXT NOT NULL,
        content TEXT,
        updated_at TEXT
      )
    ''');
  }

  //inicialización
  Future<Database> _initDB(String filePath) async{
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 2,
      onCreate: _createDB
    );
  }

  //obtención
  Future<Database> get database async{
    if(_database != null) return _database!;
    _database = await _initDB('insbook_local.db');
    return _database!;
  }

}