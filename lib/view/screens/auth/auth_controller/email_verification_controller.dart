import 'dart:convert';
import 'dart:developer';

import 'package:abyansf_asfmanagment_app/data/services/network_caller.dart';
import 'package:abyansf_asfmanagment_app/data/utility/urls.dart';
import 'package:abyansf_asfmanagment_app/view/screens/auth/auth_controller/auth_controller.dart';
import 'package:abyansf_asfmanagment_app/view/screens/auth/number_verification_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EmailVerificationController extends GetxController{
  bool emailInProgress=false;
  final TextEditingController emailTEController=TextEditingController();
  Future<void> emailVerify()async{
    emailInProgress=true;
    update();

      try{
        final response=await NetworkCaller.emailVerificaitonRequest(Urls.getEmailVerification, <String,dynamic>{
          "email":emailTEController.text.trim()
        });
        emailInProgress=false;
        update();
        print(response.statusCode);
        print(response.body);
        if(response.statusCode == 200){
          Get.snackbar('Success', 'Verification email resent successfully');
          Get.to(() => NumberVerificationScreen());
        }else{
          final deCodedResponse=jsonDecode(response.body);
          Get.snackbar('Failed',deCodedResponse['message']);
        }
      }catch(e){
        emailInProgress=false;
        update();
        Get.snackbar('Error', 'Occure $e');
      }

  }
}