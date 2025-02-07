import 'package:bloc/bloc.dart';
import 'package:e_commerce_task/features/favorites/data/repositories/local_favorites_impl.dart';
import 'package:e_commerce_task/features/home/data/models/product_model.dart';

part 'local_favorite_state.dart';

class LocalFavoritesCubit extends Cubit<LocalFavoritesState> {
  final LocalFavoritesImpl repo;

  LocalFavoritesCubit(this.repo) : super(LocalFavoritesLoadingState());

  Future<void> getFavoritesSaved(String key) async {
    emit(LocalFavoritesSuccessState(
      favoriteProducts: await repo.getFavorites(key),
    ));
  }

  Future<void> saveProducts(String key, ProductModel product) async {
    await repo.saveFavoriteProduct(key, product);
    emit(LocalSaveFavoritesSuccessState());
  }

  Future<void> removeProducts(String key, ProductModel product) async {
    await repo.removeFavoriteProduct(key, product);
    emit(LocalRemoveFavoritesSuccessState());
  }

  Future<void> isFavorite(String key, ProductModel product) async {
    final isFavorite = await repo.isFavoriteProduct(key, product);
    emit(LocalIsFavoritesSuccessState(isFavorite));
  }
}
