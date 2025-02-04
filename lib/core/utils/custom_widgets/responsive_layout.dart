import 'dart:developer';

import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileView;
  final Widget tabletView;
  final Widget desktopView;

  const ResponsiveLayout({
    super.key,
    required this.mobileView,
    required this.tabletView,
    required this.desktopView,
  });

  final int mobileWidth = 600;
  final int tabletWidth = 1024;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        final sizeWidth = constraints.maxWidth;
        log('screen_width:: $sizeWidth');
        if (sizeWidth < mobileWidth) {
          return mobileView;
        } else if (sizeWidth < tabletWidth) {
          return tabletView;
        } else {
          return desktopView;
        }
      },
    );
  }
}
