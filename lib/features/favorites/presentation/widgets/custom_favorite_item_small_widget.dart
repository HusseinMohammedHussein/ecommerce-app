
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_task/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';

class CustomFavoriteItemSmallWidget extends StatelessWidget {
  final ProductModel product;

  const CustomFavoriteItemSmallWidget({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.symmetric(horizontal: 15, vertical: 7),
      padding: const EdgeInsetsDirectional.all(10),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
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
          const SizedBox(
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
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 20,
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
            ),
          ),
        ],
      ),
    );
  }
}
