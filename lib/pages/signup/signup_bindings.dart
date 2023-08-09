import 'package:get/get.dart';
import 'package:greenedu/pages/signup/signup_controller.dart';

class SignupBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => SignupController());
  }
}