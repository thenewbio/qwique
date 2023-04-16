import 'package:flutter/foundation.dart' show immutable;

@immutable
class AuthConstants {
  static const accountExistsWithDifferentCredentialsError =
      'account-exists-with-different-credential';
  static const googleCom = 'google.com';
  static const emailScope = 'email';
  const AuthConstants._();
}
