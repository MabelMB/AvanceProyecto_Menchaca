import 'package:shared_preferences/shared_preferences.dart';
 
class LocalStorageService {
  Future<void> saveSession(int userId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('currentUserId', userId);
  }
 
  Future<int?> getSession() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('currentUserId');
  }

  Future<void> deleteSession() async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('currentUserIf');
  }

}