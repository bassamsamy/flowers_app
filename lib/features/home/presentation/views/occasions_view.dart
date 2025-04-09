import 'package:flowers_app/core/di/di.dart';
import 'package:flowers_app/core/resources/AppColors.dart';
import 'package:flowers_app/core/resources/constants_manger.dart';
import 'package:flowers_app/features/home/domain/entities/occasion_entity.dart';
import 'package:flowers_app/features/home/domain/entities/product_entity.dart';
import 'package:flowers_app/features/home/presentation/cubits/occasion_cubit/occasions_cubit.dart';
import 'package:flowers_app/features/home/presentation/cubits/occasion_cubit/occasions_intent.dart';
import 'package:flowers_app/features/home/presentation/cubits/occasion_cubit/occasions_state.dart';
import 'package:flowers_app/features/home/presentation/views/widgets/custom_tap_bar.dart';
import 'package:flowers_app/features/home/presentation/views/widgets/product_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OccasionsView extends StatefulWidget {
  OccasionsView({super.key});

  @override
  State<OccasionsView> createState() => _OccasionsViewState();
}

class _OccasionsViewState extends State<OccasionsView> {
  OccasionViewModel occasionViewModel = getIt<OccasionViewModel>();
  int currentOccasion = 0;
  List<OccasionEntity> occasions = [
    OccasionEntity(
        id: "673b34c21159920171827ae0", name: "Wedding", slug: "wedding"),
    OccasionEntity(
        id: "673b351e1159920171827ae5", name: "Graduation", slug: "graduation"),
    OccasionEntity(
        id: "673b354b1159920171827ae8", name: "Birthday", slug: "birthday"),
    OccasionEntity(
        id: "673b35c01159920171827aed",
        name: "Anniversary",
        slug: "anniversary"),
    OccasionEntity(
        id: "673b364e1159920171827af9", name: "New Year", slug: "new-year"),
    OccasionEntity(
        id: "673b368c1159920171827afc",
        name: "Valentine's Day",
        slug: "valentine's-day"),
    OccasionEntity(
        id: "673b36e71159920171827b05",
        name: "Mother's Day",
        slug: "mother's-day"),
    OccasionEntity(
        id: "673b37511159920171827b0e",
        name: "Father's Day",
        slug: "father's-day"),
    OccasionEntity(
        id: "673b37a31159920171827b13", name: "Christmas", slug: "christmas"),
    OccasionEntity(
        id: "673b37c41159920171827b16", name: "Easter", slug: "easter"),
  ];

  @override
  void initState() {
    occasionViewModel.doIntent(
      LoadOccasionProductsIntent(
        id: {Constants.occasionParameter: occasions[currentOccasion].id},
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => occasionViewModel,
      child: DefaultTabController(
        length: 10,
        child: Scaffold(
          appBar: AppBar(
            title: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Occasion'),
                Text(
                  'Bloom with our exquisite best sellers',
                  style: TextStyle(fontSize: 15, color: AppColors.darkGrey),
                ),
              ],
            ),
            bottom: CustomTapBar(
                tabs: [
                  'Wedding',
                  'Gradation',
                  'BirthDay',
                  'Anniversary',
                  'New Yeat',
                  'Valentaine\'s day',
                  'Mother\'s day',
                  'Father\'s day',
                  'Chrismath',
                  'Eastern',
                ],
                onTap: (index) {
                  currentOccasion = index;
                  occasionViewModel.doIntent(
                    LoadOccasionProductsIntent(
                      id: {
                        Constants.occasionParameter:
                            occasions[currentOccasion].id
                      },
                    ),
                  );
                }),
            leading: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.blackTextColor,
              size: 25,
            ),
          ),
          body: BlocBuilder<OccasionViewModel, OccasionProductsState>(
            builder: (context, state) {
              if (state is SuccessOccasionProductsState) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 35, horizontal: 16 /*10*/),
                  child: state.products!.isNotEmpty
                      ? ProductGridView(
                          products: state.products!,
                        )
                      : const Center(
                          child: Text(
                            'There is No Products Yet',
                            style: TextStyle(
                              color: AppColors.blackTextColor
                            ),
                          ),
                        ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
