import 'package:injectable/injectable.dart';
import '../../../../core/models/result.dart';
import '../auth_repo/auth_repo.dart';

@injectable
class SignUpUseCase {
  final AuthRepo _authRepo;

  SignUpUseCase(this._authRepo);
  Future<Result> call(Map<String, dynamic> userData,
      {required bool isVerified}) {
    return _authRepo.signUp(
      email: userData['email'],
      gender: userData['gender'],
      firstName: userData['firstName'],
      lastName: userData['lastName'],
      phoneNumber: userData['phoneNumber'],
      profileImage: userData['profileImage'],
      isVerified: isVerified,
      role: userData['role'],
      wishlist: List<String>.from(userData['wishlist'] ?? []),
      id: userData['_id'],
      addresses: List<String>.from(userData['addresses'] ?? []),
      createdAt: DateTime.parse(userData['createdAt']),
    );
  }
}

enum Role { user, admin }

class SignUpRequest {
  final String email;
  final String gender;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String profileImage;
  final bool isVerified;
  final String role;
  final List<String> wishlist;
  final String id;
  final List<String> addresses;
  final DateTime createdAt;

  SignUpRequest({
    required this.email,
    required this.gender,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.profileImage,
    required this.isVerified,
    required this.role,
    required this.wishlist,
    required this.id,
    required this.addresses,
    required this.createdAt,
  });
}

Future<Result> signUp(SignUpRequest request) {
  return Future.error(UnimplementedError('signUp method is not implemented'));
}
