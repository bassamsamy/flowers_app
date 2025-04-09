import 'metadata.dart';
import 'product.dart';

class ProductResponse {
  String? message;
  Metadata? metadata;
  List<Product>? products;

  ProductResponse({this.message, this.metadata, this.products});

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
      message: json['message'] as String?,
      metadata: json['metadata'] == null
          ? null
          : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'metadata': metadata?.toJson(),
        'products': products?.map((e) => e.toJson()).toList(),
      };
}
