// import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:e_commerce_task/core/network/dio_consumer.dart';
import 'package:e_commerce_task/features/home/data/models/product_model.dart';
import 'package:e_commerce_task/features/home/data/repositories/product_repo_impl.dart';
import 'package:e_commerce_task/features/home/presentation/cubit/products_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setupDependencyInjection() {
  sl.registerSingleton<DioConsumer>(DioConsumer());

  sl.registerSingleton<ProductRepoImpl>(ProductRepoImpl(sl()));
  sl.registerSingleton<ProductCubit>(ProductCubit(sl()));
}
