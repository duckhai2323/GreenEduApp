import 'package:get/get.dart';
import 'package:greenedu/pages/application/application_controller.dart';
import 'package:greenedu/pages/application/home/home_controller.dart';
import 'package:greenedu/pages/application/messenger/messenger_controller.dart';

class ApplicationBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => ApplicationController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => MessController());
  }
}