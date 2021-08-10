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
                  borderRadius: BorderRadius.circular(10.0))))));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  const _

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10), //Container(
        /*decoration: BoxDecoration(
          image: DecorationImage(
              image: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRa8qOI6zm91XI9-vwOkyHI_zDqivONwGlWUQ&usqp=CAU").image
          ),
        ),*/
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(10.0),
                child: Image.network(
                    "https://www.pmovel.com.br/images/logo_v.png")),
            Divider(),
            TextField(
              decoration: InputDecoration(
                labelText: "E-mail ou CPF",
                labelStyle: TextStyle(color: Colors.white),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white54, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0)),
                prefixIcon: Padding(
                  padding: EdgeInsetsDirectional.only(start: 12.0),
                  child: Icon(Icons.person, color: Colors.white),
                ),
              ),
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            Divider(),
            TextField(
              decoration: InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(color: Colors.white),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white54, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0)),
                prefixIcon: Padding(
                  padding: EdgeInsetsDirectional.only(start: 12.0),
                  child: Icon(Icons.lock, color: Colors.white),
                ),
              ),
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            Row(
              children: [
                CheckboxListTile(value: false, onChanged: bool)
              ],
            )
          ],
        ),
      ),
    );
  }
}
