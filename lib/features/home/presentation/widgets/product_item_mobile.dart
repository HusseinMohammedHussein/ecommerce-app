import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_task/core/di/dependency_injection.dart';
import 'package:e_commerce_task/core/utils/app_strings.dart';
import 'package:e_commerce_task/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductItemMobile extends StatelessWidget {
  final ProductModel product;

  const ProductItemMobile({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        log('item_click_title:: ${product.title}}');
        context.pushNamed(AppStrings.productDetailsScreenPath, extra: product);
      },
      child: Container(
        margin: EdgeInsetsDirectional.symmetric(horizontal: 15, vertical: 7),
        padding: EdgeInsetsDirectional.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: Colors.black26)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: '${product.image}',
              height: 100,
              width: 100,
              fit: BoxFit.contain,
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText(
                    '${product.title}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    maxFontSize: 18,
                    minFontSize: 15,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  AutoSizeText(
                    '${product.price} LE',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
