// // ignore_for_file: unnecessary_null_comparison, deprecated_member_use
//
// import 'dart:io';
//
// import 'package:dio/dio.dart';
// import 'package:growthschool/domain/session_manager.dart';
//
// import '../../core/constants/constants.dart';
// import '../providers/secure_storage.dart';
// import 'api_end_point.dart';
//
//
//
// class AuthInterceptor extends Interceptor {
//   AuthInterceptor({required this.dio, required this.session});
//
//   final Dio dio;
//   final Session session;
//
//   // late String accessToken = session.userCookie;
//
//   @override
//   void onRequest(
//       RequestOptions options, RequestInterceptorHandler handler) async {
//     // if the request doesn't need token, then just continue to the next interceptor
//     if (options.headers[AppConstant.kRequiresToken] == false) {
//       options.headers
//           .remove(AppConstant.kRequiresToken); //remove the auxiliary header
//       return super.onRequest(options, handler);
//     }
//
//     // check if tokens have already expired or not
//     // Note: ensure your tokens has "exp" claim
//     // accessToken = await SecureStorage() // bhushan
//     //     .readSecureData(key: SecureStorageKey.kAccessToken);
//     // final accessTokenHasExpired = JwtDecoder.isExpired(accessToken);
//     // var _refreshed = true;
//     // if (accessTokenHasExpired) {
//     //   // regenerate access token
//     //   dio.interceptors.requestLock.lock();
//     //   _refreshed = await _regenerateAccessToken();
//     //   dio.interceptors.requestLock.unlock();
//     // }
//
//     // if (_refreshed && accessToken.isNotEmpty) {
//     // add access token to the request header
//     // options.headers["Authorization"] = "$accessToken";
//     // options.headers["Cookie"] = "$accessToken";
//     // options.headers["Authorization"] = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyZXJhQ29udGFjdE51bWJlciI6Ijk4Nzk4Nzk4NzIiLCJ1c2VySWQiOiI2MmIwZGIzM2RlZmZhMTBjMTRhYWY1NzciLCJpYXQiOjE2NTgxMzkwMTN9.934d2cp4VaLB0UvOusjhYLAN9RwHy9I9pzus9aiyFsM";
//     // options.headers["Authorization"] = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyZXJhQ29udGFjdE51bWJlciI6Ijk4Nzk4Nzk4NzEiLCJ1c2VySWQiOiI2MmIwZGIzM2RlZmZhMTBjMTRhYWY1NzYiLCJpYXQiOjE2NTgxNjUxNDJ9.pZB2zlvp8AckPs_0bf0r48KXUnR0wRnam23-O_W5rho";
//     return super.onRequest(options, handler);
//     // } else {
//     //   // create custom dio error
//     //   // options.extra["tokenErrorType"] = TokenErrorType.failedToRegenerateAccessToken;
//     //   final error = DioError(requestOptions: options, type: DioErrorType.other);
//     //   return handler.reject(error);
//     // }
//   }
//
//   @override
//   void onResponse(Response response, ResponseInterceptorHandler handler) {
//     return super.onResponse(response, handler);
//   }
//
//   @override
//   void onError(DioError err, ErrorInterceptorHandler handler) async {
//     return super.onError(err, handler);
//   }
//
//   /// return true if it is successfully regenerate the access token
//   Future<bool> _regenerateAccessToken() async {
//     try {
//       var dio =
//           Dio(); // should create new dio instance because the request interceptor is being locked
//
//       // get refresh token from local storage
//       // final refreshToken = await SecureStorage()
//       //     .readSecureData(key: SecureStorageKey.kAccessToken);
//       String url = EndPointsExtension(Endpoints.refreshToken).name;
//       // make request to server to get the new access token from server using refresh token
//       final response = await dio.get(
//         url,
//         // options: Options(headers: {"Authorization": "$refreshToken"}),
//         // options: Options(headers: {"Cookie": session.userCookie}),
//       );
//
//       if (response.statusCode == HttpStatus.ok ||
//           response.statusCode == HttpStatus.accepted ||
//           response.statusCode == HttpStatus.created) {
//         // accessToken = response.data;
//         // await SecureStorage().writeSecureData(
//         //     key: SecureStorageKey.kAccessToken, value: accessToken); // bhushan
//         return true;
//       } else if (response.statusCode == HttpStatus.badRequest ||
//           response.statusCode == HttpStatus.unauthorized) {
//         // it means your refresh token no longer valid now, it may be revoked by the backend
//         // _performLogout(_dio);
//         // refresh token is wrong
//         // accessToken = '';
//         SecureStorage().deleteAllSecureData();
//         return false;
//       } else {
//         print(response.statusCode);
//         return false;
//       }
//     } on DioError {
//       return false;
//     } catch (e) {
//       return false;
//     }
//   }
// }
