import 'package:flutter/material.dart';
import 'package:rive/rive.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home:Splash(),
      debugShowCheckedModeBanner: false,

    );
  }
}
class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override

Widget build(BuildContext context) {
   return Scaffold(
      body: Center(
        child: Container(
          width:100,
          height: 100,
          child: RiveAnimation.asset('assets/gears.riv', ),
        )
      ),
    );
  }
}

