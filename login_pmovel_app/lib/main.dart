import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home:Home(),
  ));
}
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        /*decoration: BoxDecoration(
          image: DecorationImage(
              image: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRa8qOI6zm91XI9-vwOkyHI_zDqivONwGlWUQ&usqp=CAU").image
          ),
        ),*/
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.all(10.0),
                child: Image.network("https://www.pmovel.com.br/images/logo_v.png")
            ),

          ],
        ),
      ),
    );
  }
}
