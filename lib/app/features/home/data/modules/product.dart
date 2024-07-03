import 'dart:async';
import 'dart:convert';

class Product {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  // String? rating;

  Product({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    //this.rating
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'].toDouble();
    description = json['description'];
    category = json['category'];
    image = json['image'];
    // rating = json['rating'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['description'] = this.description;
    data['category'] = this.category;
    data['image'] = this.image;

    return data;
  }
}

class Rating {
  final double? rate;
  final int? count;

  const Rating({this.rate, this.count});

  factory Rating.fromJson(Map<String, String> json) =>
      Rating(count: json['count'] as int, rate: json['rate'] as double);
}
