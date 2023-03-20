class WebinarUserResponse {
  WebinarUserResponse({
    this.id,
    this.userId,
    this.webinarCategories,
  });

  WebinarUserResponse.fromJson(dynamic json) {
    id = json['id'];
    userId = json['userId'];
    if (json['webinarCategories'] != null) {
      webinarCategories = [];
      json['webinarCategories'].forEach((v) {
        webinarCategories?.add(WebinarCategories.fromJson(v));
      });
    }
  }

  num? id;
  num? userId;
  List<WebinarCategories>? webinarCategories;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['userId'] = userId;
    if (webinarCategories != null) {
      map['webinarCategories'] =
          webinarCategories?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class WebinarCategories {
  WebinarCategories({
    this.id,
    this.name,
  });

  WebinarCategories.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }

  num? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }
}
