import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce_task/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BaseScaffold extends StatelessWidget {
  final Widget body;
  final String? title;

  const BaseScaffold({
    super.key,
    required this.body,
    this.title,
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
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              leading: IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: Icon(Icons.arrow_back_ios),
              ),
            )
          : null,
      body: body,
    );
  }
}
