import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aplicação"),
        textTheme:
        TextTheme(title: TextStyle(color: Colors.white, fontSize: 28)),
        backgroundColor: Colors.indigo[700],
        centerTitle: true,
      ),
      backgroundColor: Colors.indigo[400],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(35.0),

            child: Center(
              child: Text(
                "Aplicação Carregada Com Sucesso",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.cyan[100],
                ),
              ),
            ),
          ),
          Container(
            width: 350,
            height: 350,
            child: RiveAnimation.asset('assets/joia.riv'),
            padding: EdgeInsets.all(35.0),
          ),
        ],
      ),
    );
  }
}
