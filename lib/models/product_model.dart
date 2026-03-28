import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
// ignore: must_be_immutable
class ProductModel extends Equatable {
  List<ProductModel> products = [];
  final int id;
  final String categories;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final Rating ratingModel;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.categories,
    required this.price,
    required this.imageUrl,
    required this.ratingModel,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      categories: json['category'],
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
      imageUrl: json['image'],
      ratingModel: Rating.fromJson(json['rating']),
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, title, description, price, imageUrl, ratingModel, categories];
}

class Rating extends Equatable {
  final double rate;
  final int count;

  const Rating({required this.rate, required this.count});
  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(rate: (json['rate'] as num).toDouble(), count: json['count']);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [rate, count];
}
