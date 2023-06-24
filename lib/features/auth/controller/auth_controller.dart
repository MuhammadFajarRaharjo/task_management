import 'package:hooks_riverpod/hooks_riverpod.dart';

final authControllerProvider = Provider((ref) {
  return AuthController();
});

class AuthController {}
