import 'package:e_shop/models/providers/productprovider.dart';
import 'package:e_shop/widgets/product_grid.dart';
import 'package:flutter/material.dart';
import 'package:e_shop/models/providers/product.dart';
import 'package:e_shop/widgets/product_item.dart';
import 'package:provider/provider.dart';

enum FilterOptions { all, favorites }

class ProductHome extends StatelessWidget {
  const ProductHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          "e-Shop",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          PopupMenuButton(
              iconColor: Colors.white,
              
              onSelected: (val) {
                if (val == FilterOptions.favorites) {
                  Provider.of<ProductProvider>(context, listen: false)
                      .changeTofavorites();
                } else {
                  Provider.of<ProductProvider>(context, listen: false)
                      .changeToall();
                }
              },
              itemBuilder: (ctx) {
                return [
                  PopupMenuItem(
                    child: Text('All'),
                    value: FilterOptions.all,
                  ),
                  PopupMenuItem(
                    child: Text('Favorites'),
                    value: FilterOptions.favorites,
                  )
                ];
              })
        ],
      ),
      body: ProductGrid(),
    );
  }
}
