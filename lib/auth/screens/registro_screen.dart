import 'package:flutter/material.dart';
import 'package:flutter_insbook/auth/screens/login_screen.dart';
import 'package:flutter_insbook/books/services/local_user_service.dart';
import 'package:flutter_insbook/home/screens/home_screen.dart';

class RegistroScreen extends StatefulWidget {
  const RegistroScreen({
    super.key,
  });

  @override
  State<RegistroScreen> createState() => _RegistroScreen();
}

class _RegistroScreen extends State<RegistroScreen>{
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  final LocalUserService _userService = LocalUserService();
  bool _isLoading = false;

  void registrarUsuario() async{
    final username = _usernameController.text.trim();
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if(username.isEmpty || password.isEmpty || confirmPassword.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Debes completar todos los campos"))
    );
    return;
    }

    if(password != confirmPassword){
      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Las contraseñas no coinciden"))
    );
    return;
    }

    setState(() {
      _isLoading = true;
    });

    bool success = await _userService.registerUser(username, password);

    if(!mounted) return;

    setState(() {
      _isLoading = false;
    });
    
    if(success){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Cuenta creada exitosamente"))
      );
      Navigator.pop(context);
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Este nombre de usuario ya está registrado"),
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
                        'Bienvenido a InsBook',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 50),

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
                          obscureText: true,
                          controller: _passwordController,
                          decoration: InputDecoration(
                            labelText: 'Contraseña',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),

                      SizedBox(height: 30),

                      SizedBox(
                        width: 380,
                        child: 
                        TextField(
                          obscureText: true,
                          controller: _confirmPasswordController,
                          decoration: InputDecoration(
                            labelText: 'Repetir contraseña',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),

                      SizedBox(height: 50),

                      ElevatedButton(
                        onPressed:  _isLoading ? null : registrarUsuario,
                          style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF12365c),
                          foregroundColor: Colors.white,
                          minimumSize: const Size(200, 50), 
  ),
                          child: Text("Registrarse")
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