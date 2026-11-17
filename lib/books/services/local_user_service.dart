import 'package:flutter_insbook/core/database/database_helper.dart';

class LocalUserService {
  final dbHelper = DatabaseHelper.instance;

  //registrar usuario
  Future<bool> registerUser(String username, String password) async{
    try{
      final db = await dbHelper.database;
      await db.insert('usuarios', {
        'username' : username,
        'password' : password,
      });
      return true;
    }
    catch(e){
      return false;
    }
  }

  Future<int?> validateLogin(String username, String password) async{
    final db = await dbHelper.database;

    final result = await db.query(
      'usuarios',
      where: 'username =? AND password =?',
      whereArgs: [username, password],
    );

    if (result.isNotEmpty) {
      return result.first['id'] as int;
    }

    return null;
  }

}