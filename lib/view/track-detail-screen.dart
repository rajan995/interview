import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/track-block.dart';
import '../controller/track-detail-block.dart';
import '../helper/loading.dart';
import '../modal/lyrics.modal.dart';
import '../modal/track-modal.dart';

class TrackDetailScreen extends StatelessWidget {
  static bind(int id) {
    return Provider<TrackDetailBlock>(
      create: ((context) => TrackDetailBlock(track_id: id)),
      dispose: (context, value) => value.dispose(),
      child: Consumer<TrackDetailBlock>(
        builder: (BuildContext context, value, Widget? child) {
          return TrackDetailScreen(
            id: id,
            trackDetailBlock: value,
          );
        },
      ),
    );
  }

  TrackDetailScreen(
      {super.key, required this.id, required this.trackDetailBlock});
  int id;
  TrackDetailBlock trackDetailBlock;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Track Detail"),
        centerTitle: true,
      ),
      body: StreamBuilder<TrackDetailScreenData>(
          stream: trackDetailBlock!.getStream,
          builder: (BuildContext context,
              AsyncSnapshot<TrackDetailScreenData> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.loading) {
                return LoadingWidget();
              } else {
                return showData(
                    snapshot!.data!.modal!, snapshot.data!.lyricsModal);
              }
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return LoadingWidget();
            }
          }),
    );
  }
}

Widget showData(TrackModal? modal, LyricsModal? lyricsModal) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SingleChildScrollView(
      child: Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Name",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text(modal!.track_name ?? ''),
          SizedBox(
            height: 15,
          ),
          Text(
            "Artist",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text(modal!.artist_name ?? ''),
          SizedBox(
            height: 15,
          ),
          Text(
            "Album Name",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text(modal!.album_name ?? ''),
          SizedBox(
            height: 15,
          ),
          Text(
            "Expicit",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text(modal!.explicit.toString()),
          SizedBox(
            height: 15,
          ),
          Text(
            "Rating",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text(modal!.track_rating.toString()),
          SizedBox(
            height: 15,
          ),
          Text(
            "Lyries",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          if (lyricsModal != null) Text(lyricsModal.lyrics_body ?? ''),
        ]),
        //
      ),
    ),
  );
}
// return Column(children: [

// ]);
