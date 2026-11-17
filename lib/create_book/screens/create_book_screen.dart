import 'package:flutter/material.dart';
import 'package:flutter_insbook/books/book_model.dart';

class CreateBookScreen extends StatefulWidget {
  const CreateBookScreen({
    super.key,
  });
  @override
  State<CreateBookScreen> createState() => _CreateBookScreen();
}

class _CreateBookScreen extends State<CreateBookScreen>{
  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _sinopsisController = TextEditingController();
  final _generoController = TextEditingController();
  final _notasController = TextEditingController();

  void _saveBook(){
    if(_formKey.currentState!.validate()){
      final newBook = Book(
        title: _titleController.text,
        sinopsis: _sinopsisController.text,
        genero: _generoController.text,
        notas: _notasController.text
        );
      Navigator.pop(context, newBook);
    }
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFF12365c),
        title: Text("Crea tu libro"),
        ),
      body: Center(
        child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(width: 40),
            Expanded(
              child: SingleChildScrollView(
              child: Column(
              children: [
                SizedBox(height: 20),
                
                SizedBox(
                width: 370,  
                child: 
                Text("Título", style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                  )
                ),
                SizedBox(
                  width: 370,
                  child: TextFormField(
                  controller: _titleController,
                  decoration: InputDecoration(
                  labelText: 'Título',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0), 
                    ),
                  validator: (value){
                  if(value == null || value.trim().isEmpty){
                    return 'Por favor, ingresa un título';
                  }
                  if(value.length < 3){
                    return 'El título es muy corto';
                  }
                  return null;
                    },
                  ),
                ),

                SizedBox(height: 10),

                SizedBox(
                width: 370,  
                child: 
                Text("Sinopsis", style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                  )
                ),
                SizedBox(
                  width: 370,
                  child: TextFormField(
                  controller: _sinopsisController,
                  decoration: InputDecoration(
                  labelText: 'Sinopsis',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0), 
                    ),
                  validator: (value){
                  if(value == null || value.trim().isEmpty){
                    return 'Por favor, ingrese una sinopsis';
                  }
                  return null;
                    },
                  ),
                ),
              
                SizedBox(height: 10),

                SizedBox(
                width: 370,  
                child: 
                Text("Género", style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                  )
                ),
                SizedBox(
                  width: 370,
                  child: TextFormField(
                  controller: _generoController,
                  decoration: InputDecoration(
                  labelText: 'Género',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0), 
                    ),
                  validator: (value){
                  if(value == null || value.trim().isEmpty){
                    return 'Por favor, ingresa un género';
                  }
                  return null;
                    },
                  ),
                ),

                SizedBox(height: 10),
                
                SizedBox(
                width: 370,  
                child: 
                Text("Notas adicionales", style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                  )
                ),
                SizedBox(
                  width: 370,
                  child: TextFormField(
                  controller: _notasController,
                  decoration: InputDecoration(
                  labelText: 'Notas adicionales',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0), 
                    ),
                  validator: (value){
                  if(value == null || value.trim().isEmpty){
                    return 'Por favor, ingresa notas adicionales';
                  }
                  return null;
                    },
                  ),
                ),

                SizedBox(height: 30),

                ElevatedButton(
                        onPressed: _saveBook,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF12365c),
                            foregroundColor: Colors.white,
                            minimumSize: const Size(200, 50), 
                          ),
                          child: Text("Crear libro")
                        ),

                 ],
                )
              ),
            ),
            
          ],
        ),
        ),
      ),
    );
  }
}