import 'dart:convert';
import 'package:abyansf_asfmanagment_app/data/services/network_caller.dart';
import 'package:abyansf_asfmanagment_app/data/utility/urls.dart';
import 'package:abyansf_asfmanagment_app/view/screens/auth/auth_controller/auth_controller.dart';
import 'package:abyansf_asfmanagment_app/view/widget/custom_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  final TextEditingController emailTEController=TextEditingController();
  final TextEditingController passwordTEController=TextEditingController();
  bool loginInProgress=false;

  Future<void> getLogin()async{
    loginInProgress=true;
    update();
    try{
      final response = await NetworkCaller.signInRequest(
          Urls.getLogin,<String,dynamic>{
          "email":emailTEController.text.trim(),
          "password":passwordTEController.text.trim(),
          "rememberMe":true
      }
      );


      loginInProgress = false;
      update();

      print("Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if(response.statusCode == 200){
        Get.snackbar("Success", 'Login Successful');
        final deCodedResponse=jsonDecode(response.body);
        final token=deCodedResponse['token'];
        AuthController.saveToken(token);
        print('token____$token');
        Get.offAll(() => CustomBottomBar());
      }else{
        final deCodedResponse=jsonDecode(response.body);
        Get.snackbar('Failed', deCodedResponse['message']);
      }
    }catch(e){
      loginInProgress=false;
      update();
      Get.snackbar('Error', 'occure $e');
    }
  }
}

