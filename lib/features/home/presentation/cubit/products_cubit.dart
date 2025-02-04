import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_task/core/di/dependency_injection.dart';
import 'package:e_commerce_task/features/home/data/models/product_model.dart';
import 'package:e_commerce_task/features/home/data/repositories/product_repo_impl.dart';
import 'package:e_commerce_task/features/home/presentation/cubit/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepoImpl productRepoImpl;

  ProductCubit(this.productRepoImpl) : super(ProductInitState());

  Future getProducts() async {
    emit(ProductLoadingState());
    final response = await productRepoImpl.getProducts();
    response.fold(
      (error) {
        log('error: ${error.errorMessage}');
        emit(ProductFailureState(error.errorMessage));
      },
      (data) {
        log('product_item:: ${data.first.title}');
        emit(ProductSuccessState(data));
      },
    );
  }
}
