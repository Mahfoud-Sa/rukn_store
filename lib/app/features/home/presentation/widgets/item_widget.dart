import 'package:flutter/Material.dart';
import 'package:rukn_store/app/features/home/data/modules/product.dart';
import 'package:rukn_store/app/features/home/presentation/pages/product_detailes_page.dart';
import 'package:go_router/go_router.dart';
import 'package:rukn_store/app/features/home/presentation/widgets/rating_widget.dart';

class ItemWidget extends StatelessWidget {
  ItemWidget({
    super.key,
    required this.product,
  });
  final Product product;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.go('/ProductDetailesPage', extra: product);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 200,
        width: MediaQuery.of(context).size.width,
        color: const Color.fromARGB(255, 236, 236, 236),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      overflow: TextOverflow.ellipsis,
                      product.category!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("Price: ${product.price!}\$"),
                    RatingStarsWidget(
                      rating: product.rating!,
                    )
                  ],
                ),
              ),
            ),
            Container(
                constraints: const BoxConstraints(minWidth: 50, maxWidth: 200),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                padding: const EdgeInsets.all(15),
                //  margin: EdgeInsets.all(3),
                child: Image.network(
                  product.image!,
                )),
          ],
        ),
      ),
    );
  }
}
