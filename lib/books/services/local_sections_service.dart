import 'package:flutter_insbook/core/database/database_helper.dart';

class LocalSectionsService {
  final dbHelper = DatabaseHelper.instance;
  
  Future<Map<String, dynamic>?> getSection(int bookId, String type) async{
    final db = await dbHelper.database;
    final result = await db.query(
      'secciones',
      where: 'bookId = ? AND type = ?',
      whereArgs: [bookId, type],
    );

    if(result.isNotEmpty){
      return result.first;
    }
    return null;
  }

  Future<void> saveSection(int bookId, String type, String content) async{
    final db = await dbHelper.database;
    final existingSection = await getSection(bookId, type);

    final data = {
      'bookId': bookId,
      'type': type,
      'content': content,
      'updated_at': DateTime.now().toIso8601String(),
    };

    if(existingSection == null){
      await db.insert('secciones', data);
    }else{
      await db.update(
        'secciones', 
        data,
        where: 'bookId = ? AND type = ?',
        whereArgs: [bookId, type]);
    }
  }

  Future<void> deleteSection(int bookId, String type) async{
    final db = await dbHelper.database;

    await db.delete(
      'secciones',
      where: 'bookId = ? AND type = ?',
      whereArgs: [bookId, type],
    );
  }
  
}