import 'package:get/get.dart';
import 'package:greenedu/pages/signin/signin_controller.dart';

class SigninBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => SigninController());
  }
}