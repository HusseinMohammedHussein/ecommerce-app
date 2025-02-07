import 'package:e_commerce_task/features/home/data/models/product_model.dart';

abstract class LocalFavoritesRepo {
  Future<List<ProductModel>?> getFavorites(String key);

  Future<void> saveFavoriteProduct(String key, ProductModel product);

  Future<void> removeFavoriteProduct(String key, ProductModel product);

  Future<bool> isFavoriteProduct(String key, ProductModel productModel);
}
