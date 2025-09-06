import 'dart:convert';

import 'package:abyansf_asfmanagment_app/data/services/network_caller.dart';
import 'package:abyansf_asfmanagment_app/data/utility/urls.dart';
import 'package:abyansf_asfmanagment_app/view/screens/auth/auth_controller/auth_controller.dart';
import 'package:abyansf_asfmanagment_app/view/screens/auth/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OtpVerificationController extends GetxController{
   final TextEditingController emailTEController=TextEditingController();
   final TextEditingController otpTEController=TextEditingController();
   bool otpInProgress = false;

   Future<void> otpVerify()async{

      otpInProgress=true;
      update();
     final email = await AuthController.getEmail();
     print("email print $email Form auth controller") ;


      try{
         final response=await NetworkCaller.otpVerifyRequest(Urls.otpVerify, <String,dynamic>{
            "email":email,
            "code":otpTEController.text.trim(),
         });
         otpInProgress=false;
         update();
         print(response.statusCode);
         print(response.body);
         if(response.statusCode == 200){
            Get.snackbar('Success', 'For password check your mail');
            Get.offAll(() => LoginScreen());
         }else{
            final deCodedResponse=jsonDecode(response.body);
            Get.snackbar('Error', deCodedResponse['message']);
         }
      }catch(e){
         otpInProgress=false;
         update();
         Get.snackbar('Error', 'occure $e');
      }
   }
}