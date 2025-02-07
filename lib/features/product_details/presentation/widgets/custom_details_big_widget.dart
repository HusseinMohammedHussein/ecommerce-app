import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_task/core/di/dependency_injection.dart';
import 'package:e_commerce_task/core/routes/app_routes.dart';
import 'package:e_commerce_task/core/utils/app_strings.dart';
import 'package:e_commerce_task/features/favorites/presentation/cubit/local_favorite_cubit.dart';
import 'package:e_commerce_task/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDetailsBigWidget extends StatefulWidget {
  final ProductModel product;

  const CustomDetailsBigWidget({
    super.key,
    required this.product,
  });

  @override
  State<CustomDetailsBigWidget> createState() => _CustomDetailsBigWidgetState();
}

class _CustomDetailsBigWidgetState extends State<CustomDetailsBigWidget> {
  ValueNotifier<bool> isFavorite = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    final favoriteCubit = BlocProvider.of<LocalFavoritesCubit>(context);
    return SingleChildScrollView(
      padding: const EdgeInsetsDirectional.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              CachedNetworkImage(
                imageUrl: widget.product.image!,
                width: sizeWidth,
                height: 250,
              ),
              PositionedDirectional(
                end: 20,
                bottom: 0,
                child: BlocConsumer<LocalFavoritesCubit, LocalFavoritesState>(
                  bloc: sl<LocalFavoritesCubit>()
                    ..isFavorite(
                      AppStrings.favoritesKey,
                      widget.product,
                    ),
                  listener: (_, Object? state) {
                    if (state is LocalIsFavoritesSuccessState) {
                      log('state.isFavorite:: ${state.isFavorite}');
                      isFavorite.value = state.isFavorite;
                    }
                  },
                  builder: (_, state) {
                    return GestureDetector(
                      onTap: () async {
                        if (isFavorite.value) {
                          favoriteCubit.removeProducts(
                              AppStrings.favoritesKey, widget.product);
                        } else {
                          favoriteCubit.saveProducts(
                              AppStrings.favoritesKey, widget.product);
                        }
                        setState(() {
                          isFavorite.value = !isFavorite.value;
                        });
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
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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
              AutoSizeText.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                        text: 'Category: ',
                        style: TextStyle(color: Colors.black38)),
                    TextSpan(
                        text: widget.product.category,
                        style: const TextStyle(color: Colors.black54)),
                  ],
                ),
                maxFontSize: 18,
                minFontSize: 15,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AutoSizeText(
                'Description',
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              Container(
                width: sizeWidth * 0.05,
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
