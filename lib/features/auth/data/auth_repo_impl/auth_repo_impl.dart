import 'package:flowers_app/core/models/result.dart';
import 'package:injectable/injectable.dart';
import '../../domain/auth_repo/auth_repo.dart';
import '../auth_data_source/auth_data_source.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthDataSource _authService;

  AuthRepoImpl(this._authService);

  @override
  Future<Result> login(String email, String password) =>
      _authService.login(email, password);

  Future<Result> signup(String email, String password) => _authService.signUp(
        email: email,
        password: password,
        gender: 'gender_placeholder',
        firstName: 'firstName_placeholder',
        lastName: 'lastName_placeholder',
        phoneNumber: 'phoneNumber_placeholder',
        profileImage: 'profileImage_placeholder',
        isVerified: false,
        role: 'role_placeholder',
        wishlist: [],
        id: 'id_placeholder',
        addresses: [],
        createdAt: DateTime.now(),
        token: 'token_placeholder',
      );

  @override
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
  }) {
    // Example implementation
    return Future.error(UnimplementedError('signUp method is not implemented'));
  }
}