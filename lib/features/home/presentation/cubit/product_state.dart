import 'package:e_commerce_task/features/home/data/models/product_model.dart';

sealed class ProductState {}

class ProductInitState extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductSuccessState extends ProductState {
  List<ProductModel>? productModel;

  ProductSuccessState(this.productModel);
}

class ProductFailureState extends ProductState {
  String message;

  ProductFailureState(this.message);
}
