import 'package:connectivity_plus/connectivity_plus.dart';

import 'lyrics.modal.dart';

class TrackModal {
  int? track_id;
  String? track_name;
  int? track_rating;
  int? commontrack_id;
  String? artist_name;
  String? album_name;
  int? explicit;
  TrackModal(
      {this.track_id,
      this.track_name,
      this.track_rating,
      this.commontrack_id,
      this.artist_name,
      this.explicit,
      this.album_name});
  factory TrackModal.toJSON(Map<String, dynamic> data) {
    return TrackModal(
        track_id: data['track_id'] ?? null,
        track_name: data['track_name'] ?? '',
        track_rating: data['track_rating'] ?? null,
        artist_name: data['artist_name'] ?? '',
        album_name: data['album_name'] ?? '',
        explicit: data['explicit'] ?? null,
        commontrack_id: data['commontrack_id'] ?? null);
  }
}
//   Text("Name"),
//   Text("Artist"),
//   Text("Album Name"),
//   Text("Expicit"),
//   Text("Rating"),
//   Text("Lyries"),

class TrackModalScreenData {
  List<TrackModal>? modal;
  ConnectivityResult? connectionStatus;
  bool loading;
  TrackModalScreenData(
      {this.modal, this.connectionStatus, this.loading = true});
}

class TrackDetailScreenData {
  TrackModal? modal;
  ConnectivityResult? connectionStatus;
  bool loading;
  LyricsModal? lyricsModal;
  TrackDetailScreenData(
      {this.modal,
      this.connectionStatus,
      this.loading = true,
      this.lyricsModal});
}
