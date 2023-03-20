import 'network/webinar_user_response.dart';

class User {
  User({
    required this.id,
    required this.name,
    required this.picture,
    required this.emails,
    required this.phones,
    required this.webinarCategories,
  });

  int id;
  String? name;
  String? picture;
  String? title;
  List<String>? role;
  List<String>? emails;
  List<String>? phones;
  List<WebinarCategories>? webinarCategories;

  String? get singlePhoneNumber {
    if (phones == null) return null;
    if (phones!.isNotEmpty) {
      return phones!.first;
    }
    return null;
  }

  String? get singleEmail {
    if (emails == null) return null;
    if (emails!.isNotEmpty) {
      return emails!.first;
    }
    return null;
  }

  String? get firstInterestText {
    if (webinarCategories == null) return null;
    if (webinarCategories!.isNotEmpty) {
      return webinarCategories!.first.name;
    }
    return null;
  }
}
