import 'package:flutter/material.dart';
import 'package:flutter_insbook/gestionMundo/screens/gestion_mundo_screen.dart';
import 'package:flutter_insbook/gestionPersonajes/screens/gestion_personajes_screen.dart';
import 'package:flutter_insbook/home/models/book.dart';
import 'package:flutter_insbook/planeacion_book/screens/planeacion_book_screen.dart';
import 'package:flutter_insbook/tablero_imagenes/screens/tablero_imagenes_screen.dart';

class DetailsScreen extends StatelessWidget {
  final Book book;

  const DetailsScreen({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFF12365c),
        title: Text(book.title)),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Column(
                  children: [
                    SizedBox(height: 10),
                    SizedBox(
                          width: 370,
                          child: Text('Género: ${book.genero}', textAlign: TextAlign.left, style: TextStyle(
                          color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold, ))),

                    SizedBox(
                          width: 370,
                          child: Text('Sinopsis:', textAlign: TextAlign.left, style: TextStyle(
                          color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold))),

                    SizedBox(
                      width: 370,
                      child: Text(book.sinopsis,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Colors.black, fontSize: 16
                        ), 
                      ),
                    ),

                    SizedBox(
                          width: 370,
                          child: Text('Notas:', textAlign: TextAlign.left, style: TextStyle(
                          color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold))),

                    SizedBox(
                      width: 370,
                      child: Text(book.notas,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Colors.black, fontSize: 16
                        ), 
                      ),
                    ),

                    SizedBox(width: 50),

                    Card(
                      color: Color(0xFF12365c),
                      elevation: 1,
                      child: InkWell(
                        onTap: (){
                          Navigator.push(
                                context,
                                MaterialPageRoute(
                                  //función para validar el usuario y contraseña
                                  builder: (context) => TableroImagenesScreen(book: book),
                                ),);
                        },
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                height: 100,
                                width: 390,
                                child: Center(child: Text('Tablero de imágenes', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),),
                              ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    Card(
                      color: Color(0xFF12365c),
                      elevation: 1,
                      child: InkWell(
                        onTap: (){
                          Navigator.push(
                                context,
                                MaterialPageRoute(
                                  //función para validar el usuario y contraseña
                                  builder: (context) => PlaneacionBookScreen(book: book),
                                ),);
                        },
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                height: 100,
                                width: 390,
                                child: Center(child: Text('Planeación del libro', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),),
                              ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    Card(
                      color: Color(0xFF12365c),
                      elevation: 1,
                      child: InkWell(
                        onTap: (){
                          Navigator.push(
                                context,
                                MaterialPageRoute(
                                  //función para validar el usuario y contraseña
                                  builder: (context) => GestionPersonajesScreen(book: book),
                                ),);
                        },
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                height: 100,
                                width: 390,
                                child: Center(child: Text('Gestión de personajes', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),),
                              ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    Card(
                      color: Color(0xFF12365c),
                      elevation: 1,
                      child: InkWell(
                        onTap: (){
                          Navigator.push(
                                context,
                                MaterialPageRoute(
                                  //función para validar el usuario y contraseña
                                  builder: (context) => GestionMundoScreen(book: book),
                                ),);
                        },
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                height: 100,
                                width: 390,
                                child: Center(child: Text('Gestión del mundo', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),),
                              ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                  ],
              ))
          ],
        ),
      ),
    );
  }
}