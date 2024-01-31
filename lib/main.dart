import 'package:flutter/material.dart';
import 'package:shopping_app/screens/product_details_screen.dart';
import 'package:shopping_app/screens/product_overview_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Myshop',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
      routes: {
        ProductOverviewScreen.routeName: (context) => ProductOverviewScreen(),
        ProductDetailsScreen.routeName: (context) =>
            const ProductDetailsScreen(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ProductOverviewScreen();
  }
}
