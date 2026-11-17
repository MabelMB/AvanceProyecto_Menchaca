import 'package:flutter_insbook/core/database/database_helper.dart';
import 'package:flutter_insbook/books/book_model.dart';

class LocalBookService {
  final dbHelper = DatabaseHelper.instance;

  //crear
  Future<int> insertBook(Book book, int userId) async{
    final db = await dbHelper.database;
    return
    await db.insert('books', {
      ...book.toMap(),
      'userId': userId,
    });
  }

  //lectura
  Future<List<Book>> getBooks(int userId) async{
    final db = await dbHelper.database;

    final List<Map<String, dynamic>> maps = await db.query(
      'books',
      where: 'userId = ?',
      whereArgs: [userId],
    );

    return List.generate(maps.length, (i){
      return Book.fromMap(maps[i]);
      }
    );
  }

  //Eliminación
  Future<int> deleteBook(int id) async{
    final db = await dbHelper.database;
    return await db.delete(
      'books',
      where: 'id = ?',
      whereArgs: [id]
    );
  }

}