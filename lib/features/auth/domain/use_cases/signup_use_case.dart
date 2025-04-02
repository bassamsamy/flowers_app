import 'package:injectable/injectable.dart';
import '../../../../core/models/result.dart';
import '../auth_repo/auth_repo.dart';

@injectable
class SignUpUseCase {
  final AuthRepo _authRepo;

  SignUpUseCase(this._authRepo);
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
