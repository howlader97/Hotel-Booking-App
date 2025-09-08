 class Urls{
  static const String _baseUrl= 'https://backend-ab.mtscorporate.com/api';
  static  String registration= '$_baseUrl/users/register';
  static  String otpVerify= '$_baseUrl/users/verify-email';
  static  String getLogin= '$_baseUrl/users/login';
  static  String getEmailVerification= '$_baseUrl/users/resend-verification-email';
 }