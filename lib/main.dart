import 'package:e_shop/models/providers/productprovider.dart';
import 'package:e_shop/routes/products_details.dart';
import 'package:e_shop/routes/products_home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.purple,
          scaffoldBackgroundColor: Colors.grey[200],
        ),
        home: ProductHome(),
        routes: {ProductDetails.routeName: (context) => ProductDetails()},
      ),
    );
  }
}
