import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class DataSearch extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () {
        query = "";
      },
          icon: Icon(Icons.clear)),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();

  }
  suggestions(String search) async{
    http.Response response = await http.get(
        Uri.parse("http://suggestqueries.google.com/complete/search?hl=en&ds=yt&client=youtube&hjson=t&cp=1&q=$search&format=5&alt=json")
    );
    if(response.statusCode == 200){
      json.decode(response.body)[1].map((v){
        return v[0];
      }).toList();
    }else{
      throw Exception("ERRO AO CARREGAR AS SUGESTÕES");
    }
  }
}
