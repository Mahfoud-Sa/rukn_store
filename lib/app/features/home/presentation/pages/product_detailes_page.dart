import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rukn_store/app/features/home/data/modules/product.dart';
import 'package:rukn_store/app/features/home/presentation/widgets/rating_widget.dart';

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
                'Price: \$${product.price}',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
              SizedBox(height: 10),
              RatingStarsWidget(
                rating: product.rating!,
              )
            ],
          ),
        ),
      ),
    );
  }
}
