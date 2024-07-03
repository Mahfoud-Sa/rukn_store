import 'package:flutter/material.dart';
import 'package:rukn_store/app/features/Auth/presentation/pages/forget_password_page.dart';
import 'package:rukn_store/app/features/Auth/presentation/pages/login_page.dart';
import 'package:rukn_store/app/features/home/data/modules/product.dart';
import 'package:rukn_store/app/features/home/presentation/pages/homepage.dart';
import 'package:rukn_store/app/features/home/presentation/pages/product_detailes_page.dart';
import 'package:rukn_store/app/features/onbording/presentation/pages/onbording_page.dart';
import 'package:rukn_store/app/features/onbording/presentation/pages/welcome_page.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

/// The route configuration.
final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return HomePage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'Onbording',
          builder: (BuildContext context, GoRouterState state) {
            return OnbordingPage();
          },
        ),
        GoRoute(
          path: 'Login',
          builder: (BuildContext context, GoRouterState state) {
            return const LoginPage();
          },
        ),
        GoRoute(
          path: 'ForgetPassword',
          builder: (BuildContext context, GoRouterState state) {
            return const ForgetPasswordPage();
          },
        ),
        GoRoute(
          path: 'HomePage',
          builder: (BuildContext context, GoRouterState state) {
            return HomePage();
          },
        ),
        GoRoute(
          path: 'ProductDetailesPage',
          builder: (BuildContext context, GoRouterState state) {
            return ProductDetailsPage(
              product: state.extra as Product,
            );
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Rukn Store',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
