import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_task/features/home/data/repositories/product_repo_impl.dart';
import 'package:e_commerce_task/features/home/presentation/cubit/products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductRepoImpl productRepoImpl;

  ProductsCubit(this.productRepoImpl) : super(ProductsInitState());

  Future getProducts() async {
    emit(ProductsLoadingState());
    final response = await productRepoImpl.getProducts();
    response.fold(
      (error) {
        log('error: ${error.errorMessage}');
        emit(ProductsFailureState(error.errorMessage));
      },
      (data) {
        log('product_item:: ${data.first.title}');
        emit(ProductsSuccessState(data));
      },
    );
  }
}
