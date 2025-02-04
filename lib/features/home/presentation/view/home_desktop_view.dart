import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce_task/core/di/dependency_injection.dart';
import 'package:e_commerce_task/core/routes/app_routes.dart';
import 'package:e_commerce_task/core/utils/custom_widgets/no_data_widget.dart';
import 'package:e_commerce_task/core/utils/custom_widgets/base_scaffold.dart';
import 'package:e_commerce_task/features/home/presentation/cubit/product_state.dart';
import 'package:e_commerce_task/features/home/presentation/cubit/products_cubit.dart';
import 'package:e_commerce_task/features/home/presentation/widgets/product_item_desktop.dart';
import 'package:e_commerce_task/features/home/presentation/widgets/product_item_mobile.dart';
import 'package:e_commerce_task/features/home/presentation/widgets/product_item_tablet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeDesktopView extends StatelessWidget {
  const HomeDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<ProductCubit, ProductState>(
          builder: (ctx, state) {
            if (state is ProductLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ProductSuccessState) {
              return Flexible(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 15,
                      childAspectRatio: 4 / 4),
                  itemCount: state.productModel?.length,
                  itemBuilder: (ctx, index) {
                    final product = state.productModel?[index];
                    return ProductItemDesktop(
                      product: product!,
                    );
                  },
                ),
              );
            }
            return const NoDataWidget();
          },
        ),
      ],
    );
  }
}
