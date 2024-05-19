import 'package:get/get.dart';
import 'package:ri9abe/controllers/etudiantcontroller.dart';
import 'package:ri9abe/controllers/logincontroller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
    Get.lazyPut<EtudiantController>(() => EtudiantController(), fenix: true);
  }
}
