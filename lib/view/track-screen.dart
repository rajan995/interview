import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../controller/track-block.dart';
import '../helper/loading.dart';
import '../modal/track-modal.dart';
import 'track-detail-screen.dart';

class TrackScreen extends StatelessWidget {
  static bind() {
    return Provider<TrackBlock>(
      create: ((context) => TrackBlock(context: context)),
      dispose: (context, value) => value.dispose(),
      child: Consumer<TrackBlock>(
        builder: (BuildContext context, value, Widget? child) {
          return TrackScreen(trackBlock: value);
        },
      ),
    );
  }

  TrackScreen({super.key, this.trackBlock});

  TrackBlock? trackBlock;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Tranding Screen"), centerTitle: true),
        body: StreamBuilder<TrackModalScreenData>(
          stream: trackBlock!.getStream,
          builder: (BuildContext context,
              AsyncSnapshot<TrackModalScreenData> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.loading) {
                return LoadingWidget();
              } else {
                return showdata(snapshot.data!.modal!);
              }
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return LoadingWidget();
            }
          },
        ));
  }

  Widget showdata(List<TrackModal> data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, i) => Padding(
              padding: const EdgeInsets.all(8.00),
              child: Container(
                  child: ListTile(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                TrackDetailScreen.bind(data[i].track_id!))),
                    trailing: Text(data[i].artist_name ?? ''),
                    leading: Icon(Icons.ac_unit_rounded),
                    title: Text(data[i].track_name ?? ''),
                    subtitle: Text(data[i].track_rating.toString() ?? ''),
                  ),
                  decoration: BoxDecoration(
                      border: new Border(bottom: new BorderSide()))),
            ));
  }
}
