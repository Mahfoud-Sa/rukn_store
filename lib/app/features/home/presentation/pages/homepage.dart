import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:dio/dio.dart';
import 'package:rukn_store/app/features/home/data/modules/product.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final dio = Dio();

  Future<List<dynamic>> getHttp() async {
    var response = await dio.get('https://fakestoreapi.com/products/');
    print(response);

    final products =
        response.data.map((json) => Product.fromJson(json)).toList();
    // response
    //     .toString()
    //     .substring(1, response.toString().length - 1)
    //     .split(',');
    print(products);
    return products;
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      print('object');
                    });
                  },
                  child: CategoryBtn(
                    icon: Icons.woman,
                  ),
                ),
                CategoryBtn(
                  icon: Icons.man,
                ),
                CategoryBtn(
                  icon: Icons.abc_sharp,
                ),
                CategoryBtn(
                  icon: Icons.join_full_outlined,
                ),
                CategoryBtn(
                  icon: Icons.electric_bike,
                ),
              ],
            ),
          ),
          //Items section
          FutureBuilder(
            future: getHttp(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return const Center(child: Text('خطاء في الاتصال بالانترنت'));
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return ItemWidget(
                        product: Product(
                          title: 'Fits 15 Lapds Expanded ',
                          // price: 250,
                          // description: "padded sleeve,",
                          // category: 'Men close',
                          // image:
                          //     "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
                          // //  rating: Rating(rate: 5, count: 30)
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

class CategoryBtn extends StatefulWidget {
  final icon;

  CategoryBtn({
    super.key,
    this.icon,
  });

  @override
  State<CategoryBtn> createState() => _CategoryBtnState();
}

class _CategoryBtnState extends State<CategoryBtn> {
  bool clicked = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: () {
        return setState(() {
          clicked = !clicked;
        });
      },
      child: Stack(
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
              ? Icon(widget.icon, color: Colors.white)
              : Icon(
                  widget.icon,
                  color: Colors.black,
                ),
        ],
      ),
    );
  }
}

class ItemWidget extends StatelessWidget {
  ItemWidget({
    super.key,
    required this.product,
  });
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 200,
      color: const Color.fromARGB(255, 236, 236, 236),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.title!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                "product.description!",
                maxLines: 2,
              ),
              Text("product.price!.toString()"),
              Text("product.rating!.rate.toString()"),
            ],
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.all(15),
            //  margin: EdgeInsets.all(3),
            // child: Image.network(product.image!)
          ),
        ],
      ),
    );
  }
}
