import 'package:e_commerce_app/core/app_export.dart';
import 'package:e_commerce_app/data/apiClient/api.dart';
import 'package:e_commerce_app/domain/constants/api_routes.dart';
import 'package:e_commerce_app/domain/data_service.dart';
import 'package:e_commerce_app/domain/models/network/user_response.dart';
import 'package:e_commerce_app/domain/models/network/webinar_user_response.dart';
import 'package:e_commerce_app/domain/models/user.dart';
import 'package:e_commerce_app/domain/session_manager.dart';

class UpdateUserUseCase {
  final DataService _dataService;
  final Session _session;

  UpdateUserUseCase(this._dataService, this._session);

  Future<void> execute({bool isSilent: true}) async {
    try {
      UserResponse? userResponse =
          await _dataService.fetchJsonFromNetwork<UserResponse>(
        Method.GET,
        ApiRoute.currentUser,
        baseUrl: Api.baseUrl,
        version: ApiVersion.v0,
        mapper: (json) => UserResponse.fromJson(json),
      );

      if (userResponse != null) {
        List<WebinarUserResponse>? webinarUserResponse =
            await _dataService.fetchListFromNetwork<WebinarUserResponse>(
          Method.GET,
          ApiRoute.user,
          queryParameters: {
            "_expand": "webinarCategories",
            "userId": userResponse.id
          },
          mapper: (json) => WebinarUserResponse.fromJson(json),
        );

        List<WebinarCategories>? webinarCategories;

        if (webinarUserResponse?.isNotEmpty == true) {
          webinarCategories = webinarUserResponse!.first.webinarCategories;
        }

        User user = User(
            id: userResponse.id?.toInt() ?? -1,
            name: userResponse.name,
            picture: userResponse.picture,
            phones: userResponse.phones,
            emails: userResponse.emails,
            webinarCategories: webinarCategories);
        await _session.update(user);
      }
    } catch (ex, st) {
      if (!isSilent) {
        rethrow;
      }
      Logger.log("Error while getting user - $ex", stackTrace: st);
    }
  }
}
