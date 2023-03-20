import 'package:get/get.dart';
import 'package:e_commerce_app/domain/data_service.dart';
import 'package:e_commerce_app/domain/session_manager.dart';
import 'package:e_commerce_app/domain/usecase/update_fcm_token.dart';
import '../controller/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
    Get.lazyPut(
        () => UpdateFcmUseCase(Get.find<DataService>(), Get.find<Session>()));
  }
}
