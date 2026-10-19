import 'package:flutter/material.dart';
import 'package:flutter_insbook/create_book/screens/create_book_screen.dart';
import 'package:flutter_insbook/details/screens/details_screen.dart';
import 'package:flutter_insbook/home/models/book.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Book> bookList = [
    Book(
      id: 1,
      title: "Ceniza que fue y será", 
      sinopsis: "El rey Arturo ha regresado en una Inglaterra que le necesita más que nunca, donde los mundo urbano y el sobrenatural se mezclan bajo un crimen que conduce a los secretos más oscuros del imperio", 
      genero: "Fantasía urbana", 
      notas: "La trama está inspirada por obras como Star Wars Andor, Mistborn y la serie de libros de Once and Future King de TH White"),

      Book(
      id: 2,
      title: "La Brigada de las Sombras", 
      sinopsis: "Elenor es una chica sin mucha atención, quien tiene la fortuna de viajar al pasado, a la época en donde su aburrido y monótono padre divorciado tenía su edad. Sin embargo, Elenor pronto se dará cuenta que su padre no es la persona que ella piensa que es, y el tiempo corre antes de que catástrofes legales ocurran", 
      genero: "Fantasía urbana", 
      notas: "Colaboración de mi mejor amiga y yo antes de caer en la demencia"),

      Book(
      id: 3, 
      title: "El Otoño de 1999 ", 
      sinopsis: "Baltazar regresa accidentalmente en el tiempo con el objetivo de salvar a su hermano mayor de su propia muerte y, en el proceso, averigua que tal vez su misión no sea sencilla tras encontrarse con que su hermano tal vez no quiere ser salvado.", 
      genero: "Fantasía urbana", 
      notas: "Inspirado en muchas cosas. El viaje en el tiempo es una excusa para hablar sobre la salud mental y los traumas familiares."),

  ];


   @override
  //Flutter puede volver a llamar build() cuando necesita actualizar la interfaz
  Widget build(BuildContext context) {
    //build() devuelve un widget
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFF12365c),
        title: Text("Mis libros"),
        ),
      body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  color: Color(0xFFffffff),
                  child: Column(
                    children: [
                      SizedBox(height: 20),

                      // SizedBox(
                      //   width: 350,
                      //   child:
                      //     Text(
                      //     'Ningún libro creado, empieza a crear uno',
                      //     style: TextStyle(
                      //       color: Colors.black,
                      //       fontSize: 30,
                      //       fontWeight: FontWeight.bold,
                      //     ),
                      //   ),
                      // ),
                      Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.all(8.0),
                        itemCount: bookList.length,
                        itemBuilder: (context, index){
                          final book = bookList[index];
                          return Card(
                            child: ListTile(
                              minLeadingWidth: 10, 
                              horizontalTitleGap: 8, 
                              leading: IconButton(
                                  onPressed: () {
                                    //
                                  },
                                  icon: ImageIcon(
                                  AssetImage('assets/book.png'),
                                  size: 40,
                                  color: Color(0xFF12365c),
                                ),
                              ),
                              title: Text(book.title,
                                  style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),),
                              //
                              //subtitle: Text(''),

                              onTap: (){
                                Navigator.push(
                                context,
                                MaterialPageRoute(
                                  //función para validar el usuario y contraseña
                                  builder: (context) => DetailsScreen(book: book),
                                ),);
                              },
                            ),
                          );
                        },
                      ),
                      ),
                    ],
                  ),
              )),
            ],
          )
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // agregar nuevo libro
            Navigator.push(
              context,
              MaterialPageRoute(
              //función para validar el usuario y contraseña
              builder: (context) => CreateBookScreen(),
              ),);
          },
          backgroundColor: Color(0xFF12365c),
          child: Icon(Icons.add, color: Colors.white, size: 40),
        ),
    );
  }
}