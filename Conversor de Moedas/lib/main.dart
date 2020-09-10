//Desenvolvido por Endleyson Reis Duarte dos Sanots
//Exercicio Curso de Flutter

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

const request= "//LINK DA API COLOCAR AQUI";
void main()async{


  runApp(MaterialApp(

      debugShowCheckedModeBanner: false,
    home: Home(),
    theme:ThemeData(
      hintColor: Colors.white,
      primaryColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white))
    )
  )));
}
Future<Map> getData()async{
  http.Response response = await http.get(request);
  return json.decode(response.body);

}
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final realController = TextEditingController();
  final usdController = TextEditingController();
  final euroController = TextEditingController();
  final libraController = TextEditingController();
  final pesoController = TextEditingController();
  final btcController = TextEditingController();
  double usd;
  double euro;
  double peso;
  double btc;
  double libra;
  void _realChanged(String text){
    if(text.isEmpty) {
      _clearAll();
      return;}
    double real = double.parse(text);
    usdController.text = (real/usd).toStringAsFixed(2);
    euroController.text = (real/euro).toStringAsFixed(2);
    libraController.text = (real/libra).toStringAsFixed(2);
    pesoController.text = (real/peso).toStringAsFixed(2);
    btcController.text = (real/btc).toStringAsFixed(2);
  }
  void _usdChanged(String text){
    if(text.isEmpty) {
      _clearAll();
      return;}
    double usd = double.parse(text);
    realController.text = (usd* this.usd).toStringAsFixed(2);
    euroController.text = (usd* this.usd/euro).toStringAsFixed(2);
    libraController.text = (usd* this.usd/libra).toStringAsFixed(2);
    pesoController.text = (usd* this.usd/peso).toStringAsFixed(2);
    btcController.text = (usd* this.usd/btc).toStringAsFixed(2);
  }

  void _euroChanged(String text){
    if(text.isEmpty) {
      _clearAll();
      return;}
    double euro = double.parse(text);
    realController.text = (euro* this.euro).toStringAsFixed(2);
    usdController.text = (euro* this.euro/usd).toStringAsFixed(2);
    libraController.text = (euro* this.euro/libra).toStringAsFixed(2);
    pesoController.text = (euro* this.euro/peso).toStringAsFixed(2);
    btcController.text = (euro* this.euro/btc).toStringAsFixed(2);
  }
  void _libraChanged(String text){
    if(text.isEmpty) {
      _clearAll();
      return;}
    double libra = double.parse(text);
    realController.text = (libra* this.libra).toStringAsFixed(2);
    usdController.text = (libra* this.libra/usd).toStringAsFixed(2);
    euroController.text = (libra* this.libra/euro).toStringAsFixed(2);
    pesoController.text = (libra* this.libra/peso).toStringAsFixed(2);
    btcController.text = (libra* this.libra/btc).toStringAsFixed(2);
  }
  void _pesoChanged(String text){
    if(text.isEmpty) {
      _clearAll();
      return;}
    double peso = double.parse(text);
    realController.text = (peso* this.peso).toStringAsFixed(2);
    usdController.text = (peso* this.peso/usd).toStringAsFixed(2);
    euroController.text = (peso* this.peso/euro).toStringAsFixed(2);
    libraController.text = (peso* this.peso/libra).toStringAsFixed(2);
    btcController.text = (peso* this.peso/btc).toStringAsFixed(2);
  }
  void _btcChanged(String text){
    if(text.isEmpty) {
      _clearAll();
      return;}
    double btc = double.parse(text);
    realController.text = (btc* this.btc).toStringAsFixed(2);
    usdController.text = (btc* this.btc/usd).toStringAsFixed(2);
    euroController.text = (btc* this.btc/euro).toStringAsFixed(2);
    libraController.text = (btc* this.btc/libra).toStringAsFixed(2);
    pesoController.text = (btc* this.btc/peso).toStringAsFixed(2);
  }
  void _clearAll(){
    realController.text = "";
    usdController.text = "";
    euroController.text ="";
    libraController.text = "";
    pesoController.text = "";
    btcController.text = "";

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue ,
      appBar: AppBar(
        title: Text("Conversor",),
        textTheme: TextTheme(title: TextStyle(color: Colors.white, fontSize: 28)),
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
      ),
      body:FutureBuilder<Map>(
        future: getData(),
        // ignore: missing_return
        builder: (context, snapshot) {
          switch(snapshot.connectionState){
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: Text("CARREGANDO DADOS...",
                  style: TextStyle(
                    color: Colors.white, fontSize: 25),
                  textAlign: TextAlign.center,)
              );
            default:
              if(snapshot.hasError){
                return Center(
                    child: Text("ERRO AO CARREGAr DADOS :((",
                    style: TextStyle(
                    color: Colors.white, fontSize: 25),
                    textAlign: TextAlign.center,)
                );
              }else{
                usd=snapshot.data["results"]["currencies"]["USD"]["buy"];
                euro=snapshot.data["results"]["currencies"]["EUR"]["buy"];
                peso=snapshot.data["results"]["currencies"]["ARS"]["buy"];
                libra=snapshot.data["results"]["currencies"]["GBP"]["buy"];
                btc=snapshot.data["results"]["currencies"]["BTC"]["buy"];

                return SingleChildScrollView(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                          children:<Widget>[
                        Icon(Icons.monetization_on,size:100 , color:Colors.white),
                        Icon(Icons.monetization_on,size:100 , color:Colors.white),
                        Icon(Icons.monetization_on,size:100 , color:Colors.white),
                      ]),

                      BuildTextField("Real", "R\$", realController, _realChanged),

                      Divider(),
                      BuildTextField("Dollar", "US\$",usdController,_usdChanged),

                      Divider(),
                      BuildTextField("Euro", "€", euroController,_euroChanged),

                      Divider(),
                      BuildTextField("Libras", "£\$", libraController, _libraChanged),

                      Divider(),
                      BuildTextField("Pesos Argentinos", "\$", pesoController,_pesoChanged),

                      Divider(),
                      BuildTextField("BitCoin", "BTC", btcController,_btcChanged),

                    ],
                  ),
                );
              }
          }
        })
      );

  }
}

Widget BuildTextField(String label, String prefix, TextEditingController c, Function f){
   return TextField(
     controller: c,
        decoration:InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(),
        prefixText: prefix,
        prefixStyle: TextStyle(color: Colors.white, fontSize: 20),
    ) ,
    style: TextStyle (
      color: Colors.white,fontSize: 20),
     onChanged: f,
     keyboardType: TextInputType.numberWithOptions(decimal: true),
    );

}
