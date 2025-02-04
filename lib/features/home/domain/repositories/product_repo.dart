import 'package:dartz/dartz.dart';
import 'package:e_commerce_task/core/error/failure.dart';
import 'package:e_commerce_task/features/home/data/models/product_model.dart';

abstract class ProductRepo {
  Future<Either<Failure, List<ProductModel>>> getProducts();
}
