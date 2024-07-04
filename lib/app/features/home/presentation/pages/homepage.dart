import 'dart:convert';
import 'dart:developer';

import 'dart:ui';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:dio/dio.dart';
import 'package:rukn_store/app/features/home/data/modules/product.dart';
import 'package:rukn_store/app/features/home/presentation/pages/product_detailes_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final dio = Dio();
  String selectedCategoryoes = 'all';
  Future<List<dynamic>> getItems(name) async {
    switch (name) {
      case 'electronics':
        var response = await dio
            .get('https://fakestoreapi.com/products/category/electronics');
        print(response);
        final products =
            response.data.map((json) => Product.fromJson(json)).toList();
        return products;
      case 'jewelery':
        var response = await dio
            .get('https://fakestoreapi.com/products/category/jewelery');
        print(response);
        final products =
            response.data.map((json) => Product.fromJson(json)).toList();
        return products;
      case 'men\'s clothing':
        var response = await dio
            .get('https://fakestoreapi.com/products/category/men\'s clothing');
        print(response);
        final products =
            response.data.map((json) => Product.fromJson(json)).toList();
        return products;
      case 'women\'s clothing':
        var response = await dio.get(
            'https://fakestoreapi.com/products/category/women\'s clothing');
        print(response);
        final products =
            response.data.map((json) => Product.fromJson(json)).toList();
        return products;

      default:
        var response = await dio.get('https://fakestoreapi.com/products/');
        print(response);
        final products =
            response.data.map((json) => Product.fromJson(json)).toList();
        return products;
    }

    //print(Product.fromJson(response.data!.first).price);

    // print(products);
    // return products;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: const Text(
          'Rukn Store',
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          //category Section
          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    setState(() {
                      selectedCategoryoes = 'all';
                    });
                  },
                  child: CategoryWidget(
                    name: 'all',
                    icon: Icons.filter_list,
                    clicked: selectedCategoryoes == 'all',
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    setState(() {
                      selectedCategoryoes = 'electronics';
                    });
                  },
                  child: CategoryWidget(
                    name: 'electronics',
                    icon: Icons.mobile_friendly,
                    clicked: selectedCategoryoes == 'electronics',
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    setState(() {
                      selectedCategoryoes = 'jewelery';
                    });
                  },
                  child: CategoryWidget(
                    name: 'jewelery',
                    icon: Icons.volunteer_activism,
                    clicked: selectedCategoryoes == 'jewelery',
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    setState(() {
                      selectedCategoryoes = 'men\'s clothing';
                    });
                  },
                  child: CategoryWidget(
                    name: 'men\'s clothing',
                    icon: Icons.man_4_sharp,
                    clicked: selectedCategoryoes == 'men\'s clothing',
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    setState(() {
                      selectedCategoryoes = 'women\'s clothing';
                    });
                  },
                  child: CategoryWidget(
                    name: 'women\'s clothing',
                    icon: Icons.woman_rounded,
                    clicked: selectedCategoryoes == 'women\'s clothing',
                  ),
                ),
              ],
            ),
          ),
          //Items section
          FutureBuilder(
            future: getItems(selectedCategoryoes),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return const Center(child: Text('خطاء في الاتصال بالانترنت'));
                }
                return Expanded(
                  child: ListView.separated(
                    itemCount: snapshot.data!.length,
                    separatorBuilder: (context, index) => SizedBox(
                      height: 10,
                    ),
                    itemBuilder: (context, index) {
                      return ItemWidget(
                        product: Product(
                          title: snapshot.data![index].title,
                          price: snapshot.data![index].price,
                          description: snapshot.data![index].description,
                          category: snapshot.data![index].category,
                          image: snapshot.data![index].image,
                          rating: snapshot.data![index].rating,
                        ),
                      );
                    },
                  ),
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  final icon;
  final clicked;
  final name;
  CategoryWidget({
    super.key,
    this.icon,
    this.name,
    this.clicked = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(5),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: clicked ? Colors.black45 : Colors.black12,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              clicked
                  ? Icon(icon, color: Colors.white)
                  : Icon(
                      icon,
                      color: Colors.black,
                    ),
            ],
          ),
          Text(
            name,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          )
        ],
      ),
    );
  }
}

// class CategoryBtn extends StatefulWidget {
//   final icon;
//   final ckicked;

//   CategoryBtn({
//     super.key,
//     this.icon,
//     this.ckicked,
//   });

//   @override
//   State<CategoryBtn> createState() => _CategoryBtnState();
// }

// class _CategoryBtnState extends State<CategoryBtn> {
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       // onTap: () {
//       //   return setState(() {
//       //     clicked = !clicked;
//       //   });
//       // },
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           Container(
//             margin: const EdgeInsets.all(5),
//             height: 50,
//             width: 50,
//             decoration: BoxDecoration(
//               color: clicked ? Colors.black45 : Colors.black12,
//               borderRadius: BorderRadius.circular(50),
//             ),
//           ),
//           clicked
//               ? Icon(widget.icon, color: Colors.white)
//               : Icon(
//                   widget.icon,
//                   color: Colors.black,
//                 ),
//         ],
//       ),
//     );
//   }
// }

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
                      style: TextStyle(
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
                constraints: BoxConstraints(minWidth: 50, maxWidth: 200),
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
