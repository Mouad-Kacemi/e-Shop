import 'package:e_shop/models/providers/productprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});
  static const routeName = "/product-details";

  @override
  Widget build(BuildContext context) {
    final String productid =
        ModalRoute.of(context)!.settings.arguments as String;
    final product = context.read<ProductProvider>().findById(productid);
    // or you can use but listen false so no rebuild of build:  Provider.of<ProductProvider>(context).findById(productid);
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            product.title,
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: constraints.maxHeight * 0.4,
                    width: constraints.maxWidth,
                    child: Image.network(
                      product.imageUrl,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.02,
                  ),
                  Text("\$ ${product.price}",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 28,
                      )),
                  SizedBox(
                    height: constraints.maxHeight * 0.02,
                  ),
                  Text(product.description,
                      style:
                          TextStyle(color: Colors.grey.shade600, fontSize: 22))
                ],
              );
            },
          ),
        ));
  }
}
