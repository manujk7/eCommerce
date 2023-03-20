import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:e_commerce_app/core/app_export.dart';
import 'package:e_commerce_app/domain/constants/api_routes.dart';
import 'package:e_commerce_app/domain/data_service.dart';
import 'package:e_commerce_app/domain/session_manager.dart';

class UpdateFcmUseCase {
  final DataService _dataService;
  final Session _session;

  UpdateFcmUseCase(this._dataService, this._session);

  Future<void> execute() async {
    // try {
    //   var result = _dataService.fetchJsonFromNetwork<bool>(
    //       Method.POST, ApiRoute.updateFCMToken,
    //       data: {
    //         if (_session.userId >= 0) "userId": _session.userId,
    //         "deviceToken": await FirebaseMessaging.instance.getToken()
    //       },
    //       mapper: (json) => json["token"] != null);
    //   Logger.log("Updating FCM token - ${result} ");
    // } catch (ex, st) {
    //   Logger.log("Updating FCM token - false ", stackTrace: st);
    // }
  }
}
