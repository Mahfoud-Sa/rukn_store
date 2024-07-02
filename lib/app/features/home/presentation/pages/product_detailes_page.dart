import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rukn_store/app/features/home/data/modules/product.dart';

class ProductDetailesPage extends StatefulWidget {
  final Product product;
  const ProductDetailesPage({super.key, required this.product});

  @override
  State<ProductDetailesPage> createState() => _ProductDetailesPageState();
}

class _ProductDetailesPageState extends State<ProductDetailesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        alignment: Alignment.bottomCenter,
        // fit: StackFit.loose,
        children: [
          Image.network(widget.product.image!),
          Positioned(
            bottom: 0,
            child: Container(
              height: 450, //MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(50)),
              child: Padding(
                padding: const EdgeInsets.only(top: 25.0, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      widget.product.title!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "Price: 2500\$",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ExpansionTile(
                      title: const Text(
                        'Description',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      children: [
                        Text(
                          widget.product.description!,
                          //   overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // RatingStarsWidget(
                    //   rating: widget.product.rating!,
                    // ),
                    const SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
