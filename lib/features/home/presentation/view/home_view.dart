import 'package:e_commerce_task/core/di/dependency_injection.dart';
import 'package:e_commerce_task/core/utils/custom_widgets/base_scaffold.dart';
import 'package:e_commerce_task/core/utils/custom_widgets/responsive_layout.dart';
import 'package:e_commerce_task/features/home/presentation/cubit/products_cubit.dart';
import 'package:e_commerce_task/features/home/presentation/view/home_desktop_view.dart';
import 'package:e_commerce_task/features/home/presentation/view/home_mobile_view.dart';
import 'package:e_commerce_task/features/home/presentation/view/home_tablet_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: BlocProvider(
        create: (ctx) => sl<ProductCubit>()..getProducts(),
        child: const ResponsiveLayout(
          mobileView: HomeMobileView(),
          tabletView: HomeTabletView(),
          desktopView: HomeDesktopView(),
        ),
      ),
    );
  }
}
