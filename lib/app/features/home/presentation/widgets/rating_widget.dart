import 'package:flutter/material.dart';
import 'package:rukn_store/app/features/home/data/modules/product.dart';
import 'package:rukn_store/app/features/home/data/modules/rating.dart';

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
