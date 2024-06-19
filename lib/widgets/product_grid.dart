import 'package:e_shop/models/providers/productprovider.dart';
import 'package:e_shop/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductProvider>(context).products;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemCount: productsData.length,
      itemBuilder: (context, index) {
        return ChangeNotifierProvider.value(
          value: productsData[index],
          child: ProductItem(
            
          ),
        );
      },
    );
  }
}
