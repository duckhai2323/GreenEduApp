import 'package:get/get.dart';
import 'package:greenedu/pages/chat/chat_controller.dart';

class ChatBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => ChatController());
  }
}