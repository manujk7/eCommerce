import 'dart:async';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:e_commerce_app/core/app_export.dart';
import 'package:e_commerce_app/core/utils/no_internet_dialog.dart';
import 'package:e_commerce_app/data/apiClient/dio_facade.dart';
import 'package:e_commerce_app/data/data_service_impl.dart';
import 'package:e_commerce_app/data/session_impl.dart';
import 'package:e_commerce_app/domain/data_service.dart';
import 'package:e_commerce_app/domain/local_data_store.dart';
import 'package:e_commerce_app/domain/network_info.dart';
import 'package:e_commerce_app/domain/session_manager.dart';
import 'package:e_commerce_app/domain/usecase/update_fcm_token.dart';
import 'package:e_commerce_app/domain/usecase/update_user_usecase.dart';
import 'package:path_provider/path_provider.dart';
import '../../../domain/usecase/logout_usercase.dart';

class SplashController extends GetxController {
  @override
  void onReady() async {
    super.onReady();
    await initDependencies();
    await _initFirebase();
    checkLogin();
  }

  Future<void> checkLogin() async {
    await _checkNextScreen();
    // await Get.find<UpdateUserUseCase>()
    //     .execute(isSilent: false)
    //     .then((value) async {
    //   Get.find<UpdateFcmUseCase>().execute();
    //
    // }).catchError((ex, st) async {
    //   if (ex is NoInternetException) {
    //     NoInternetDialogUtils.showInternetDialog(onRetry: () {
    //       checkLogin();
    //     });
    //     return;
    //   } else {
    //     if (ex is UserLoggedOutError) {
    //       Get.find<LogoutUseCase>().execute();
    //     }
    //     Get.find<UpdateFcmUseCase>().execute();
    //     await _checkNextScreen();
    //   }
    // });
  }

  Future<void> _checkNextScreen() async {
    Get.offAndToNamed(AppRoutes.loginScreen);
  }

  Future<void> initDependencies() async {
    await getApplicationDocumentsDirectory().then((appDocDir) {
      String appDocPath = appDocDir.path;
      var persistCookieJar = PersistCookieJar(
          ignoreExpires: true, storage: FileStorage("$appDocPath/.cookies/"));
      Get.put<CookieManager>(CookieManager(persistCookieJar), permanent: true);
    });
    Get.put<Session>(
        SessionImpl(Get.find<LocalDataStore>(), Get.find<CookieManager>()),
        permanent: true);

    Get.put<DioFacade>(DioFacade(Get.find<Session>()), permanent: true);

    Get.put<DataService>(DataServiceImpl(Get.find<DioFacade>()),
        permanent: true);

    Get.lazyPut<NetworkInfo>(() {
      Connectivity connectivity = Connectivity();
      return NetworkInfoImpl(connectivity);
    });

    Get.put(UpdateUserUseCase(Get.find<DataService>(), Get.find<Session>()),
        permanent: true);
  }

  Future<void> _initFirebase() async {
    Logger.log(
        "FirebaseMessaging token - ${await FirebaseMessaging.instance.getToken()}");
  }
}
