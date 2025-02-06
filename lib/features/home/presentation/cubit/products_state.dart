import 'package:e_commerce_task/features/home/data/models/product_model.dart';

sealed class ProductsState {}

class ProductsInitState extends ProductsState {}

class ProductsLoadingState extends ProductsState {}

class ProductsSuccessState extends ProductsState {
  List<ProductModel>? productModel;

  ProductsSuccessState(this.productModel);
}

class ProductsFailureState extends ProductsState {
  String message;

  ProductsFailureState(this.message);
}
