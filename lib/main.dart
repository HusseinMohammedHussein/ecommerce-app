import 'package:bloc/bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'package:e_commerce_task/EcommerceApp.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'core/di/dependency_injection.dart';
import 'core/utils/bloc_observer/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  // for remove '#' in web url
  // setUrlStrategy(PathUrlStrategy());

  // DI
  setupDependencyInjection();

  runApp(
    DevicePreview(
      enabled: false,
      builder: (ctx) => const EcommerceApp(),
    ),
  );
}
