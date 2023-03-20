class ApiVersion {
  static final String v0 = '';
  static final String v1 = '/v1';
}

class ApiRoute {
  static final String user = '/users';
  static final String currentUser = '/users/current';
  static final String deleteAccount = '/users/delete-account';
  static final String userPhone = '/users/phone';
  static final String updateFCMToken = '/users/add-device-token';
  static final String orders = '/orders';
  static final String audioBooksListen = '/audio-books/listen';
  static final String magicLink = '/auth/magic-link';
  static final String magicLinkCallback = '/auth/magic-link/callback';
}
