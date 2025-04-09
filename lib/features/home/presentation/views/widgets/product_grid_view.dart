import 'package:flowers_app/features/home/domain/entities/product_entity.dart';
import 'package:flowers_app/features/home/presentation/views/widgets/product_widget.dart';
import 'package:flutter/material.dart';

class ProductGridView extends StatelessWidget {
  ProductGridView({required this.products,this.scrollController});
  List<ProductEntity> products;
  final ScrollController ? scrollController;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller:scrollController ,
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 17,
        mainAxisSpacing: 16,
        childAspectRatio: 153 / 229, 
      ),
      itemBuilder: (context, index) => ProductWidget(
        product: products[index],
      ),
    );
  }
}
