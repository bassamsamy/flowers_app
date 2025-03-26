class UserModel {
  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  String? phoneNumber;
  String? profileImage;
  String? role;
  List<dynamic>? wishlist;
  List<String>? addresses;
  String? id;
  String? token;
  DateTime? createdAt;

  UserModel({
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.phoneNumber,
    this.profileImage,
    this.role,
    this.wishlist,
    this.addresses,
    this.id,
    this.token,
    this.createdAt,
  });

  UserModel._();

  static final UserModel _singletonInstance = UserModel._();

  static UserModel get instance => _singletonInstance;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json['user']?['firstName'],
      lastName: json['user']?['lastName'],
      email: json['user']?['email'],
      gender: json['user']?['gender'],
      phoneNumber: json['user']?['phone'],
      profileImage: json['user']?['photo'],
      role: json['user'] / ['role'],
      wishlist: json['user']?['wishlist'] ?? [],
      addresses: List<String>.from(json['user']?['addresses'] ?? []),
      id: json['user']?['_id'],
      token: json['token'],
      createdAt: json['user']?['createdAt'] != null
          ? DateTime.parse(json['user']?['createdAt'])
          : null,
    );
  }
}

/* "message": "success",
    "user": {
        "firstName": "Elevate",
        "lastName": "Tech",
        "email": "mostafamagde227@gmail.com",
        "gender": "male",
        "phone": "+201010700999",
        "photo": "default-profile.png",
        "role": "user",
        "wishlist": [],
        "_id": "67e46910836ee8be7062ec46",
        "addresses": [],
        "createdAt": "2025-03-26T20:52:32.720Z"
    },
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiNjdlNDY5MTA4MzZlZThiZTcwNjJlYzQ2Iiwicm9sZSI6InVzZXIiLCJpYXQiOjE3NDMwMjIzNTJ9.FQn_mkAZHpC7vE6QHQ3Jz_zVdKudhFw__T7vB4EeC9Y"*/
