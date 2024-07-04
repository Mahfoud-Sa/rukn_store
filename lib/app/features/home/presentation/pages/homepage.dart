import 'package:flutter/material.dart';
import 'package:rukn_store/app/features/home/data/modules/product.dart';
import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';
import 'package:rukn_store/app/features/home/presentation/widgets/category_widget.dart';
import 'package:rukn_store/app/features/home/presentation/widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final dio = Dio();
  //Default Selection
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'متجر ركن',
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
          itemsSection(),
        ],
      ),
    );
  }

  FutureBuilder<List<dynamic>> itemsSection() {
    return FutureBuilder(
      future: getItems(selectedCategoryoes),
      builder: (context, snapshot) {
        //if call to api is done
        if (snapshot.connectionState == ConnectionState.done) {
          //if call to add done with Problems
          if (snapshot.hasError) {
            return const Center(child: Text('خطاء في الاتصال بالانترنت'));
          }
          // if call done succefully
          return Expanded(
            child: ListView.separated(
              itemCount: snapshot.data!.length,
              separatorBuilder: (context, index) => const SizedBox(
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
    );
  }
}
