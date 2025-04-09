import 'package:flutter/material.dart';

import '../../../../../core/models/best_seller_model.dart';
import '../../../../../core/resources/AppColors.dart';
import 'CusttomSectionWidget.dart';

class BestSellerSectionWidget extends StatelessWidget {
  final List<BestSellerModel> products;

  const BestSellerSectionWidget({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SectionWidget(
      title: 'Best Seller',
      onViewAllTap: () {},
      child: SizedBox(
        height: 230,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          separatorBuilder: (_, __) => const SizedBox(width: 12),
          itemBuilder: (context, index) {
            final product = products[index];
            return SizedBox(
              width: 140,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      product.image ?? '',
                      height: 140,
                      width: 140,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(product.name ?? "", style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  Text("${product.price} EGP", style: const TextStyle(fontSize: 12, color: AppColors.grey)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
