import 'package:flutter/material.dart';
import 'package:flutter_insbook/auth/screens/login_screen.dart';
import 'package:flutter_insbook/books/services/local_book_service.dart';
import 'package:flutter_insbook/core/storage/local_storage_service.dart';
import 'package:flutter_insbook/create_book/screens/create_book_screen.dart';
import 'package:flutter_insbook/details/screens/details_screen.dart';
import 'package:flutter_insbook/books/book_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // List<Book> bookList = [
  //   Book(
  //     id: 1,
  //     title: "Ceniza que fue y será", 
  //     sinopsis: "El rey Arturo ha regresado en una Inglaterra que le necesita más que nunca, donde los mundo urbano y el sobrenatural se mezclan bajo un crimen que conduce a los secretos más oscuros del imperio", 
  //     genero: "Fantasía urbana", 
  //     notas: "La trama está inspirada por obras como Star Wars Andor, Mistborn y la serie de libros de Once and Future King de TH White"),

  //     Book(
  //     id: 2,
  //     title: "La Brigada de las Sombras", 
  //     sinopsis: "Elenor es una chica sin mucha atención, quien tiene la fortuna de viajar al pasado, a la época en donde su aburrido y monótono padre divorciado tenía su edad. Sin embargo, Elenor pronto se dará cuenta que su padre no es la persona que ella piensa que es, y el tiempo corre antes de que catástrofes legales ocurran", 
  //     genero: "Fantasía urbana", 
  //     notas: "Colaboración de mi mejor amiga y yo antes de caer en la demencia"),

  //     Book(
  //     id: 3, 
  //     title: "El Otoño de 1999 ", 
  //     sinopsis: "Baltazar regresa accidentalmente en el tiempo con el objetivo de salvar a su hermano mayor de su propia muerte y, en el proceso, averigua que tal vez su misión no sea sencilla tras encontrarse con que su hermano tal vez no quiere ser salvado.", 
  //     genero: "Fantasía urbana", 
  //     notas: "Inspirado en muchas cosas. El viaje en el tiempo es una excusa para hablar sobre la salud mental y los traumas familiares."),

  // ];

  @override
  void initState() {
    super.initState();
    _initializeHome();
  }

  Future<void> _initializeHome() async {
  final userId = await _storage.getSession();

  if (!mounted) return;

  if (userId == null) {
    _logout();
    return;
  }

  _userId = userId;
  await _loadBooks();
}

  int? _userId;
  final LocalStorageService _storage = LocalStorageService();
  final LocalBookService _dbService = LocalBookService();
  List<Book> _books = [];
  bool _isLoading = false;

  Future<void> _loadBooks() async{
    setState(() {
      _isLoading = true;
    });
    final books = await _dbService.getBooks(_userId!);

    if(!mounted) return;

    setState(() {
      _books = books;
      _isLoading = false;
    });
  }

  void _logout() async{
    final storage = LocalStorageService();
    await storage.deleteSession();

    if(!mounted) return;

    Navigator.pushAndRemoveUntil(
      context, 
      MaterialPageRoute(builder: (context) => LoginScreen()),
      (Route<dynamic> route) => false
      );
  }

  Future<void> _navigateToAddBook() async{
    final newBook = await Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => CreateBookScreen())
      );

      if(newBook != null && newBook is Book){
        await _dbService.insertBook(newBook, _userId!);
        await _loadBooks();

        if(mounted){
          ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Libro creado exitosamente'),
          backgroundColor: Colors.green,
          ));
        }
      }
  }

  Future<void> _deleteBook(int id, String title) async{
    await _dbService.deleteBook(id);

    if(mounted){
      _loadBooks();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Libro eliminado: $title'))
      );
    }
  }


   @override
  //Flutter puede volver a llamar build() cuando necesita actualizar la interfaz
  Widget build(BuildContext context) {
    //build() devuelve un widget
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFF12365c),
        title: Text("Mis libros"),
        actions: [
          IconButton(
            onPressed: (){
              showDialog(
                context: context, 
                builder: (context) => AlertDialog(
                  title: Text('¿Cerrar sesión?'),
                  content: Text('Tendrás que volver a ingresar tus datos'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context), 
                      child: Text('Cancelar')),
                    ElevatedButton(
                      onPressed: (){
                        Navigator.pop(context);
                        _logout();
                      }, 
                      child: Text('Salir')),
                  ],
                ));
            },
            icon: Icon(Icons.logout)
          )
        ],
        ),
      body: 
        _isLoading 
        ? Center(child: CircularProgressIndicator())
        : _books.isEmpty ?
        SizedBox(
          width: 350,
          child:
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Ningún libro creado, empieza a crear uno',
              style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
                  ),
                ),
            ) 
         )
        : Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  color: Color(0xFFffffff),
                  child: Column(
                    children: [
                      SizedBox(height: 10), 
                      Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.all(8.0),
                        itemCount: _books.length,
                        itemBuilder: (context, index){
                          final book = _books[index];
                          return Card(
                            clipBehavior: Clip.antiAlias,
                            // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                            // margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            
                            child: InkWell(
                              onTap: (){
                                Navigator.push(
                                  context, 
                                  MaterialPageRoute(builder: (context) => DetailsScreen(book: book),)
                                  );
                              },
                            
                            child: ListTile( 
                              minLeadingWidth: 10, 
                              horizontalTitleGap: 8, 
                              
                              title: Text(book.title,
                                  style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),),

                              leading: Image.asset(
                                  'assets/book.png',
                                  width: 40,
                                  height: 40,
                                  // color: Color(0xFF12365c),
                                  fit: BoxFit.cover,
                                ),

                                trailing: IconButton(
                                  onPressed: (){if(book.id!= null) {_deleteBook(book.id!, book.title);}},
                                  icon: Icon(Icons.delete, color: Colors.red)),          //
                              //subtitle: Text(''),
                            ),
                            )
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
          onPressed: _navigateToAddBook,
          child: Icon(Icons.add)
        ),
    );
  }
}