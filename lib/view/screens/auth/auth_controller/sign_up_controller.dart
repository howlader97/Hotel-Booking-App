import 'dart:convert';

import 'package:abyansf_asfmanagment_app/data/services/network_caller.dart';
import 'package:abyansf_asfmanagment_app/data/utility/urls.dart';
import 'package:abyansf_asfmanagment_app/view/screens/auth/auth_controller/auth_controller.dart';
import 'package:abyansf_asfmanagment_app/view/screens/auth/gmail_verification_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final TextEditingController nameTEController = TextEditingController();
  final TextEditingController emailTEController = TextEditingController();
  final TextEditingController numberTEController = TextEditingController();
  bool singUpInProgress = false;

  Future<void> signUp() async {
    singUpInProgress = true;
    update();
    try {
      final response = await NetworkCaller.signUpRequest(
        Urls.registration,
        <String, dynamic>{
          "name": nameTEController.text.trim(),
          "email": emailTEController.text.trim(),
          "whatsapp": numberTEController.text.trim(),
        },
      );
      singUpInProgress = false;
      update();
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 201) {
        final decodedResponse = jsonDecode(response.body);
        Get.snackbar('Success', 'Sign Up successful');
        final uid = decodedResponse['userId'];
        print(uid);
        await AuthController.saveUid(uid);
        await AuthController.saveEmail(emailTEController.text);
        Get.to(() => GmailVerificationScreen());
      } else {
        Get.snackbar(
          'Error',
          'Registration failed: User with this email or whatsapp already exists',
        );
      }
    } catch (e) {
      singUpInProgress = false;
      update();
      Get.snackbar('Error', 'Something went wrong: ${e.toString()}');
    }
  }
}
