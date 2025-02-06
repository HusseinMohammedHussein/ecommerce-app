import 'package:e_commerce_task/core/utils/custom_widgets/base_scaffold.dart';
import 'package:e_commerce_task/core/utils/custom_widgets/responsive_layout.dart';
import 'package:e_commerce_task/features/favorites/presentation/cubit/local_favorite_cubit.dart';
import 'package:e_commerce_task/features/favorites/presentation/views/favorites_desktop_view.dart';
import 'package:e_commerce_task/features/favorites/presentation/views/favorites_mobile_view.dart';
import 'package:e_commerce_task/features/favorites/presentation/views/favorites_tablet_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        body: BlocProvider(
      create: (_) => LocalFavoritesCubit(),
      child: const ResponsiveLayout(
        mobileView: FavoritesMobileView(),
        tabletView: FavoritesTabletView(),
        desktopView: FavoritesDesktopView(),
      ),
    ));
  }
}
