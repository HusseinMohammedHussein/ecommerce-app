import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_task/core/routes/app_routes.dart';
import 'package:e_commerce_task/core/utils/app_strings.dart';
import 'package:e_commerce_task/features/favorites/presentation/cubit/local_favorite_cubit.dart';
import 'package:e_commerce_task/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDetailsSmallWidget extends StatefulWidget {
  final ProductModel product;

  const CustomDetailsSmallWidget({
    super.key,
    required this.product,
  });

  @override
  State<CustomDetailsSmallWidget> createState() =>
      _CustomDetailsSmallWidgetState();
}

class _CustomDetailsSmallWidgetState extends State<CustomDetailsSmallWidget> {
  ValueNotifier<bool> isFavorite = ValueNotifier<bool>(false);

  LocalFavoritesCubit? favoriteCubit;

  @override
  void initState() {
    super.initState();
    isFavoriteCubit();
  }

  Future<bool> isFavoriteCubit() async {
    return isFavorite.value = await favoriteCubit!.isFavorite(
      AppStrings.favoritesKey,
      widget.product.id.toString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    favoriteCubit = BlocProvider.of<LocalFavoritesCubit>(context);
    log('isFavorite.value:: ${isFavorite.value}');
    log('isFavoriteCubit:: $isFavoriteCubit');
    return SingleChildScrollView(
      padding: const EdgeInsetsDirectional.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              CachedNetworkImage(
                imageUrl: widget.product.image!,
                width: sizeWidth,
                height: 200,
              ),
              PositionedDirectional(
                end: 20,
                bottom: 0,
                child: GestureDetector(
                  onTap: () {
                    log('message');
                    setState(() {
                      isFavorite.value = !isFavorite.value;
                    });
                    favoriteCubit?.saveProducts(
                        AppStrings.favoritesKey, widget.product);
                  },
                  child: Container(
                    padding: const EdgeInsetsDirectional.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.red),
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 2,
                          )
                        ]),
                    child: ValueListenableBuilder(
                      valueListenable: isFavorite,
                      builder: (_, value, w) => Icon(
                        value ? Icons.favorite : Icons.favorite_border,
                        color: value ? Colors.red : Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          AutoSizeText(
            widget.product.title!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          AutoSizeText(
            '${widget.product.price} LE',
            maxFontSize: 22,
            minFontSize: 18,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          AutoSizeText.rich(
            TextSpan(children: [
              const TextSpan(
                  text: 'Category: ', style: TextStyle(color: Colors.black38)),
              TextSpan(
                text: widget.product.category,
                style: const TextStyle(color: Colors.black54),
              ),
            ]),
            maxFontSize: 18,
            minFontSize: 15,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AutoSizeText('Description',
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                      fontSize: 18)),
              Container(
                width: sizeWidth * 0.1,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey,
                      width: 3,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          AutoSizeText(
            widget.product.description!,
            maxFontSize: 18,
            minFontSize: 15,
            textAlign: TextAlign.justify,
            style: const TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w800,
                fontSize: 18),
          ),
        ],
      ),
    );
  }
}
