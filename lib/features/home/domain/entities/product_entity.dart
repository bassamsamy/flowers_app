class ProductEntity {
  ProductEntity({
    this.category,
    this.description,
    this.discount,
    this.id,
    this.images,
    this.imgCover,
    this.occasion,
    this.price,
    this.priceAfterDiscount,
    this.quantity,
    this.rateAvg,
    this.rateCount,
    this.slug,
    this.title,
  });
  double? rateAvg;
  double? rateCount;
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
  double? discount;
}
