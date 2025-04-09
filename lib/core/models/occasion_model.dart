class OccasionModel {
  String? id;
  String? name;
  String? image;

  OccasionModel({this.id, this.name, this.image});

  factory OccasionModel.fromJson(Map<String, dynamic> json) {
    return OccasionModel(
      id: json['_id'],
      name: json['name'],
      image: json['image'],
    );
  }
}
