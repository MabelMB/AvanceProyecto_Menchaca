// import 'dart:convert';
// import 'package:flutter_insbook/core/constants/api_constants.dart';
// import 'package:flutter_insbook/core/storage/local_storage_service.dart';
// import 'package:http/http.dart' as http;

// class AuthService{
//   final LocalStorageService _storageService = LocalStorageService();

//   Future<bool> login(String username, String password) async{
//     final url = Uri.parse('${ApiConstants.baseUrl}${ApiConstants.loginEndpoint}');

//     try{
//       final response  = await http.post(
//         url,
//         headers: { "Content-Type" : "application/json"},
//         body: jsonEncode({
//           "username" : username,
//           "password" : password,
//         })
//       );
//       //si la respuesta fue correcta
//       if(response.statusCode == 200){
//         final data = jsonDecode(response.body);
//         await _storageService.saveToken(data['accessToken']);
//         return true;
//       }
//       return false;
//     }
//     catch(e){
//       return false;
//     }
//   }
// }
