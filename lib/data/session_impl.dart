import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:e_commerce_app/domain/local_data_store.dart';
import 'package:e_commerce_app/domain/models/user.dart';
import 'package:e_commerce_app/domain/session_manager.dart';

class SessionImpl extends Session {
  LocalDataStore localDataStore;

  CookieManager _cookieManager;

  SessionImpl(this.localDataStore, this._cookieManager);

  User? user;

  @override
  Future<void> logout() async {
    await _cookieManager.cookieJar.deleteAll();
  }

  @override
  Future<User?> getUser() async {
    return user;
  }

  @override
  Future<void> update(User? user) async {
    this.user = user;
  }

  @override
  Future<void> init() async {}

  // @override
  // String get userCookie => cookie;

  @override
  int get userId => (user?.id ?? -1).toInt();

  @override
  Future<bool> isLoggedIn() async {
    return user != null;
  }

  @override
  Interceptor cookieManager() {
    return _cookieManager;
  }
}
