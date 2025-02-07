import 'dart:developer';

import 'package:e_commerce_task/core/di/dependency_injection.dart';
import 'package:e_commerce_task/core/utils/app_strings.dart';
import 'package:e_commerce_task/core/utils/custom_widgets/no_data_widget.dart';
import 'package:e_commerce_task/features/favorites/presentation/cubit/local_favorite_cubit.dart';
import 'package:e_commerce_task/features/favorites/presentation/widgets/custom_favorite_item_small_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesMobileView extends StatefulWidget {
  const FavoritesMobileView({super.key});

  @override
  State<FavoritesMobileView> createState() => _FavoritesMobileViewState();
}

class _FavoritesMobileViewState extends State<FavoritesMobileView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<LocalFavoritesCubit, LocalFavoritesState>(
          bloc: sl<LocalFavoritesCubit>()..getFavoritesSaved(AppStrings.favoritesKey),
          builder: (_, state) {
            if (state is LocalFavoritesSuccessState) {
              if (state.favoriteProducts!.isEmpty) {
                return const NoDataWidget();
              }
              return Flexible(
                child: ListView.builder(
                  itemCount: state.favoriteProducts!.length,
                  itemBuilder: (ctx, index) {
                    log('favorites_length:: ${state.favoriteProducts!.length}');
                    final product = state.favoriteProducts![index];
                    return CustomFavoriteItemSmallWidget(
                      product: product,
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
