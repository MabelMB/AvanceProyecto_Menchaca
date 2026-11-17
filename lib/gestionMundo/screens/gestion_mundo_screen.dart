import 'package:flutter/material.dart';
import 'package:flutter_insbook/books/book_model.dart';
import 'package:flutter_insbook/books/services/local_sections_service.dart';

class GestionMundoScreen extends StatefulWidget {
  final Book book;

  const GestionMundoScreen({
    super.key,
    required this.book,
  });

  @override
  State<GestionMundoScreen> createState() => _GestionMundoScreen();
}


class _GestionMundoScreen extends State<GestionMundoScreen>{
  final TextEditingController _contentController = TextEditingController();

  final LocalSectionsService _sectionsService = LocalSectionsService();
  static const String _sectionType = 'worldbuilding';
  bool _isLoading = true;
  bool _isSaving = false;

  @override
  void initState(){
    super.initState();
    _loadSection();
  }

  Future<void> _loadSection() async{
    final bookId = widget.book.id;

    if (bookId == null) {
      setState(() {
        _isLoading = false;
      });
      return;
    }
    final section = await _sectionsService.getSection(
        bookId,
        _sectionType,
      );

    if(!mounted) return;

    setState(() {
      _contentController.text = section?['content'] as String? ?? '';
      _isLoading = false;
    });
  }

  Future<void> _saveSection() async {
    final bookId = widget.book.id;
    if (bookId == null) return;

    setState(() {
      _isSaving = true;
    });

    await _sectionsService.saveSection(
      bookId, 
      _sectionType, 
      _contentController.text
      );

    
    if (!mounted) return;

    setState(() {
      _isSaving = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Mundo guardado correctamente'),
      ),
    );
  }

  void mostrarAlerta(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('¿No sabes por dónde empezar?'),
        content: const Text('Para tener un mundo más profundo, considera desarrollar los siguientes conceptos:\n\n'
                          'Geografía y ecología.\n'
                          'Historia y cronología.\n'
                          'Cultura y sociedad.\n'
                          'Gobierno y economía.\n'
                          'Reglas especiales.\n'
                          'Lenguaje.\n\n'
                          'El worldbuilding permitirá que el lector crea en tu universo sin necesidad de recibir explicaciones forzadas a cada momento.'
        ),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(); 
            },
            child: Text('Aceptar'),
          ),
        ],
      );
    },
  );
}


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFF12365c),
        title: Text(widget.book.title)
      ),
      body: Center(
        child: Column(
          children: [
                SizedBox(height: 20),
                SizedBox(child: Text("Planeación del mundo (worldbuilding)", style: TextStyle(
                          color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold))),

                SizedBox(height: 10),

                SizedBox(
                  width: 370,
                  child: TextFormField(
                    maxLines: null,
                    minLines: 1,
                    controller: _contentController,
                    decoration: InputDecoration(
                    labelText: 'Escribe aquí lo que tienes planeado para tu mundo',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0), 
                    ),

                ),),

                SizedBox(height: 10),

                ElevatedButton(
                        onPressed: _saveSection,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF12365c),
                            foregroundColor: Colors.white,
                            minimumSize: const Size(200, 50), 
                          ),
                          child: Text("Guardar planeación")
                        ),
              ],
            )),
            floatingActionButton: FloatingActionButton(
              onPressed: (){mostrarAlerta(context);},
              child: Icon(Icons.lightbulb)
            ),
        );
  }
}