
import 'package:e_commerce_task/core/utils/custom_widgets/no_data_widget.dart';
import 'package:e_commerce_task/features/home/presentation/cubit/products_state.dart';
import 'package:e_commerce_task/features/home/presentation/cubit/products_cubit.dart';
import 'package:e_commerce_task/features/home/presentation/widgets/product_item_mobile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeMobileView extends StatelessWidget {
  const HomeMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<ProductsCubit, ProductsState>(
          builder: (ctx, state) {
            if (state is ProductsSuccessState) {
              return Flexible(
                child: ListView.builder(
                  itemCount: state.productModel?.length,
                  itemBuilder: (ctx, index) {
                    final product = state.productModel?[index];
                    return ProductItemMobile(
                      product: product!,
                    );
                  },
                ),
              );
            }
            if (state is ProductsLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return const NoDataWidget();
          },
        ),
      ],
    );
  }
}
