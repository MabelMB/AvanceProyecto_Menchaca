import 'package:flutter/material.dart';
import 'package:flutter_insbook/home/models/book.dart';

class GestionMundoScreen extends StatelessWidget {
  final Book book;

  const GestionMundoScreen({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFF12365c),
        title: Text(book.title)
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(child: Column(
              children: [
                SizedBox(height: 20),
                SizedBox(child: Text("Gestión del mundo", style: TextStyle(
                          color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold))),
              ],
            )),
          ],
        ),
       ),
      );
  }
}