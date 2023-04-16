import 'dart:collection';

import 'package:flutter/foundation.dart' show immutable;

import 'package:qwique/state/auth/typedef/user_id.dart';
import 'package:qwique/state/constants/firebase_field_name.dart';

@immutable
class UserInfoPayload extends MapView<String, String> {
  UserInfoPayload(
      {required UserId userId,
      required String? displayName,
      required String? email})
      : super(
          {
            FirebaseFieldName.userId: userId,
            FirebaseFieldName.displayName: displayName ?? '',
            FirebaseFieldName.email: email ?? ''
          },
        );
}
