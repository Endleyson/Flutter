import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'dart:async';
import 'package:splash_screen_app/home.dart';
void main() {
  runApp(MyApp());
}
//raiz da aplicação
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splash(),
      debugShowCheckedModeBanner: false, //tira o banner de debug
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}
//tela splash com animação com  rive
class _SplashState extends State<Splash> {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(color: Colors.indigo[800]),
          child: Center(
            child: ListView(
              children: <Widget>[
                Container(
                  height: 250,
                  child: Text("Espere Só Mais Um Pouco",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white,
                      )),
                    padding: EdgeInsets.only(left: 35.0,top: 125.0,right: 35.0,bottom: 35.0),
                ),
                Container(
                  width: 150,
                  height: 250,
                  child: RiveAnimation.asset('assets/gears.riv'),
                  padding: EdgeInsets.all(35.0),
                ),
                Container(
                  height: 250,
                  child: Text("Sua Aplicação Já Será Carregada...",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white,
                      )),
                  padding: EdgeInsets.all(50.0),
                ),
              ],
            ),
          )),
    );
  }

  @override
  // função que determina o tempo da troca das telas
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4)).then((value)=>
      Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context)=>Home())
      ),
    );
  }
}
