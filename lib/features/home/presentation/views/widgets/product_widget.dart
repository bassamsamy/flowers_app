import 'package:flowers_app/core/resources/AppColors.dart';
import 'package:flowers_app/core/widgets/CustomBtn.dart';
import 'package:flowers_app/features/home/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  ProductWidget({
    required this.product,
  });
  ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.white70,
          )),
      child: Column(
        children: [
          Image.network(
            product.imgCover!,
            fit: BoxFit.cover,
            height: 131, 
            width: 147,
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title!,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.blackTextColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 4, 
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'EGP ${formatDouble(product.priceAfterDiscount!)}',
                      style: const TextStyle(
                        color: AppColors.blackTextColor,
                      ),
                    ),
                    Text(
                      '${formatDouble(
                        product.price!,
                      )}',
                      style: const TextStyle(
                        color: AppColors.darkGrey,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: AppColors.darkGrey,
                      ),
                    ),
                    Text(
                      '${formatDouble(product.discount!)}%',
                      style: const TextStyle(
                        color: AppColors.successColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              minimumSize:const Size(147, 30),
              padding:const EdgeInsets.only(
                top: 10,
                right: 24,
                bottom: 10,
                left: 16,
              ),
              foregroundColor: AppColors.backgroundColor,
              backgroundColor: AppColors.primaryColor,
              disabledBackgroundColor: AppColors.darkGrey,
              shape: const StadiumBorder(
                side: BorderSide(
                  color: AppColors.grey,
                ),
              ),
            ),
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: AppColors.backgroundColor,
              size: 15,
            ),
            label: const Text(
              'Add to cart',
              style: TextStyle(
                fontSize: 13,
              ),
            ),
          )
        ],
      ),
    );
  }
}

String formatDouble(double value) {
  if (value == value.toInt()) {
    return value.toInt().toString();
  } else {
    return value.toString();
  }
}
