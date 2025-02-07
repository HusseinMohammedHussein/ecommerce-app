part of 'local_favorite_cubit.dart';

sealed class LocalFavoritesState {}

class LocalFavoritesLoadingState extends LocalFavoritesState {}

class LocalFavoritesSuccessState extends LocalFavoritesState {
  List<ProductModel>? favoriteProducts;

  LocalFavoritesSuccessState({
    required this.favoriteProducts,
  });
}

class LocalSaveFavoritesSuccessState extends LocalFavoritesState {}

class LocalRemoveFavoritesSuccessState extends LocalFavoritesState {}

class LocalIsFavoritesSuccessState extends LocalFavoritesState {
  bool isFavorite;

  LocalIsFavoritesSuccessState(this.isFavorite);
}
