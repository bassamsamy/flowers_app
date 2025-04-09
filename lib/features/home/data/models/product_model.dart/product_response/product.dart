import 'package:flowers_app/features/home/domain/entities/product_entity.dart';

class Product {
  String? id;
  String? title;
  String? slug;
  String? description;
  String? imgCover;
  List<String>? images;
  double? price;
  double? priceAfterDiscount;
  double? quantity;
  String? category;
  String? occasion;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  double? discount;
  double? sold;
  double? rateAvg;
  double? rateCount;
  String? id2;

  Product({
    this.id,
    this.title,
    this.slug,
    this.description,
    this.imgCover,
    this.images,
    this.price,
    this.priceAfterDiscount,
    this.quantity,
    this.category,
    this.occasion,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.discount,
    this.sold,
    this.rateAvg,
    this.rateCount,
    this.id2,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['_id'] as String?,
        title: json['title'] as String?,
        slug: json['slug'] as String?,
        description: json['description'] as String?,
        imgCover: json['imgCover'] as String?,
        images: (json['images'] as List<dynamic>?)?.map((e) => e.toString()).toList(),
        price:(json['price'] as num?)?.toDouble(),
        priceAfterDiscount:(json['priceAfterDiscount'] as num?)?.toDouble(),
        quantity: (json['quantity'] as num?)?.toDouble(),
        category: json['category'] as String?,
        occasion: json['occasion'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
        discount:(json['discount'] as num?)?.toDouble(),
        sold:(json['sold'] as num?)?.toDouble(),
        rateAvg: (json['rateAvg'] as num?)?.toDouble(),
        rateCount: (json['rateCount'] as num?)?.toDouble(),
        id2: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'title': title,
        'slug': slug,
        'description': description,
        'imgCover': imgCover,
        'images': images,
        'price': price,
        'priceAfterDiscount': priceAfterDiscount,
        'quantity': quantity,
        'category': category,
        'occasion': occasion,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
        'discount': discount,
        'sold': sold,
        'rateAvg': rateAvg,
        'rateCount': rateCount,
        'id': id,
      };
  ProductEntity toProductEntity() {
    return ProductEntity(
      category: category,
      description: description,
      discount: discount,
      id: id,
      images: images,
      imgCover:imgCover ,
      occasion: category,
      price: price,
      priceAfterDiscount: priceAfterDiscount,
      quantity: quantity,
      rateAvg: rateAvg,
      rateCount: rateCount,
      slug: slug,
      title: title,
    );
  }
}
