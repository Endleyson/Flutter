import 'package:crypto_app/models/coins.dart';
import 'package:crypto_app/providers/coins.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CryptoApp extends StatefulWidget {
  CryptoApp({Key? key}) : super(key: key);

  @override
  _CryptoAppState createState() => _CryptoAppState();
}


class _CryptoAppState extends State<CryptoApp> {
  @override
  Widget build(BuildContext context) {
    final table = CoinsProvider.table;
    NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');
    List<Coins> selections = [];
    return Scaffold(
        appBar: AppBar(
          title: Text("Crypto Values",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          centerTitle: true,
          elevation: 3,
        ),
        body: ListView.separated(
          itemBuilder: (BuildContext context, int coins) {
            return ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
                leading:(selections.contains(table[coins]))
                    ?CircleAvatar(
                    child: Icon(Icons.check)
                ) :
                SizedBox(child: Image.asset(table[coins].icon, width: 40)),
                title: Text(
                  table[coins].name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                trailing: Text(
                  real.format(table[coins].price),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                selected: selections.contains(table[coins]),
                selectedTileColor: Colors.deepOrange[50],
                onLongPress: () {
                  setState(() {(selections.contains(table[coins]))?selections.remove(table[coins]) : selections.add(table[coins]);
                  }
                  );
                });
          },
          padding: EdgeInsets.all(20.0),
          separatorBuilder: (_, __) => Divider(),
          itemCount: table.length,
        ));
  }
}
