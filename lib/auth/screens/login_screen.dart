import 'package:flutter/material.dart';
import 'package:flutter_insbook/auth/screens/registro_screen.dart';
import 'package:flutter_insbook/books/services/local_user_service.dart';
import 'package:flutter_insbook/core/storage/local_storage_service.dart';
import 'package:flutter_insbook/home/screens/home_screen.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreen();
}


class _LoginScreen extends State<LoginScreen>{
  //SharedPreferences sharedPref = getContext().getSharedPreferences("MisPreferencias", Context.MODE_PRIVATE);
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final LocalUserService _userService = LocalUserService();
  final LocalStorageService _storage = LocalStorageService();
  bool _isLoading = false;

  void _iniciarSesion() async{
    setState(() {
      _isLoading = true;
    });

  final userId = await _userService.validateLogin(
    _usernameController.text, 
    _passwordController.text);

  if(!mounted) return; //si el componente no está montado

  setState(() {
    _isLoading = false;
  });

  if(userId != null){
    await _storage.saveSession(userId);

    if(!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Inicio de sesión exitoso"))
    );
    //navegación hacia homescreen
    Navigator.pushReplacement(context, 
    MaterialPageRoute(builder: (context) => MyHomePage())
    );
  }else{
    ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error al iniciar sesión"),
          backgroundColor: Colors.red)
        );
  }
  }

  
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
                          controller: _usernameController,
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
                          controller: _passwordController,
                          decoration: InputDecoration(
                            labelText: 'Contraseña',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),

                      

                      SizedBox(height: 20),

                      ElevatedButton(
                        onPressed: _iniciarSesion,
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