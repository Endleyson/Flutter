import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:favorite_youtube_app/blocs/videos_bloc.dart';
import 'package:flutter/material.dart';
import './views/home_screen.dart';
import 'api.dart';

void main() {
  Api api = Api();
  api.search("eletro");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [VideosBloc()],
      dependencies: [],
      child: MaterialApp(
        title: 'MyTube',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Home(),
      ),
    );
  }
}
