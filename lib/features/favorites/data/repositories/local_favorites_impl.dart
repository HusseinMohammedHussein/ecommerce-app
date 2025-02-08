import 'dart:convert';
import 'dart:developer';

import 'package:e_commerce_task/core/database/local/cache_helper.dart';
import 'package:e_commerce_task/features/favorites/domain/repositories/local_favorites_repo.dart';
import 'package:e_commerce_task/features/home/data/models/product_model.dart';

class LocalFavoritesImpl extends LocalFavoritesRepo {
  CacheHelper cacheHelper;

  LocalFavoritesImpl(this.cacheHelper);

  @override
  Future<List<ProductModel>?> getFavorites(String key) async {
    List<String>? favoritesList = cacheHelper.getStringList(key: key);

    if (favoritesList != null) {
      return favoritesList
          .map((jsonString) => ProductModel.fromJson(json.decode(jsonString)))
          .toList();
    } else {
      return [];
    }
  }

  @override
  Future<void> removeFavoriteProduct(String key, ProductModel product) async {
    List<String>? favoritesList = cacheHelper.getStringList(key: key);

    favoritesList ??= [];

    favoritesList.remove(json.encode(product.toJson()));

    log('removeProduct:: $favoritesList');
    log('ProductsLength_after_remove:: ${favoritesList.length}');
    await cacheHelper.saveStringList(key: key, list: favoritesList);
  }

  @override
  Future<void> saveFavoriteProduct(String key, ProductModel product) async {
    List<String>? favoritesList = cacheHelper.getStringList(key: key);

    favoritesList ??= [];

    favoritesList.add(json.encode(product.toJson()));

    log('saveProducts:: $favoritesList');
    await cacheHelper.saveStringList(key: key, list: favoritesList);
  }

  @override
  Future<bool> isFavoriteProduct(String key, ProductModel productModel) async {
    List<String>? productsList = cacheHelper.getStringList(key: key);
    var isFavorite = false;
    if (productsList != null) {
      final id = productsList.map((pro) => json.decode(pro)).toList();
      List<ProductModel> getProducts =
          id.map((x) => ProductModel.fromJson(x)).toList();
      for (var product in getProducts) {
        isFavorite = product.id == productModel.id;
        log('isFavorite $isFavorite');
      }
    }
    return isFavorite;
  }
}
