import 'package:get/get.dart';
import 'package:greenedu/pages/application/messenger/messenger_controller.dart';

class MessBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => MessController());
  }
}