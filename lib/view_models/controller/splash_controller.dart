import 'package:abyansf_asfmanagment_app/utils/assets_path.dart';
import 'package:abyansf_asfmanagment_app/view/screens/auth/auth_controller/auth_controller.dart';
import 'package:abyansf_asfmanagment_app/view/screens/auth/login_screen.dart';
import 'package:abyansf_asfmanagment_app/view/screens/auth/onbording_screen.dart';
import 'package:abyansf_asfmanagment_app/view/widget/custom_bottom_bar.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  RxInt currentIndex = 0.obs;
  final List<String> images = [
    AssetPath.splashScreen1,
    AssetPath.splashScreen2,
    AssetPath.splashScreen3,
  ];

  void splashIndex(){
    if(currentIndex.value < images.length-1){
      currentIndex++;
    } else {
      Get.to(LoginScreen());
    }
    update();
  }

}
