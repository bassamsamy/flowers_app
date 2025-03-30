class ErrorModel {
  ErrorModel({this.message, this.code});

  ErrorModel.fromJson(dynamic json, {String? error}) {
    message =
        json['error'] ?? "Unknown error occurred"; // default error message
    if (json.containsKey('code')) {
      code = json['code'];
    }
  }

  String? message;
  int? code; // Optional error code

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (code != null) {
      map['code'] = code;
    }
    return map;
  }

// Optional method to convert the error model to a string representation
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ErrorModel &&
          runtimeType == other.runtimeType &&
          message == other.message;

  @override
  int get hashCode => message.hashCode;
}
