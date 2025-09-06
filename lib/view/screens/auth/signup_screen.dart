import 'package:abyansf_asfmanagment_app/utils/style/app_color.dart';
import 'package:abyansf_asfmanagment_app/utils/style/app_style.dart';
import 'package:abyansf_asfmanagment_app/utils/style/app_text_styles.dart';
import 'package:abyansf_asfmanagment_app/view/screens/auth/auth_controller/sign_up_controller.dart';
import 'package:abyansf_asfmanagment_app/view/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GetBuilder<SignUpController>(
          builder: (signUpController) {
            if(signUpController.singUpInProgress){
              return Center(child: CircularProgressIndicator(),);
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Request an account',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.bold40,
                ),
                SizedBox(height: 20),
                Text(
                  'Get started with your access in\njust a few steps.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Inter',
                  ),
                ),
                SizedBox(height: AppStyles.heightM),
                TextFormField(
                  controller:signUpController.nameTEController ,
                    decoration: InputDecoration(hintText: 'Name')),
                SizedBox(height: 20),
                TextFormField(
                  controller: signUpController.emailTEController,
                    decoration: InputDecoration(hintText: 'Email')),
                SizedBox(height: 20),
                TextFormField(
                  controller: signUpController.numberTEController,
                  decoration: InputDecoration(hintText: 'Whats app  Number'),
                ),

                SizedBox(height: 20),
                // login button //
                    SizedBox(
                      width: double.infinity,
                      child:  ElevatedButton(
                            onPressed: () {
                             signUpController.signUp();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryColor,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                            ),
                            child: Text(
                              'Send request',
                              style: AppTextStyle.bold16.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                      ),
                    ),

                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                        fontSize: AppStyles.fontL,
                        fontFamily: 'Inter',
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        );
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Color(0xffAD8945),
                          fontSize: AppStyles.fontL,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}
