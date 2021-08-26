import 'dart:async' show Stream, StreamController;
import 'dart:ui';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:favorite_youtube_app/models/video.dart';

import '../api.dart';

class VideosBloc implements BlocBase{
  late Api api;
  late List<Video> videos;

  final StreamController _videosController = StreamController();
  Stream get outVideos => _videosController.stream;
  final StreamController _searchController = StreamController();
  Sink get inSearch => _searchController.sink;


  lateVideosBloc() async {
    api = Api();
    _searchController.stream.listen(_search);
  }

  void _search(search) async{
    videos = await api.search(search);
  }

  @override
  void dispose() {
    _videosController.close();
    _searchController.close();
    // TODO: implement dispose
  }

  @override
  void addListener(VoidCallback listener) {
    // TODO: implement addListener
  }

  @override
  // TODO: implement hasListeners
  bool get hasListeners => throw UnimplementedError();

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
  }

  @override
  void removeListener(VoidCallback listener) {
    // TODO: implement removeListener
  }

}

