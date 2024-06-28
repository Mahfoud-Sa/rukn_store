import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:dio/dio.dart';

class HomePage extends StatelessWidget {
  final dio = Dio();
  Future<dynamic> getHttp() async {
    final response =
        await dio.get('https://fakestoreapi.com/products/categories');
    print(response);
    final category = jsonDecode(response.toString()) as Map<String, dynamic>;
    print(category);
    return response;
  }

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          FutureBuilder(
            future: getHttp(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return const Center(child: Text('خطاء في الاتصال بالانترنت'));
                }
                return SizedBox(
                  height: 300,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      Text(snapshot.data.toString());
                    },
                  ),
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
          Column(
            children: [],
          )
        ],
      ),
    );
  }
}
