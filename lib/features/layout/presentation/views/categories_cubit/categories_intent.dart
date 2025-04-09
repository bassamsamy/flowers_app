
abstract class CategoryProductsIntent {}

class LoadCategoryProductsIntent extends CategoryProductsIntent {
  LoadCategoryProductsIntent(
  {
    required this.id,
  }
  );
  Map<String,dynamic>id;
}
