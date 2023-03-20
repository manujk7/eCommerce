import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/constants/constants.dart';

class MockCookieInterceptor extends Interceptor {
  MockCookieInterceptor(this.mockCookie);

  String mockCookie;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // if the request doesn't need token, then just continue to the next interceptor
    if (options.headers[AppConstant.kRequiresToken] == false) {
      options.headers
          .remove(AppConstant.kRequiresToken); //remove the auxiliary header
      return super.onRequest(options, handler);
    }

    options.headers["Cookie"] = mockCookie;

    return super.onRequest(options, handler);
  }


}
