import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:e_commerce_task/core/database/dio_consumer.dart';
import 'package:e_commerce_task/core/error/failure.dart';
import 'package:e_commerce_task/core/utils/app_strings.dart';
import 'package:e_commerce_task/features/home/data/models/product_model.dart';
import 'package:e_commerce_task/features/home/domain/repositories/product_repo.dart';

class ProductRepoImpl extends ProductRepo {
  final DioConsumer dioConsumer;

  ProductRepoImpl(this.dioConsumer);

  @override
  Future<Either<Failure, List<ProductModel>>> getProducts() async {
    try {
      final List<dynamic> response = await dioConsumer.get(AppStrings.products);
      List<ProductModel> productsResponse = response.map((item) => ProductModel.fromJson(item)).toList();
      log('response:: $productsResponse');
      return Right(productsResponse);
    } catch (e) {
      return Left(
        ServerFailure(e.toString()),
      );
    }
  }
}
