import 'package:flowers_app/core/models/result.dart';

abstract class AuthDataSource {
  Future<Result> login(String email, String password);
  Future<Result> signUp({
    required String email,
    required String password,
    required String gender,
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String profileImage,
    required String role,
    required List<String> wishlist,
    required String id,
    required List<String> addresses,
    required DateTime createdAt,
    required String token,
    required bool isVerified,
  });
}