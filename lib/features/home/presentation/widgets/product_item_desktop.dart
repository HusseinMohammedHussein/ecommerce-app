import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_task/core/routes/app_routes.dart';
import 'package:e_commerce_task/core/utils/app_strings.dart';
import 'package:e_commerce_task/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductItemDesktop extends StatelessWidget {
  final ProductModel product;

  const ProductItemDesktop({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        log('item_click_title:: ${product.title}');
        context.pushNamed(AppStrings.productDetailsScreenPath, extra: product);
      },
      child: Container(
        margin:
            const EdgeInsetsDirectional.symmetric(horizontal: 15, vertical: 7),
        padding: const EdgeInsetsDirectional.all(20),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: Colors.black26)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: CachedNetworkImage(
                imageUrl: '${product.image}',
                height: 230,
                width: sizeWidth,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            AutoSizeText(
              '${product.title}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              maxFontSize: 20,
              minFontSize: 16,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            AutoSizeText(
              '${product.price} LE',
              maxFontSize: 22,
              minFontSize: 18,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
