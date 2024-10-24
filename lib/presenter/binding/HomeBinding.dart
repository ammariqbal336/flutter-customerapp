import 'package:customer_app/presenter/controller/HomeController.dart';
import 'package:get/get.dart';

class Homebinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Homecontroller>(() => Homecontroller());
  }

}