import 'dart:ui';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(
          hintColor: Colors.white,
          primaryColor: Colors.white,
          inputDecorationTheme: InputDecorationTheme(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(5.0))))));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool checked = true;

  void getCheckBoxValue(bool value) {
    if (checked == false) {
      setState(() {
        checked = true;
      });
    } else {
      setState(() {
        checked = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 70.0, 10.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                height: 200.0,
                //padding: EdgeInsets.all(10.0),
                child: Image.network(
                    "https://www.pmovel.com.br/images/logo_v.png")),
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "E-mail ou CPF",
                  labelStyle: TextStyle(color: Colors.white),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(5.0)),
                  prefixIcon: Padding(
                    padding: EdgeInsetsDirectional.only(start: 12.0),
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                ),
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(color: Colors.white),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(5.0)),
                  prefixIcon: Padding(
                    padding: EdgeInsetsDirectional.only(start: 12.0),
                    child: Icon(Icons.lock, color: Colors.white),
                  ),
                ),
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
            Row(
              children: [
                Checkbox(
                  value: checked,
                  onChanged: (value) {
                    getCheckBoxValue(value!);
                  },
                  activeColor: Colors.white,
                  checkColor: Colors.red,
                ),
                Text(
                  "Lembrar senha?",
                  style: TextStyle(color: Colors.white),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 100.0),
                  child: Text(
                    "Esqueceu a Senha?",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 15),
              height: 60,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Acesssar",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.lightBlue),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
