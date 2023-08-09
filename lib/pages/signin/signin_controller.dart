import 'package:get/get.dart';
import 'package:greenedu/routes/names.dart';

class SigninController extends GetxController{
  var obscureText_ = true.obs;
  SigninController();
  void ClickVisible(){
    if(obscureText_.value) {obscureText_.value = false;}
    else {obscureText_.value = true;}
  }
  void HandlePageSignup(){
    Get.toNamed(AppRoutes.SIGN_UP);
  }
}