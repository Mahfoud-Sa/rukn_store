import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rukn_store/app/features/home/data/modules/product.dart';

class RatingStarsWidget extends StatelessWidget {
  final Rating rating;

  RatingStarsWidget({
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: List.generate(5, (index) {
            if (index < rating.rate!.toInt()) {
              return Icon(Icons.star, color: Colors.yellow);
            } else {
              return Icon(Icons.star_border, color: Colors.grey);
            }
          }),
        ),
        SizedBox(width: 8), // add some space between the stars and the text
        Text(
          '(${rating.count})',
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }
}

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  ProductDetailsPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title!),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Image.network(product.image!),
              SizedBox(height: 20),
              Text(
                product.title!,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(product.description!),
              SizedBox(height: 20),
              Text(
                '\$${product.price}',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  for (int i = 0; i < 5; i++)
                    Icon(Icons.star, color: Colors.yellow),
                  for (int i = 0; i < 5 - 2; i++)
                    Icon(Icons.star_border, color: Colors.grey),
                  Text(' (_product.rating/5)'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
