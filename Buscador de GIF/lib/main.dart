//Desenvolvido por Endleyson Reis Duarte dos Sanots
//Exercicio Curso de Flutter
import 'package:flutter/material.dart';
import 'package:buscador_gif/ui/home_page.dart';
void main(){

  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomePage(),

    theme: ThemeData(
        hintColor: Colors.white,
        primaryColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white))
        )
    )));
}
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
