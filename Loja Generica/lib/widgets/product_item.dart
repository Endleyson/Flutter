import '../views/product_detail_screen.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';
import '../utils/app_routes.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(//responsavel por fazer as bordas arredondadas do gritle
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          //responsavel por renderizar o grid dos produtos
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                AppRouters.PRODUCT_DETAIL,
                arguments: product,
              );
            },
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            leading: IconButton(
              //parte inicial do footer
              icon: Icon(Icons.favorite),
              onPressed: () {},
              color: Theme.of(context).accentColor,
            ),
            title: Text(
              //parte cenntral do footer
              product.title,
              textAlign: TextAlign.center,
              style: TextStyle(color: Theme.of(context).accentColor),
            ),
            trailing: IconButton(
              //parte final do footer
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
              color: Theme.of(context).accentColor,
            ),
          ),
        )
    );
  }
}
