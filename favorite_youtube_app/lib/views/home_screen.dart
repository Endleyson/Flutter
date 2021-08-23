import 'package:favorite_youtube_app/delegates/data_search.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 35,
          child: Image.asset("images/youtube-logo-2-3.png"),
        ),
        elevation: 0,
        backgroundColor: Colors.greenAccent,
        actions: [
          Align(
            alignment: Alignment.center,
            child: Text("0", style: TextStyle(color: Colors.black),),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.star, color: Colors.black,),
          ),
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              },
              icon: Icon(Icons.search, color: Colors.black,)
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
        ),
        child: Text("Teste OK"),
      ),
    );
  }
}
