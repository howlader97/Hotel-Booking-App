import 'package:shared_preferences/shared_preferences.dart';

class AuthController{
  static String localUserUid = '';
  static String localUserEmail = '';
  static String? accessToken='';

  static Future<void> saveToken(String token)async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('access_token', token);
    accessToken = token;
  }

  static Future<void> getToken()async{
    final SharedPreferences prefs=await SharedPreferences.getInstance();
    accessToken = prefs.getString('access_token');

  }

  static Future<void> clear()async{
    final SharedPreferences prefs=await SharedPreferences.getInstance();
    await prefs.clear();
  }

  static bool get isLoggedIn{
    return accessToken != null;
  }

  static Future<void> saveUid(String uid)async{
    final SharedPreferences sharedPref= await SharedPreferences.getInstance();
    await sharedPref.setString('userId', uid);
    final saveFunUid=await getUid();
    localUserUid=uid;
    print(saveFunUid);
    print(localUserUid);
  }

 static Future<String?> getUid()async{
   final SharedPreferences sharedPref = await SharedPreferences.getInstance();
   return sharedPref.getString('userId');

 }

 static Future<void> saveEmail(String email)async{
    final SharedPreferences prefs=await SharedPreferences.getInstance();
    await prefs.setString('userEmail', email);
    final saveFunEmail=await getEmail();
    localUserEmail = email;
    print(saveFunEmail);
 }

 static Future<String?> getEmail()async{
    final SharedPreferences prefs =await SharedPreferences.getInstance();
    final getEmail =prefs.getString('userEmail');
    return getEmail;
 }


}