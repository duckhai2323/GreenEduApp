import 'package:get/get.dart';
import 'package:greenedu/pages/inforclasstotutor/inforclasstotutor_controller.dart';

class InforClassToTutorBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => InforClassToTutorController());
  }
}