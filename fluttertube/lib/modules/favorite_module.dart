import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertube/blocs/favorite_bloc.dart';
import 'package:fluttertube/screens/favorites.dart';

class FavoriteModule extends ModuleWidget{
  
  @override
  List<Bloc> get blocs => [
    Bloc((i) => FavoriteBloc())
  ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => Favorites();

  static Inject get to => Inject<FavoriteModule>.of();

}