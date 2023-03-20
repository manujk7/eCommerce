class ApiConstantKey {
  static const kWebinarBaseUrl = 'BaseUrl';
  static const kBaseUrl = 'https://dummyjson.com';
  static const kAPIKey = 'APIKey';
  // static const kDBName = 'DBName';
  // static const kDBPwd = 'DBPwd';
  // static const kIsLocalJSON = 'IsLocalJSON';
  static const kGrantYpe = 'GrantType';
  static const kImageUrl = 'ImageUrl';
  static const kMockUserCookie = 'MockUser';
}

class SecureStorageKey {
  static const kAccessToken = 'AccessToken';
  static const kProfile = "Profile";
  static const kPassword = "Password";
}

class AppConstant {
  static const kMobileNumber = 'MobileNumber';
  static const kRequiresToken = "RequiresToken";
  static const kAuthorization = "Authorization";
  // static const kFileMaxSize = "FileMaxSize";
}

class RegularExpression {
  static const pan = '[A-Z]{5}[0-9]{4}[A-Z]{1}';
  static const dob = '^([0-9]{4})-([0-9]{2})-([0-9]{2})';
  static const aadhaar = '^[2-9]{1}[0-9]{3}[0-9]{4}[0-9]{4}';
  static const voter = '^([a-zA-Z]){3}([0-9]){7}';
  static const drivingLicense =
      '^(([A-Z]{2}[0-9]{2})|([A-Z]{2}-[0-9]{2}))((19|20)[0-9][0-9])[0-9]{7}\$';
  static const passport = '^[A-PR-WYa-pr-wy][1-9]\\d\\s?\\d{4}[1-9]\$';
  static const pinCode = '^[1-9][0-9]{5}\$';
  static const mobile = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  static const email =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static const text = '^[A-Za-z]\$';
  static const number = '^[0-9]\$';
  static const name = r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$";
  static const amount = r'^\d+$';
  static const password = r'^.{6,}$';
}

class ImageUrl {
  static const String url = 'http://crnodejs01.eastus.cloudapp.azure.com:3003/';
  static const String placeHolder =
      'assets/visitor/avatar-1663871388998image_picker_0783A54E-18F2-4665-B3AF-846EB651BD57.jpg';
}

class IntegrationKeys {
  static const String razorpay_key = "RazorpayKey";
  static const String kLinkedinClientId = 'LinkedinClientId';
  static const String kLinkedinCallbackUrl = 'LinkedinCallbackUrl';
  static const String kMixpanelKey = 'MixpanelKey';
}
