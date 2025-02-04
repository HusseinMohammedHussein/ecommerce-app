import 'package:e_commerce_task/core/di/dependency_injection.dart';
import 'package:e_commerce_task/core/helper/route_helper.dart';
import 'package:e_commerce_task/core/utils/app_strings.dart';
import 'package:e_commerce_task/features/home/data/models/product_model.dart';
import 'package:e_commerce_task/features/home/presentation/cubit/products_cubit.dart';
import 'package:e_commerce_task/features/home/presentation/view/home_desktop_view.dart';
import 'package:e_commerce_task/features/home/presentation/view/home_mobile_view.dart';
import 'package:e_commerce_task/features/home/presentation/view/home_tablet_view.dart';
import 'package:e_commerce_task/features/home/presentation/view/home_view.dart';
import 'package:e_commerce_task/features/product_details/presentation/views/product_details_view.dart';
import 'package:e_commerce_task/features/product_details/presentation/widgets/product_details_mobile_widget.dart';
import 'package:e_commerce_task/features/product_details/presentation/widgets/product_details_tablet_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final scaffoldKey = RouteHelper.routeHelper.scaffoldKey;
final customContext =
    RouteHelper.routeHelper.navigationKey.currentState!.context;
final sizeWidth = MediaQuery.sizeOf(customContext).width;
final sizeHeight = MediaQuery.sizeOf(customContext).height;

final routes = GoRouter(
  navigatorKey: RouteHelper.routeHelper.navigationKey,
  initialLocation: AppStrings.homeScreenPath,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: AppStrings.homeScreenPath,
      name: AppStrings.homeScreenPath,
      builder: (ctx, state) => const HomeView(),
      routes: [
        GoRoute(
          path: AppStrings.homeMobileScreenPath,
          name: AppStrings.homeMobileScreenPath,
          builder: (ctx, state) => const HomeMobileView(),
        ),
        GoRoute(
          path: AppStrings.homeTabletScreenPath,
          name: AppStrings.homeTabletScreenPath,
          builder: (ctx, state) => const HomeTabletView(),
        ),
        GoRoute(
          path: AppStrings.homeDesktopScreenPath,
          name: AppStrings.homeDesktopScreenPath,
          builder: (ctx, state) => const HomeDesktopView(),
        ),
      ],
    ),
    GoRoute(
      path: AppStrings.productDetailsScreenPath,
      name: AppStrings.productDetailsScreenPath,
      builder: (ctx, state) {
        final product = state.extra as ProductModel;
        return ProductDetailsView(product: product);
      },
      routes: [
        GoRoute(
          path: AppStrings.productDetailsMobileScreenPath,
          name: AppStrings.productDetailsMobileScreenPath,
          builder: (ctx, state) {
            final product = state.extra as ProductModel;
            return ProductDetailsMobileWidget(product: product);
          },
        ),
        GoRoute(
          path: AppStrings.productDetailsTabletScreenPath,
          name: AppStrings.productDetailsTabletScreenPath,
          builder: (ctx, state) {
            final product = state.extra as ProductModel;
            return ProductDetailsTabletWidget(product: product);
          },
        ),
        GoRoute(
          path: AppStrings.productDetailsDesktopScreenPath,
          name: AppStrings.productDetailsDesktopScreenPath,
          builder: (ctx, state) => const HomeDesktopView(),
        ),
      ],
    ),
  ],
);
