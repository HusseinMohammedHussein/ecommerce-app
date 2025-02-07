import 'package:e_commerce_task/core/database/dio_consumer.dart';
import 'package:e_commerce_task/core/database/local/cache_helper.dart';
import 'package:e_commerce_task/features/favorites/data/repositories/local_favorites_impl.dart';
import 'package:e_commerce_task/features/favorites/presentation/cubit/local_favorite_cubit.dart';
import 'package:e_commerce_task/features/home/data/repositories/product_repo_impl.dart';
import 'package:e_commerce_task/features/home/presentation/cubit/products_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setupDependencyInjection() {
  sl.registerSingleton<CacheHelper>(CacheHelper());
  sl<CacheHelper>().init();
  sl.registerSingleton<DioConsumer>(DioConsumer());

  sl.registerSingleton<ProductRepoImpl>(ProductRepoImpl(sl()));
  sl.registerSingleton<ProductsCubit>(ProductsCubit(sl()));

  sl.registerSingleton<LocalFavoritesImpl>(LocalFavoritesImpl(CacheHelper()));
  sl.registerFactory<LocalFavoritesCubit>(() => LocalFavoritesCubit(sl()));
}
