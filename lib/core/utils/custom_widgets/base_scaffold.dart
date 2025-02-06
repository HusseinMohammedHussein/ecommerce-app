import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce_task/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BaseScaffold extends StatelessWidget {
  final Widget body;
  final String? title;
  final bool? isHomeScreen;

  const BaseScaffold({
    super.key,
    required this.body,
    this.title,
    this.isHomeScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: title != null
          ? AppBar(
              backgroundColor: Colors.white,
              title: AutoSizeText(
                title!,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              leading: IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: const Icon(Icons.arrow_back_ios),
              ),
            )
          : AppBar(),
      body: body,
      floatingActionButton: isHomeScreen!
          ? GestureDetector(
              onTap: () {
                context.pushNamed(AppStrings.favoriteScreenPath);
              },
              child: Container(
                padding: const EdgeInsetsDirectional.all(20),
                // alignment: Alignment.center,
                decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: const AutoSizeText(
                  'My Favorites',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ))
          : const Offstage(),
    );
  }
}
