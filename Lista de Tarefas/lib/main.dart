//Desenvolvido por Endleyson Reis Duarte dos Sanots
//Exercicio Curso de Flutter

import 'dart:async';
import 'dart:convert' show json;
import 'dart:core';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
//import 'packpage:path_provider/path_provider.dart';
void main(){
  runApp(MaterialApp(
    home:Home(),
    debugShowCheckedModeBanner: false,

  ));
}
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _toDoList = [];
  Map<String, dynamic> _lastRemoved;//mapa do ultimo item removido
  int _lastRemovedPos;//armazenara a posição que foi removido o item 

  // metodo que sobrescreve e faz a leitura dos dados
  @override
  void initState() {
    super.initState();
    _readData().then((data) {
      setState(() {
        _toDoList = json.decode(data);
      });
    });
  }

  final _toDoController = TextEditingController();// controlador do texto
  //função que adiciona os itens na lista
  void _addToDo() {
    setState(() {
      Map<String, dynamic>newToDo = Map();
      newToDo["title"] = _toDoController.text;
      _toDoController.text = "";
      newToDo["ok"] = false;
      _toDoList.add(newToDo);
      _saveData();
    });
  }
  //função que limpa a lista
  void _cls(){
    setState(() {
      _toDoList = [];
      _saveData();
    });
  }

    //função responsavel pelo refresh da tela
    Future<Null> _refresh() async {
      await Future.delayed(Duration(seconds: 1));
      setState(() {
        _toDoList.sort((a, b) {
          if (a["ok"] && !b["ok"])
            return 1;
          else if (!a["ok"] && b["ok"])
            return -1;
          else
            return 0;
        });
        _saveData();
      });
      return null;
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Lista de Compras"),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(17.0, 1.0, 7.0, 1.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _toDoController,
                      decoration: InputDecoration(
                          labelText: "Digite o Item",
                          labelStyle: TextStyle(color: Colors.blue)
                      ),
                    ),
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    child: Text("ADD"),
                    textColor: Colors.white,
                    onPressed: _addToDo,
                  )
                ],
              ),
            ),
            Expanded(
              child: RefreshIndicator(onRefresh: _refresh,//
                  child: ListView.builder(//widget resposnsavel por gerar a lista
                    padding: EdgeInsets.only(top: 10.0),
                    itemCount: _toDoList.length,
                    itemBuilder: buildItem,)
              ),
            ),
            RaisedButton(
              color: Colors.blue,
              child: Text("Remover Todos"),
              textColor: Colors.white,
              onPressed: _cls,
            )
          ],
        ),
      );
    }
    //função que cria a lista e os parametros do funcionamento
    Widget buildItem(context, index) {
      return Dismissible(//widget que permite arrasta os itens
        key: Key(DateTime//parametro para saber qual itens esta sendo deslizado
            .now()
            .millisecondsSinceEpoch
            .toString()),
        //cor de fundo e posição do icone quando arrastar o item
        background: Container(
          color: Colors.red,
          child: Align(
            alignment: Alignment(-0.9, 0.0),
            child: Icon(Icons.delete, color: Colors.white,),
          ),
        ),
        direction: DismissDirection.startToEnd,//direção para onde arrastar o item
        child: CheckboxListTile(//ListTitle com um botão de check
          title: Text(_toDoList[index]["title"]),
          value: _toDoList[index]["ok"],
          secondary: CircleAvatar(
            child: Icon(_toDoList[index]["ok"] ?
            Icons.check : Icons.error,),),// verifica qual a condição do botao check e troca o simbolo do icone
          onChanged: (c) {
            setState(() {
              _toDoList[index]["ok"] = (c);
              _saveData();
            });
          },
        ),
        // função que deleta o item quando deslizado, 
        onDismissed: (direction) {
          setState(() {
            _lastRemoved = Map.from(_toDoList[index]);
            _lastRemovedPos = index;
            _toDoList.removeAt(index);
            _saveData();
            //snack bar com função caso queira desfazer a ação
            final snack = SnackBar(
              content: Text("Tarefa \"${_lastRemoved["title"]}\" removida"),
              action: SnackBarAction(label: "Desfazer",
                onPressed: () {
                  setState(() {
                    _toDoList.insert(_lastRemovedPos, _lastRemoved);
                    _saveData();
                  });
                },),
              duration: Duration(seconds: 3),
            );
            Scaffold.of(context).removeCurrentSnackBar();//remove a snack atual
            Scaffold.of(context).showSnackBar(snack);//mostra a snackbar nova
          });
        },
      );
    }

    //função que pega o arquivo no diretório
    Future<File> _getFile() async {
      final directory = await getApplicationDocumentsDirectory();
      return File("${directory.path}/data.jason");
    }
    //função responsavel por salvar o arquivo no diretório
    Future<File> _saveData() async {
      String data = json.encode(_toDoList);
      final file = await _getFile();
      return file.writeAsString(data);
    }
    //função responsavel pela leitura do arquivo
    Future<String> _readData() async {
      try {
        final file = await _getFile();
        return file.readAsString();
      } catch (e) {
        return null;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }






