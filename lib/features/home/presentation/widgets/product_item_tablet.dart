import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_task/core/routes/app_routes.dart';
import 'package:e_commerce_task/core/utils/app_strings.dart';
import 'package:e_commerce_task/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductItemTablet extends StatelessWidget {
  final ProductModel product;

  const ProductItemTablet({
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
        margin: const EdgeInsetsDirectional.symmetric(horizontal: 15, vertical: 7),
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
                height: 250,
                width: sizeWidth,
                fit: BoxFit.contain,
              ),
            ),
            Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ConstrainedBox(
                      constraints:
                          BoxConstraints(maxWidth: sizeWidth, maxHeight: 40),
                      child: AutoSizeText(
                        '${product.title}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        maxFontSize: 22,
                        minFontSize: 14,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 22),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AutoSizeText(
                      '${product.price} LE',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
