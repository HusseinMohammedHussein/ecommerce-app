import 'package:e_commerce_task/core/utils/custom_widgets/base_scaffold.dart';
import 'package:e_commerce_task/core/utils/custom_widgets/responsive_layout.dart';
import 'package:e_commerce_task/features/home/data/models/product_model.dart';
import 'package:e_commerce_task/features/product_details/presentation/widgets/product_details_desktop_widget.dart';
import 'package:e_commerce_task/features/product_details/presentation/widgets/product_details_mobile_widget.dart';
import 'package:e_commerce_task/features/product_details/presentation/widgets/product_details_tablet_widget.dart';
import 'package:flutter/material.dart';

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
      body: ResponsiveLayout(
        mobileView: ProductDetailsMobileWidget(
          product: product,
        ),
        tabletView: ProductDetailsTabletWidget(
          product: product,
        ),
        desktopView: ProductDetailsDesktopWidget(
          product: product,
        ),
      ),
    );
  }
}
