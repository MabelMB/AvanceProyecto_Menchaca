import 'package:flutter/material.dart';
import 'package:flutter_insbook/home/screens/home_screen.dart';
import 'package:flutter_insbook/registro/screens/registro_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFF12365c),
        title: Text("Inicio de sesión")
        ),
      body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //Parte superior de la pantalla
              Expanded(
                flex: 1,
                child: Container(
                  color: Color(0xFF12365c),
                  child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 7),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Image.asset(
                          'assets/logo.png',
                          width: 150,
                          height: 150,
                          fit: BoxFit.contain,
                          ),
                       ),

                      SizedBox(height: 10),

                       Text(
                        'InsBook',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ],
                    ),
                  ),
              )),
              //Parte inferior de la pantalla
              Expanded(
                flex: 2,
                child: Container(
                  color: Color(0xFFffffff),
                  child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 30),

                      Text(
                        'Bienvenido de nuevo',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 20),

                      SizedBox(
                        width: 380,
                        child: 
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Usuario',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),

                      SizedBox(height: 30),

                      SizedBox(
                        width: 380,
                        child: 
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Contraseña',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),

                      

                      SizedBox(height: 20),

                      ElevatedButton(
                        onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                //función para validar el usuario y contraseña
                                builder: (context) => MyHomePage(),
                              ),);
                          }, 
                          style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF12365c),
                          foregroundColor: Colors.white,
                          minimumSize: const Size(200, 50), 
  ),
                          child: Text("Iniciar sesión")
                        ),

                        SizedBox(height: 10),

                        ElevatedButton(
                        onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                //función para validar el usuario y contraseña
                                builder: (context) => RegistroScreen(),
                              ),);
                          }, 
                          style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF12365c),
                          foregroundColor: Colors.white,
                          minimumSize: const Size(200, 50), 
  ),
                          child: Text("No tengo una cuenta")
                        ),
                      ],
                    ),
                  ),
              )),
            ],
          )
        ),
    );
  }
}