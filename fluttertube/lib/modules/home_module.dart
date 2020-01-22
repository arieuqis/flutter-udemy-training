import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertube/blocs/favorite_bloc.dart';
import 'package:fluttertube/blocs/videos_bloc.dart';
import 'package:fluttertube/screens/home.dart';

class HomeModule extends ModuleWidget{
  
  @override
  List<Bloc> get blocs => [
    Bloc((i) => VideosBloc()),
    Bloc((i) => FavoriteBloc())
  ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => Home();

  static Inject get to => Inject<HomeModule>.of();

}