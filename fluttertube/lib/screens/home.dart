import 'package:flutter/material.dart';
import 'package:fluttertube/delegates/data_search.dart';
import 'package:fluttertube/blocs/videos_bloc.dart';
import 'package:fluttertube/models/video.dart';
import 'package:fluttertube/modules/favorite_module.dart';
import 'package:fluttertube/modules/home_module.dart';
import 'package:fluttertube/widgets/video_tile.dart';
import 'package:fluttertube/blocs/favorite_bloc.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 25,
          child: Image.asset("images/yt_logo_rgb_dark.png"),
        ),
        elevation: 0,
        backgroundColor: Colors.black87,
        actions: <Widget>[
          Align(
            alignment: Alignment.center,
            child: StreamBuilder<Map<String, Video>>(
              stream: HomeModule.to.bloc<FavoriteBloc>().outFav,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text("${snapshot.data.length}");
                } else {
                  return Container();
                }
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.star),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => FavoriteModule()));
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              String result =
                  await showSearch(context: context, delegate: DataSearch());
              if (result != null)
                HomeModule.to.bloc<VideosBloc>().inSearch.add(result);
            },
          )
        ],
      ),
      body: StreamBuilder(
        stream: HomeModule.to.bloc<VideosBloc>().outVideos,
        initialData: [],
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                if (index < snapshot.data.length) {
                  return VideoTile(snapshot.data[index]);
                } else if (index > 1) {
                  HomeModule.to.bloc<VideosBloc>().inSearch.add(null);
                  return Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                    ),
                  );
                } else {
                  return Container();
                }
              },
              itemCount: snapshot.data.length + 1,
            );
          } else {
            return Container();
          }
        },
      ),
      backgroundColor: Colors.black87,
    );
  }
}
