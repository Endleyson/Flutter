import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/product_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: AppBar(
        title: Text("Home Loja"),
        actions: [
          PopupMenuButton(
            onSelected: (int selectedValue){
              print(selectedValue);
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Somente Favoritos'),
                value: 0,
              ),
              PopupMenuItem(
                child: Text('Todos'),
                value: 1,
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
