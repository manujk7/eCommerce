enum Endpoints { refreshToken, webinarCategories }

extension EndPointsExtension on Endpoints {
  String get name {
    String endpoint;
    switch (this) {
      case Endpoints.refreshToken:
        endpoint = '/refreshToken';
        break;
      case Endpoints.webinarCategories:
        endpoint = '/users?_expand=webinarCategories&userId=9';
        break;
    }
    return endpoint;
  }
}

extension JsonFileExtension on Endpoints {
  String get name {
    String jsonFile = "";
    switch (this) {
      case Endpoints.refreshToken:
      case Endpoints.webinarCategories:
      default:
        break;
    }
    return jsonFile;
  }
}
