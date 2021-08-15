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
          centerTitle: true,
        ),
        body: ProductGrid());
  }
}


