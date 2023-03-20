import 'package:e_commerce_app/core/app_export.dart';
import 'package:e_commerce_app/domain/session_manager.dart';

class LogoutUseCase {
  Session session;

  LogoutUseCase(this.session);

  Future<void> execute() async {
    Logger.log("LogoutUseCase executed");
    session.logout();
  }
}
