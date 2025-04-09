import 'package:flutter/material.dart';

import '../../../../../core/models/occasion_model.dart';
import 'CusttomSectionWidget.dart';

class OccasionSectionWidget extends StatelessWidget {
  final List<OccasionModel> occasions;

  const OccasionSectionWidget({super.key, required this.occasions});

  @override
  Widget build(BuildContext context) {
    return SectionWidget(
      title: 'Occasion',
      onViewAllTap: () {},
      child: SizedBox(
        height: 140,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: occasions.length,
          separatorBuilder: (_, __) => const SizedBox(width: 12),
          itemBuilder: (context, index) {
            final occasion = occasions[index];
            return Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    occasion.image ?? '',
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 4),
                Text(occasion.name ?? "", style: const TextStyle(fontSize: 12)),
              ],
            );
          },
        ),
      ),
    );
  }
}
