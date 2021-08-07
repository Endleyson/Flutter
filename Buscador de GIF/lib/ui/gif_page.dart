//Desenvolvido por Endleyson Reis Duarte dos Sanots
//Exercicio Curso de Flutter
import 'package:flutter/material.dart';
import 'package:share/share.dart';//plugin responsavel pelo compartilhamento
class GifPage extends StatelessWidget {
  final Map _gifData;
  GifPage(this._gifData);
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          iconTheme: IconThemeData(color:Colors.white),
          title: Text(_gifData["slug"],style: TextStyle(color:Colors.white),),

          backgroundColor: Colors.indigo,

          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share),
                onPressed:(){
                Share.share(_gifData["images"]["fixed_height"]["url"]);
                },
            )],
          ),
      backgroundColor: Colors.indigo,
      body: Center(
        child: Image.network(_gifData["images"]["fixed_height"]["url"])
      ),
    );
  }
}
