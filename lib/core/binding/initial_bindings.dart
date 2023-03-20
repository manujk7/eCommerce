import 'package:e_commerce_app/core/app_export.dart';
import 'package:e_commerce_app/data/local_data_store_impl.dart';
import 'package:e_commerce_app/domain/firebase_manager.dart';
import 'package:e_commerce_app/domain/local_data_store.dart';
import 'package:e_commerce_app/domain/session_manager.dart';
import 'package:e_commerce_app/routes/messaging/fcm_handler.dart';
import '../../domain/usecase/logout_usercase.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut<PrefUtils>(() => PrefUtils());
    Get.lazyPut<LocalDataStore>(
        () => LocalDataStoreImpl(Get.find<PrefUtils>()));
    Get.lazyPut<LogoutUseCase>(() => LogoutUseCase(Get.find<Session>()),
        fenix: true);

    Get.put(FirebaseManager(), permanent: true);
    Get.put(FcmHandler(), permanent: true);
  }
}
