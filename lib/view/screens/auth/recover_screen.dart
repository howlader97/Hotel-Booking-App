import 'package:abyansf_asfmanagment_app/utils/style/app_color.dart';
import 'package:abyansf_asfmanagment_app/utils/style/app_style.dart';
import 'package:abyansf_asfmanagment_app/utils/style/app_text_styles.dart';
import 'package:abyansf_asfmanagment_app/view/screens/auth/auth_controller/email_verification_controller.dart';
import 'package:abyansf_asfmanagment_app/view/screens/auth/gmail_verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecoverScreen extends StatelessWidget {
   RecoverScreen({super.key});

  final controller=Get.find<EmailVerificationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Recover Password',
              textAlign: TextAlign.center,
              style: AppTextStyle.bold40,
            ),
            SizedBox(height: 20),
            Text(
              'Enter the Email Address that you used when register to recover your password, You will receive a Verification code.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.greyColor,
                fontSize: 15,
                fontFamily: "inter",
              ),
            ),
            SizedBox(height: AppStyles.heightM),
            TextFormField(
              controller: controller.emailTEController,
                decoration: InputDecoration(hintText: 'Email')),

            SizedBox(height: 20),
            // login button //
            Row(
              children: [
                Expanded(
                  child: GetBuilder<EmailVerificationController>(
                    builder: (emailController) {
                      if(emailController.emailInProgress){
                        return Center(child: CircularProgressIndicator(),);
                      }
                      return ElevatedButton(
                        onPressed: () {
                      emailController.emailVerify();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        child: Text(
                          'Submit',
                          style: AppTextStyle.bold18.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                      );
                    }
                  ),
                ),
              ],
            ),

            // text button //
          ],
        ),
      ),
    );
  }
}
