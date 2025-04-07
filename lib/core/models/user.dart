import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    String? message,
    User? user,
    String? token,
  }) {
    _message = message;
    _user = user;
    _token = token;
  }

  User.fromJson(dynamic json) {
    _message = json['message'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _token = json['token'];
  }
  String? _message;
  User? _user;
  String? _token;
  User copyWith({
    String? message,
    User? user,
    String? token,
  }) =>
      User(
        message: message ?? _message,
        user: user ?? _user,
        token: token ?? _token,
      );
  String? get message => _message;
  User? get user => _user;
  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['token'] = _token;
    return map;
  }
}

/// firstName : "Elevate"
/// lastName : "Tech"
/// email : "peshoo@gmail.com"
/// gender : "male"
/// phone : "+201282383626"
/// photo : "default-profile.png"
/// role : "user"
/// wishlist : []
/// _id : "67f3fdda836ee8be7064852b"
/// addresses : []
/// createdAt : "2025-04-07T16:31:22.337Z"

User userSignFromJson(String str) => User.fromJson(json.decode(str));
String userSignToJson(User data) => json.encode(data.toJson());

class UserSign {
  UserSign({
    String? firstName,
    String? lastName,
    String? email,
    String? gender,
    String? phone,
    String? photo,
    String? role,
    List<dynamic>? wishlist,
    String? id,
    List<dynamic>? addresses,
    String? createdAt,
  }) {
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _gender = gender;
    _phone = phone;
    _photo = photo;
    _role = role;
    _wishlist = wishlist;
    _id = id;
    _addresses = addresses;
    _createdAt = createdAt;
  }

  UserSign.fromJson(dynamic json) {
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _email = json['email'];
    _gender = json['gender'];
    _phone = json['phone'];
    _photo = json['photo'];
    _role = json['role'];
    if (json['wishlist'] != null) {
      _wishlist = [];
      json['wishlist'].forEach((v) {
        _wishlist?.add(v);
      });
    }
    _id = json['_id'];
    if (json['addresses'] != null) {
      _addresses = [];
      json['addresses'].forEach((v) {
        _addresses?.add(v);
      });
    }
    _createdAt = json['createdAt'];
  }
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _gender;
  String? _phone;
  String? _photo;
  String? _role;
  List<dynamic>? _wishlist;
  String? _id;
  List<dynamic>? _addresses;
  String? _createdAt;
  UserSign copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? gender,
    String? phone,
    String? photo,
    String? role,
    List<dynamic>? wishlist,
    String? id,
    List<dynamic>? addresses,
    String? createdAt,
  }) =>
      UserSign(
        firstName: firstName ?? _firstName,
        lastName: lastName ?? _lastName,
        email: email ?? _email,
        gender: gender ?? _gender,
        phone: phone ?? _phone,
        photo: photo ?? _photo,
        role: role ?? _role,
        wishlist: wishlist ?? _wishlist,
        id: id ?? _id,
        addresses: addresses ?? _addresses,
        createdAt: createdAt ?? _createdAt,
      );
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get email => _email;
  String? get gender => _gender;
  String? get phone => _phone;
  String? get photo => _photo;
  String? get role => _role;
  List<dynamic>? get wishlist => _wishlist;
  String? get id => _id;
  List<dynamic>? get addresses => _addresses;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['email'] = _email;
    map['gender'] = _gender;
    map['phone'] = _phone;
    map['photo'] = _photo;
    map['role'] = _role;
    if (_wishlist != null) {
      map['wishlist'] = _wishlist?.map((v) => v.toJson()).toList();
    }
    map['_id'] = _id;
    if (_addresses != null) {
      map['addresses'] = _addresses?.map((v) => v.toJson()).toList();
    }
    map['createdAt'] = _createdAt;
    return map;
  }
}
