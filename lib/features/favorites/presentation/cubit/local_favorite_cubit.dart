import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_task/features/home/data/models/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'local_favorite_state.dart';

class LocalFavoritesCubit extends Cubit<LocalFavoritesState> {
  // final LocalFavoritesImpl repo;

  LocalFavoritesCubit() : super(LocalFavoritesLoadingState());

  Future<void> getFavoritesSaved(String key) async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? favoritesList = prefs.getStringList(key);

    if (favoritesList != null) {
      final favorites = favoritesList
          .map((jsonString) => ProductModel.fromJson(json.decode(jsonString)))
          .toList();
      // final favorites = await repo.getFavorites(key);
      emit(LocalFavoritesSuccessState(favoriteProducts: favorites));
    } else {
      emit(LocalFavoritesSuccessState(favoriteProducts: []));
    }
  }

  Future<void> saveProducts(String key, ProductModel product) async {
    final prefs = await SharedPreferences.getInstance();

    List<String>? favoritesList = prefs.getStringList(key);

    favoritesList ??= [];

    favoritesList.add(json.encode(product.toJson()));

    log('saveProducts:: $favoritesList');
    await prefs.setStringList(key, favoritesList);
    // await repo.saveFavoriteProduct(key, product);
    emit(LocalSaveFavoritesSuccessState());
  }

  Future<void> removeProducts(String key, ProductModel product) async {
    emit(LocalFavoritesLoadingState());
    final prefs = await SharedPreferences.getInstance();

    List<String>? favoritesList = prefs.getStringList(key);

    favoritesList ??= [];

    favoritesList.remove(json.encode(product.toJson()));

    log('saveProducts:: $favoritesList');
    await prefs.setStringList('peopleList', favoritesList);
    // await repo.removeFavoriteProduct(key, product);
    emit(LocalRemoveFavoritesSuccessState());
  }

  Future<bool> isFavorite(String key, String productId) async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? productsList = prefs.getStringList(key);
    if (productsList!.isNotEmpty) {
      return productsList.contains(productId);
    }
    return false;
  }
}
