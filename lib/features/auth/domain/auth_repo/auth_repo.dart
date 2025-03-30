import '../../../../core/models/result.dart';

abstract class AuthRepo {
  Future<Result> login(String email, String password);
  Future<Result> signUp({
    required String email,
    required String gender,
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String profileImage,
    required bool isVerified,
    required String role,
    required List<String> wishlist,
    required String id,
    required List<String> addresses,
    required DateTime createdAt,
  });
}
