class UserResponse {
  UserResponse({
    this.id,
    this.name,
    this.picture,
    this.bio,
    this.linkedinUrl,
    this.interests,
    this.title,
    this.role,
    this.emails,
    this.phones,
  });

  UserResponse.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    picture = json['picture'];
    bio = json['bio'];
    linkedinUrl = json['linkedinUrl'];
    interests = json['interests'];
    title = json['title'];
    role = json['role'] != null ? json['role'].cast<String>() : [];
    emails = json['emails'] != null ? json['emails'].cast<String>() : [];
    phones = json['phones'] != null ? json['phones'].cast<String>() : [];
  }

  num? id;
  String? name;
  String? picture;
  String? bio;
  String? linkedinUrl;
  String? interests;
  String? title;
  List<String>? role;
  List<String>? emails;
  List<String>? phones;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['picture'] = picture;
    map['bio'] = bio;
    map['linkedinUrl'] = linkedinUrl;
    map['interests'] = interests;
    map['title'] = title;
    map['role'] = role;
    map['emails'] = emails;
    map['phones'] = phones;
    return map;
  }
}
