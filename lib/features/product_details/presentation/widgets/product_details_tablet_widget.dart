import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_task/core/routes/app_routes.dart';
import 'package:e_commerce_task/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductDetailsTabletWidget extends StatefulWidget {
  final ProductModel product;

  const ProductDetailsTabletWidget({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailsTabletWidget> createState() =>
      _ProductDetailsTabletWidgetState();
}

class _ProductDetailsTabletWidgetState
    extends State<ProductDetailsTabletWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsetsDirectional.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              CachedNetworkImage(
                imageUrl: widget.product.image!,
                width: sizeWidth,
                height: 250,
              ),
              PositionedDirectional(
                  end: 20,
                  bottom: 0,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsetsDirectional.all(15),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.red),
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 2,
                            )
                          ]),
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.red,
                        size: 30,
                      ),
                    ),
                  ))
            ],
          ),
          SizedBox(
            height: 50,
          ),
          AutoSizeText(
            widget.product.title!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AutoSizeText(
                '${widget.product.price} LE',
                maxFontSize: 22,
                minFontSize: 18,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              AutoSizeText.rich(
                TextSpan(children: [
                  TextSpan(
                      text: 'Category: ',
                      style: TextStyle(color: Colors.black38)),
                  TextSpan(
                      text: widget.product.category,
                      style: TextStyle(color: Colors.black54)),
                ]),
                maxFontSize: 18,
                minFontSize: 15,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText('Description',
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                      fontSize: 18)),
              Container(
                width: sizeWidth * 0.05,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: Colors.grey,
                  width: 3,
                ))),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          AutoSizeText(
            widget.product.description!,
            maxFontSize: 18,
            minFontSize: 15,
            textAlign: TextAlign.justify,
            style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w800,
                fontSize: 18),
          ),
        ],
      ),
    );
  }
}
