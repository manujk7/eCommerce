import 'package:flutter_flavor/flutter_flavor.dart';

import '../../core/constants/constants.dart';

class Api {
  static final String baseUrl =
      FlavorConfig.instance.variables[ApiConstantKey.kBaseUrl];
  static final String apiKey =
      FlavorConfig.instance.variables[ApiConstantKey.kAPIKey];

  // static final bool isLocalJson =
  //     FlavorConfig.instance.variables[ApiConstantKey.kIsLocalJSON];
  static const int receiveTimeout = 60000;
  static const int connectionTimeout = 60000;
  static const int sendTimeout = 60000;
}
