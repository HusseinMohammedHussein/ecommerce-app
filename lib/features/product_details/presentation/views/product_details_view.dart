import 'package:e_commerce_task/core/utils/custom_widgets/base_scaffold.dart';
import 'package:e_commerce_task/core/utils/custom_widgets/responsive_layout.dart';
import 'package:e_commerce_task/features/favorites/presentation/cubit/local_favorite_cubit.dart';
import 'package:e_commerce_task/features/home/data/models/product_model.dart';
import 'package:e_commerce_task/features/product_details/presentation/widgets/custom_details_small_widget.dart';
import 'package:e_commerce_task/features/product_details/presentation/widgets/custom_details_big_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProductDetailsView extends StatelessWidget {
  final ProductModel product;

  const ProductDetailsView({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: product.title,
      body: BlocProvider(
        create: (_) => LocalFavoritesCubit(),
        child: ResponsiveLayout(
          mobileView: CustomDetailsSmallWidget(
            product: product,
          ),
          tabletView: CustomDetailsBigWidget(
            product: product,
          ),
          desktopView: CustomDetailsBigWidget(
            product: product,
          ),
        ),
      ),
    );
  }
}
