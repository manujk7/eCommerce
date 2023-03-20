// ignore_for_file: avoid_print, unused_catch_clause
import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:e_commerce_app/core/errors/exceptions.dart';
import 'package:e_commerce_app/core/utils/logger.dart';
import 'package:e_commerce_app/domain/data_service.dart';
import 'package:e_commerce_app/domain/session_manager.dart';

import '../../core/network/network_info.dart';
import 'api.dart';
import 'api_end_point.dart';
import 'handle_exceptions.dart';
import 'interceptors/log_interceptor.dart';

class DioFacade {
  late Dio _dio;

  DioFacade(Session session) {
    _dio = Dio(BaseOptions(
      sendTimeout: Api.sendTimeout,
      connectTimeout: Api.connectionTimeout,
      receiveTimeout: Api.receiveTimeout,
      // baseUrl: Api.baseUrl,
    ));
    _dio.interceptors.clear();

    // _dio.interceptors.add(session.cookieManager());

    _dio.interceptors.add(CustomLogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true));
  }

  Future<dynamic> get({
    required Endpoints endpoint,
    Map<String, dynamic>? queryParameters,
    String? query,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      String url;
      if (query != null && query.isNotEmpty) {
        url = "${EndPointsExtension(endpoint).name}/$query";
      } else {
        url = EndPointsExtension(endpoint).name;
      }
      String jsonFile = JsonFileExtension(endpoint).name;

      final response = await request(
          url: url,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
          method: Method.GET,
          jsonFileName: jsonFile);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> delete({
    required Endpoints endpoint,
    String? query,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      String url;
      if (query != null && query.isNotEmpty) {
        url = "${EndPointsExtension(endpoint).name}/$query";
      } else {
        url = EndPointsExtension(endpoint).name;
      }
      String jsonFile = JsonFileExtension(endpoint).name;

      final response = await request(
          url: url,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
          method: Method.DELETE,
          jsonFileName: jsonFile);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> patch({
    required Endpoints endpoint,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      String url = EndPointsExtension(endpoint).name;
      String jsonFile = JsonFileExtension(endpoint).name;
      final response = await request(
          url: url,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
          method: Method.PATCH,
          jsonFileName: jsonFile);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> post({
    required Endpoints endpoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      String url = EndPointsExtension(endpoint).name;
      print(url);
      print(queryParameters);
      print(data);
      String jsonFile = JsonFileExtension(endpoint).name;

      final response = await request(
          url: url,
          queryParameters: queryParameters,
          data: data,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
          method: Method.POST,
          jsonFileName: jsonFile);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> put({
    required Endpoints endpoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    FormData? formData,
    Options? options,
    String? query,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      String url;
      if (query != null && query.isNotEmpty) {
        url = "${EndPointsExtension(endpoint).name}/$query";
      } else {
        url = EndPointsExtension(endpoint).name;
      }
      String jsonFile = JsonFileExtension(endpoint).name;
      final response = await request(
          url: url,
          queryParameters: queryParameters,
          data: formData ?? data,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
          method: Method.PUT,
          jsonFileName: jsonFile);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> sendForm({
    required Endpoints endpoint,
    Map<String, dynamic>? queryParameters,
    required FormData formData,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      String url = EndPointsExtension(endpoint).name;
      String jsonFile = JsonFileExtension(endpoint).name;
      final response = await request(
        url: url,
        queryParameters: queryParameters,
        data: formData,
        options: Options(
          headers: options?.headers,
          contentType: 'multipart/form-data',
        ),
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        method: Method.POST,
        jsonFileName: jsonFile,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> download({
    Options? options,
    String? filePath,
    String? downloadUrl,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await request(
        url: downloadUrl ?? '',
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        method: Method.DOWNLOAD,
        filePath: filePath,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> request(
      {required String url,
      required Method method,
      String? jsonFileName,
      String? filePath,
      String? downloadUrl,
      data,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress,
      Map<String, dynamic>? queryParameters}) async {
    Response response;

    try {
      // if (false) {
      // } else {
        final isConnected = await NetworkInfoImpl(Connectivity()).isConnected();
        if (!isConnected) {
          throw const SocketException("No Internet Connection");
        }

        if (method == Method.POST) {
          response = await _dio.post(url,
              queryParameters: queryParameters,
              data: data,
              options: options,
              cancelToken: cancelToken,
              onSendProgress: onSendProgress,
              onReceiveProgress: onReceiveProgress);
        } else if (method == Method.PUT) {
          response = await _dio.put(url,
              queryParameters: queryParameters,
              data: data,
              options: options,
              cancelToken: cancelToken,
              onReceiveProgress: onReceiveProgress);
        } else if (method == Method.DELETE) {
          response = await _dio.delete(url,
              queryParameters: queryParameters,
              data: data,
              options: options,
              cancelToken: cancelToken);
        } else if (method == Method.PATCH) {
          response = await _dio.patch(url,
              queryParameters: queryParameters,
              data: data,
              options: options,
              cancelToken: cancelToken,
              onReceiveProgress: onReceiveProgress);
        } else if (method == Method.DOWNLOAD) {
          response = await _dio.get(
            url,
            cancelToken: cancelToken,
            queryParameters: queryParameters,
            onReceiveProgress: onReceiveProgress,
            options: options,
          );
          return response;
        } else {
          response = await _dio.get(url,
              queryParameters: queryParameters,
              options: options,
              cancelToken: cancelToken,
              onReceiveProgress: onReceiveProgress);
        }
      // }
      // NetworkResponse genericResponse = NetworkResponse.fromJson(response.data);
      // if (genericResponse.status!) {
      //   return genericResponse.data;
      // } else {
      //   throw genericResponse.message ?? "Something wen't wrong";
      // }

      return response;
    } on SocketException catch (e) {
      throw NoInternetException();
    } on FormatException catch (e) {
      throw "Bad response format";
    } on DioError catch (e, s) {
      Logger.log("DioError while fetching api - $e", stackTrace: s);
      if (e.response?.statusCode == 302) {
        return e.response;
      } else if (e.response?.statusCode == 401) {
        throw UserLoggedOutError();
      } else {
        if (kReleaseMode) {
          // FirebaseCrashlytics.instance.recordError(e, s);
          throw "server_error_message".tr;
        } else {
          final errorMessage = HandleExceptions.fromDioError(e).toString();
          throw errorMessage;
        }
      }
    } catch (e, s) {
      Logger.log("Error while fetching api - $e", stackTrace: s);
      // throw e.toString();
      if (kReleaseMode) {
        // FirebaseCrashlytics.instance.recordError(e, s);
        throw "server_error_message".tr;
      } else {
        throw e.toString();
      }
    }
  }

  Future<dynamic> getJsonFileData({
    String? jsonFile,
  }) async {
    try {
      final response = await jsonLocalrequest(jsonFileName: jsonFile);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> jsonLocalrequest({
    String? jsonFileName,
  }) async {
    Response response;
    try {
      final jsonString = await rootBundle.loadString(jsonFileName!);
      await Future.delayed(const Duration(milliseconds: 900));
      response = Response(
        data: jsonDecode(jsonString),
        requestOptions: RequestOptions(path: ''),
      );

      // NetworkResponse genericResponse = NetworkResponse.fromJson(response.data);
      // if (genericResponse.status!) {
      //   return genericResponse.data;
      // } else {
      //   throw genericResponse.message ?? "Something wen't wrong";
      // }
      return response.data;
    } on SocketException catch (e) {
      throw "No Internet Connection";
    } on FormatException catch (e) {
      throw "Bad response format";
    } on DioError catch (e) {
      final errorMessage = HandleExceptions.fromDioError(e).toString();
      throw errorMessage;
    } catch (e) {
      throw "Something wen't wrong";
    }
  }
}
