import 'package:flutter/material.dart';
//import '../models/product.dart';
import 'package:provider/provider.dart';
import '../widgets/product-item.dart';
import '../providers/products.dart';

class ProductsGridView extends StatelessWidget {
  final bool showFavs;
  ProductsGridView(this.showFavs);
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = showFavs ? productsData.favoriteItems : productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: products[i],
          child: ProductItem(
              //products[i].id, products[i].title, products[i].imageUrl
              )),
      itemCount: products.length,
    );
  }
}
