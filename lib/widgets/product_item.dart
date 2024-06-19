import 'package:e_shop/models/providers/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  ProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: GridTile(
        footer: GridTileBar(
            backgroundColor: Colors.black54,
            leading: Consumer<Product>(
              builder: (context, pr, _) {
                return IconButton(
                    onPressed: () {
                      pr.changefavorite();
                    },
                    icon: Icon(
                      pr.isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: pr.isFavorite ? Colors.red : Colors.white,
                    ));
              },
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.yellow,
              ),
            ),
            title: Text(product.title)),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed('/product-details', arguments: product.id);
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
