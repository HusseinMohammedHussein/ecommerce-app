import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  int? id;
  String? title;
  String? image;
  String? description;
  String? category;
  double? price;

  ProductModel({
    this.id,
    this.title,
    this.image,
    this.description,
    this.category,
    this.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
