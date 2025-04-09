class BestSellerModel {
  String? id;
  String? name;
  String? image;
  double? price;

  BestSellerModel({this.id, this.name, this.image, this.price});

  factory BestSellerModel.fromJson(Map<String, dynamic> json) {
    return BestSellerModel(
      id: json['_id'],
      name: json['title'],
      image: json['imageCover'],
      price: (json['price'] as num?)?.toDouble(),
    );
  }
}
