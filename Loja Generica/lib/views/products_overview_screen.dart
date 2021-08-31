import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/product_grid.dart';
import '../providers/products.dart';

enum FilterOptions{
  Favorite,
  All
}

class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Products products = Provider.of(context);
    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: AppBar(
        title: Text("Home Loja"),
        actions: [
          PopupMenuButton(//ao clicar vc seleciona todos ou somente favoritos
            onSelected: (FilterOptions selectedValue){
              if(selectedValue == FilterOptions.Favorite){
                products.showFavoriteOnly();
              }else{
                products.showAll();
              }
            },
            icon: Icon(Icons.more_vert),//icone do popupmenu
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Somente Favoritos'),
                value: FilterOptions.Favorite,
              ),
              PopupMenuItem(
                child: Text('Todos'),
                value: FilterOptions.All,
              )
            ],
          )
        ],
        centerTitle: true,
      ),
      body: ProductGrid(),
    );
  }
}
