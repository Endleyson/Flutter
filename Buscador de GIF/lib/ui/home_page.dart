//Desenvolvido por Endleyson Reis Duarte dos Sanots
//Exercicio Curso de Flutter
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:share/share.dart';
import 'package:transparent_image/transparent_image.dart';

import 'gif_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _search;
  int _offset = 0;
  //função que faz a requisição a API
  Future<Map> _getGifs() async{
    http.Response response;
    if(_search == null || _search.isEmpty)//
      response = await http.get("https://api.giphy.com/v1/gifs/trending?api_key=ojWLDrpiGLhlJuKPJXs1VFpKUfwk1cGr&limit=25&rating=G");
    else
      response = await http.get("https://api.giphy.com/v1/gifs/search?api_key=ojWLDrpiGLhlJuKPJXs1VFpKUfwk1cGr&q=$_search&limit=25&offset=$_offset&rating=G&lang=pt");

    return json.decode(response.body);
  }
  //função que pega os gifs
  @override
  void initState(){
    super.initState();
    _getGifs().then((map){
      print(map);
    });
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Image.network("https://developers.giphy.com/static/img/dev-logo-lg.7404c00322a8.gif"),
        centerTitle: true,
      )  ,
      backgroundColor: Colors.indigo,
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child:TextField(
              decoration: InputDecoration(
                  labelText: "Encontre o GIF",
                  labelStyle: TextStyle(color:Colors.white),
                  border: OutlineInputBorder()
              ),
              style: TextStyle(color: Colors.white, fontSize: 18.0),
              textAlign: TextAlign.center,
              onSubmitted:(text) {//chama o texto digitado quando damos o ok
                setState(() {
                  _search = text;
                  _offset = 0;
                });

              },

          ),
          ),
          //widget responsavel por mostrar a grade de gifs
          Expanded(
            child: FutureBuilder(
              future: _getGifs(),
              builder: (context, snapshot){
                switch(snapshot.connectionState){//verifica o stado da conexão
                  case ConnectionState.waiting:
                    case ConnectionState.none:
                      return Container(//constroi o indicador cricular
                        width: 200.00,
                        height: 200.00,
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          strokeWidth: 5.0,
                        )
                      );
                  default:
                    if (snapshot.hasError)
                      return Container();
                    else
                      return _creatGifTable(context,snapshot);
              }
              }
            ),

          ),
        ],
      )
    );
  }
  //responsavel pelo numero de gifs a ser apresentado no grid
  int _getCount(List data) {
  if(_search == null || _search.isEmpty) {
    return data.length;
  }else{

    return data.length +1;
  }
}
//widget responsavel por criar a tabela de gifs
Widget _creatGifTable(BuildContext, AsyncSnapshot snapshot) {
  return GridView.builder(
      padding: EdgeInsets.all(10.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(//responsavel pelo layout do grid
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemCount:_getCount(snapshot.data["data"]),
      itemBuilder: (context, index){
        //condição resposavel em mostrar os 25 melhores gifs ou caso esteja pesquisando mostrar ao final o botão para carregar
        if(_search == null || index< snapshot.data["data"].length)
          return GestureDetector(//gestureDetector é responsavel por "detectar os gestos na tela"
            child: FadeInImage.memoryNetwork(//FadeImage responsavel por suavizar o aparecimento das imagens
                placeholder: kTransparentImage,
                image: snapshot.data["data"][index]["images"]["fixed_height"]["url"],
                height: 300.0,
                fit: BoxFit.cover,
          ),
            onTap: (){
              Navigator.push(context,
              MaterialPageRoute(builder: (context)=>GifPage(snapshot.data["data"][index])));// responsavel pela rota da pagina gif_page
            },
            onLongPress: (){
              Share.share(snapshot.data["data"][index]["images"]["fixed_height"]["url"]);
            },
        );
        else
          return Container(
            child: GestureDetector(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.add, color: Colors.white, size: 70.0),
                  Text("Carregar mais...",
                  style: TextStyle(color: Colors.white, fontSize: 22.0),)
                ],
              ),
                  // função que carrega mais 25 quando tocar no botão carregar mais
                  onTap: (){
                setState(() {
                  _offset += 25;
                });
          },
            )
          );
      });
}
}