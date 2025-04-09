import 'package:flowers_app/core/di/di.dart';
import 'package:flowers_app/core/resources/AppColors.dart';
import 'package:flowers_app/core/resources/constants_manger.dart';
import 'package:flowers_app/features/home/presentation/views/widgets/custom_tap_bar.dart';
import 'package:flowers_app/features/home/presentation/views/widgets/product_grid_view.dart';
import 'package:flowers_app/features/layout/presentation/views/categories_cubit/categories_cubit.dart';
import 'package:flowers_app/features/layout/presentation/views/categories_cubit/categories_intent.dart';
import 'package:flowers_app/features/layout/presentation/views/categories_cubit/categories_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  CategoryViewModel categoryViewModel = getIt<CategoryViewModel>();
  int currentCategory = 0;
  ScrollController _scrollController = ScrollController();
  bool _isVisible = true;
  double _lastOffset = 0;
  List<CategoryEntity> categories = [
    CategoryEntity(id: "673c46fd1159920171827c85", name: "flowers"),
    CategoryEntity(id: "673c472f1159920171827c8a", name: "gifts"),
    CategoryEntity(id: "673c47441159920171827c8d", name: "elctroots"),
    CategoryEntity(id: "673c47591159920171827c90", name: "Jewellery"),
    CategoryEntity(id: "673c47751159920171827c93", name: "perfumes"),
    CategoryEntity(id: "673c47881159920171827c96", name: "watches"),
    CategoryEntity(id: "673c479e1159920171827c99", name: "chocolate"),
    CategoryEntity(id: "673c4a551159920171827c9e", name: "Cakes"),
    CategoryEntity(id: "673c4a6f1159920171827ca1", name: "Plants"),
    CategoryEntity(id: "673c4a851159920171827ca4", name: "Candles & Diffusers"),
  ];
  @override
  void initState() {
    categoryViewModel.doIntent(
      LoadCategoryProductsIntent(
        id: {Constants.categoryParameter: categories[currentCategory].id},
      ),
    );
    _scrollController.addListener(
      () {
        double current = _scrollController.offset;
        if (current > _lastOffset && _isVisible) {
          setState(
            () {
              _isVisible = false;
            },
          );
        } else if (current < _lastOffset && !_isVisible) {
          setState(
            () {
              _isVisible = true;
            },
          );
        }
        _lastOffset = current;
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => categoryViewModel,
      child: DefaultTabController(
        length: 10,
        child: Scaffold(
          floatingActionButton: Visibility(
            visible: _isVisible,
            child: SizedBox(
              width: 130,
              height: 40,
              child: FloatingActionButton(
                elevation: 0,
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                          padding: const EdgeInsets.all(16),
                          height: 200,
                          child: Column(
                            children: [
                              Slider(
                                onChanged: (value) {},
                                value: 0,
                                max: 300,
                                min: 0,
                                activeColor: AppColors.primaryColor,
                                label: '55',

                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 18),
                                child: Row(
                                  children: [
                                    Text(
                                      '\$0',
                                      style: TextStyle(
                                        color: AppColors.blackTextColor,
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      '\$300',
                                      style: TextStyle(
                                        color: AppColors.blackTextColor,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ));
                    },
                  );
                },
                backgroundColor: AppColors.primaryColor,
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.tune,
                      color: AppColors.backgroundColor,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Filter',
                      style: TextStyle(
                        color: AppColors.backgroundColor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          appBar: AppBar(
            bottom: CustomTapBar(
              tabs: categories.map((element) => '${element.name}').toList(),
              onTap: (index) {
                currentCategory = index;
                categoryViewModel.doIntent(
                  LoadCategoryProductsIntent(
                    id: {
                      Constants.categoryParameter:
                          categories[currentCategory].id
                    },
                  ),
                );
              },
            ),
            title: const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: SizedBox(
                width: 271,
                height: 48,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                  ),
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Container(
                  width: 65,
                  height: 48,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(color: AppColors.darkGrey),
                      borderRadius: BorderRadius.circular(8)),
                  child: IconButton(
                    icon: Icon(Icons.sort),
                    onPressed: () {},
                  ),
                ),
              )
            ],
            automaticallyImplyLeading: false,
          ),
          body: BlocBuilder<CategoryViewModel, CategoryProductsState>(
            builder: (context, state) {
              if (state is SuccessCategoryProductsState) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 35, horizontal: 16 /*10*/),
                  child: state.products!.isNotEmpty
                      ? ProductGridView(
                          products: state.products!,
                          scrollController: _scrollController,
                        )
                      : const Center(
                          child: Text(
                            'There is No Products Yet',
                            style: TextStyle(color: AppColors.blackTextColor),
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

class CategoryEntity {
  String? name;
  String? id;
  CategoryEntity({required this.id, required this.name});
}
