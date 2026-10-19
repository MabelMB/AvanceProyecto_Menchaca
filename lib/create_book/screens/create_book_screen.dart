import 'package:flutter/material.dart';

class CreateBookScreen extends StatelessWidget {
  const CreateBookScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFF12365c),
        title: Text("Crea tu libro"),
        ),
      body: Center(
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
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                  labelText: 'Título',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0), 
                    ),
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
                child: TextField(
                  decoration: InputDecoration(
                  labelText: 'Sinopsis',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 5.0), 
                    ),
                  ),
                ),

                SizedBox(height: 10),

                SizedBox(
                width:370,  
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
                child: TextField(
                  decoration: InputDecoration(
                  labelText: 'Género',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0), 
                    ),
                  ),
                ),

                SizedBox(height: 10),

                SizedBox(
                width: 370,  
                child: 
                Text("Notas adicionales", 
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                  ),)
                ),

                SizedBox(
                width: 370,
                child: TextField(
                  decoration: InputDecoration(
                  labelText: 'Notas adicionales',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 5.0), 
                    ),
                  ),
                ),

                SizedBox(height: 30),

                ElevatedButton(
                        onPressed: () {
                            showDialog(context: context, 
                            builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('El libro ha sido agregado a la lista'),
                                );
                              }
                            );
                          }, 
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
    );
  }
}