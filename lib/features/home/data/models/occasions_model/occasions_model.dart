import 'metadata.dart';
import 'occasion.dart';

class OccasionsModel {
  String? message;
  Metadata? metadata;
  List<Occasion>? occasions;

  OccasionsModel({this.message, this.metadata, this.occasions});

  factory OccasionsModel.fromJson(Map<String, dynamic> json) {
    return OccasionsModel(
      message: json['message'] as String?,
      metadata: json['metadata'] == null
          ? null
          : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      occasions: (json['occasions'] as List<dynamic>?)
          ?.map((e) => Occasion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'metadata': metadata?.toJson(),
        'occasions': occasions?.map((e) => e.toJson()).toList(),
      };
}
