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
  Future<Map> _getGifs() async{
    http.Response response;
    if(_search == null || _search.isEmpty)//
      response = await http.get("https://api.giphy.com/v1/gifs/trending?api_key=ojWLDrpiGLhlJuKPJXs1VFpKUfwk1cGr&limit=25&rating=G");
    else
      response = await http.get("https://api.giphy.com/v1/gifs/search?api_key=ojWLDrpiGLhlJuKPJXs1VFpKUfwk1cGr&q=$_search&limit=25&offset=$_offset&rating=G&lang=pt");

    return json.decode(response.body);
  }

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
              onSubmitted:(text) {
                setState(() {
                  _search = text;
                  _offset = 0;
                });

              },

          ),
          ),
          Expanded(
            child: FutureBuilder(
              future: _getGifs(),
              builder: (context, snapshot){
                switch(snapshot.connectionState){
                  case ConnectionState.waiting:
                    case ConnectionState.none:
                      return Container(
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
  int _getCount(List data) {
  if(_search == null || _search.isEmpty) {
    return data.length;
  }else{

    return data.length +1;
  }
}
Widget _creatGifTable(BuildContext, AsyncSnapshot snapshot) {
  return GridView.builder(
      padding: EdgeInsets.all(10.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemCount:_getCount(snapshot.data["data"]),
      itemBuilder: (context, index){
        if(_search == null || index< snapshot.data["data"].length)
          return GestureDetector(
            child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: snapshot.data["data"][index]["images"]["fixed_height"]["url"],
                height: 300.0,
                fit: BoxFit.cover,
          ),
            onTap: (){
              Navigator.push(context,
              MaterialPageRoute(builder: (context)=>GifPage(snapshot.data["data"][index])));
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