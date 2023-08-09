import 'package:get/get.dart';
import 'package:greenedu/pages/application/application_controller.dart';

class ApplicationBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => ApplicationController());
  }
}