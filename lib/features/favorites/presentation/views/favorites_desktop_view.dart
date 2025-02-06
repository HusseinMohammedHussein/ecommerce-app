import 'package:e_commerce_task/core/utils/app_strings.dart';
import 'package:e_commerce_task/core/utils/custom_widgets/no_data_widget.dart';
import 'package:e_commerce_task/features/favorites/presentation/cubit/local_favorite_cubit.dart';
import 'package:e_commerce_task/features/favorites/presentation/widgets/custom_favorite_item_big_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesDesktopView extends StatelessWidget {
  const FavoritesDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<LocalFavoritesCubit, LocalFavoritesState>(
          bloc: LocalFavoritesCubit()..getFavoritesSaved(AppStrings.favoritesKey),
          builder: (ctx, state) {
            if (state is LocalFavoritesSuccessState) {
              if (state.favoriteProducts.isEmpty) {
                return const NoDataWidget();
              }
              return Flexible(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 15,
                      childAspectRatio: 4 / 4),
                  itemCount: state.favoriteProducts.length,
                  itemBuilder: (ctx, index) {
                    final product = state.favoriteProducts[index];
                    return CustomFavoriteItemBigWidget(
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
