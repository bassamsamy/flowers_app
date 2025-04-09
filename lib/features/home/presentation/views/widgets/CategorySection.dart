import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/models/category_model.dart';
import '../../../../../core/resources/AppColors.dart';
import 'CusttomSectionWidget.dart';

class CategorySectionWidget extends StatelessWidget {
  final List<CategoryModel> categories;

  const CategorySectionWidget({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return SectionWidget(
      title: 'Categories',
      onViewAllTap: () {}, // Handle View All if needed
      child: SizedBox(
        height: 100,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          separatorBuilder: (_, __) => const SizedBox(width: 12),
          itemBuilder: (context, index) {
            final category = categories[index];
            return Column(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.primaryColor.withOpacity(0.1),
                  child: Icon(Icons.category, color: AppColors.primaryColor),
                ),
                const SizedBox(height: 4),
                Text(category.name ?? "", style: const TextStyle(fontSize: 12)),
              ],
            );
          },
        ),
      ),
    );
  }
}
