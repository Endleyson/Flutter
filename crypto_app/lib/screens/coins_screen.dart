import 'package:crypto_app/providers/coins.dart';
import 'package:flutter/material.dart';

class CryptoApp extends StatefulWidget {
  CryptoApp({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _CryptoAppState createState() => _CryptoAppState();
}

class _CryptoAppState extends State<CryptoApp> {
  @override
  Widget build(BuildContext context) {
    final table = CoinsProvider.table;
    return Scaffold(
        appBar: AppBar(
          title: Text("CryptoValues"),
          centerTitle: true,
          elevation: 0,
        ),
        body: ListView.separated(
          itemBuilder: (BuildContext context, int coins){
            return ListTile(
              leading: Image.asset(table[coins].icon, height:40, width:40),
              title: Text(table[coins].name),
              trailing: Text(table[coins].price.toString()),
            );
          },
          padding: EdgeInsets.all(16.0),
          separatorBuilder: (_, __)=>Divider(),
          itemCount: table.length,
        ));
  }
}
