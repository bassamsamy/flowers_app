
abstract class OccasionProductsIntent {}

class LoadOccasionProductsIntent extends OccasionProductsIntent {
  LoadOccasionProductsIntent(
  {
    required this.id,
  }
  );
  Map<String,dynamic>id;
}
