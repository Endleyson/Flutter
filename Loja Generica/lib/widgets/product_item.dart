import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';
import '../utils/app_routes.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Product product = Provider.of<Product>(
      context,
      listen: false,
    );
    return ClipRRect(
        //responsavel por fazer as bordas arredondadas do gritle
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
            //parte inicial do footer
            leading: Consumer<Product>(
              builder: (context, product, _) => IconButton(//icone dos favoritos
                  icon: Icon(product.isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border),
                  onPressed: () {
                    product.toggleFavorite();
                  },
                  color: Colors.pinkAccent //Theme.of(context).accentColor,
              ),
            ),
            title: Text(
              //parte central do footer
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
        ));
  }
}
