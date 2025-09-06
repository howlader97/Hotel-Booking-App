import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkCaller{

  static Future<http.Response>  signUpRequest(String url,Map<String,dynamic> body) async{
    try{
      final response= await http.post(Uri.parse(url),headers: {
        'Content-Type' :'application/json'
      },body: jsonEncode(body),
      );
      return response;
    }catch(e){
      throw Exception("Sign up request failed: $e");
    }
  }

  static Future<dynamic> otpVerifyRequest(String url,Map<String,dynamic> body)async{
    try{
      final response= await http.post(Uri.parse(url),headers: {
        'Content-Type' :'application/json'
      },body: jsonEncode(body));
      return response;
    }catch(e){
      throw Exception("Otp request failed: $e");
    }
  }

  static Future<dynamic> signInRequest(String url,Map<String,dynamic> body)async{
    try{
      final response=await http.post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
          },
        body: jsonEncode(body),
      );
      return response;
    }catch(e){
      throw Exception("Sign In request failed: $e");
    }
  }
}