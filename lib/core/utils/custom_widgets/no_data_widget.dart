import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce_task/core/routes/app_routes.dart';
import 'package:flutter/material.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: sizeWidth * 0.5,
        alignment: Alignment.center,
        padding: EdgeInsetsDirectional.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          border: Border.all(color: Colors.black26, width: 1),
        ),
        child: AutoSizeText(
          'NO DATA FOR NOW!',
          style: TextStyle(
            color: Colors.redAccent,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
