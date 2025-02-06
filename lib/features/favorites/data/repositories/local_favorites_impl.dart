import 'dart:convert';
import 'dart:developer';

import 'package:e_commerce_task/features/favorites/domain/repositories/local_favorites_repo.dart';
import 'package:e_commerce_task/features/home/data/models/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalFavoritesImpl extends LocalFavoritesRepo {
  LocalFavoritesImpl();

  @override
  Future<List<ProductModel>?> getFavorites(String key) async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? favoritesList = prefs.getStringList(key);

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
    final prefs = await SharedPreferences.getInstance();

    List<String>? favoritesList = prefs.getStringList(key);

    favoritesList ??= [];

    favoritesList.remove(json.encode(product.toJson()));

    log('saveProducts:: $favoritesList');
    await prefs.setStringList('peopleList', favoritesList);
  }

  @override
  Future<void> saveFavoriteProduct(String key, ProductModel product) async {
    final prefs = await SharedPreferences.getInstance();

    List<String>? favoritesList = prefs.getStringList(key);

    favoritesList ??= [];

    favoritesList.add(json.encode(product.toJson()));

    log('saveProducts:: $favoritesList');
    await prefs.setStringList('peopleList', favoritesList);
  }
}
