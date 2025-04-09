import 'package:flowers_app/features/home/presentation/views/widgets/BestSellerSection.dart';
import 'package:flowers_app/features/home/presentation/views/widgets/CategorySection.dart';
import 'package:flowers_app/features/home/presentation/views/widgets/OccasionSection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';
import '../cubits/HomeCubit.dart';
import '../cubits/HomeState.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<HomeCubit>()..loadHomeData(),
      child: Scaffold(
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            final cubit = context.read<HomeCubit>();

            if (state is HomeLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is HomeError) {
              return Center(child: Text(state.message));
            }

            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CategorySectionWidget(categories: cubit.categories),
                  const SizedBox(height: 16),
                  BestSellerSectionWidget(products: cubit.bestSellers),
                  const SizedBox(height: 16),
                  OccasionSectionWidget(occasions: cubit.occasions),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
