import 'models/user.dart';
import 'package:dio/dio.dart';

//Stores user related information
abstract class Session {
  Session();

  Future<void> init();

  Future<void> logout();

  int get userId;

  //String get userCookie;

  Future<User?> getUser();

  Future<void> update(User? user);

  Future<bool> isLoggedIn();

  Interceptor cookieManager();
}
