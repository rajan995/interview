// https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7

// https://api.musixmatch.com/ws/1.1/track.get?track_id=TRACK_ID
// &apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7

// https://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=TRAC
// K_ID&apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7
import 'dart:convert';

import 'package:dio/dio.dart';

import '../config.dart';
import '../modal/lyrics.modal.dart';
import '../modal/track-modal.dart';

class ApiService {
  Map<String, dynamic> endpoint = {
    "charttracks": "/chart.tracks.get",
    "trackget": "/track.get",
    "tracklyricsget": "/track.lyrics.get"
  };

  Future<TrackModal?> trackGet(int track_id) async {
    try {
      Map<String, String> queryParam = {
        "track_id": track_id.toString(),
        "apikey": Config.musixmatchApiKey
      };
      var response = await Dio().get((Config.apiUrl + endpoint["trackget"]),
          queryParameters: queryParam);
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.data)['message']['body']
            ['track'] as Map<String, dynamic>;
        return TrackModal.toJSON(data);
      } else {
        throw "Something wrong Please try again";
      }
    } on DioError catch (e) {
      throw (e.message.toString());
    }
  }

  Future<List<TrackModal>?> chartTracks() async {
    try {
      Map<String, String> queryParam = {"apikey": Config.musixmatchApiKey};
      var response = await Dio().get((Config.apiUrl + endpoint["charttracks"]),
          queryParameters: queryParam);
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.data)['message']['body']
            ['track_list'] as List<dynamic>;
        return data
            .map<TrackModal>((value) => TrackModal.toJSON(value['track']))
            .toList();
      } else {
        throw "Something wrong Please try again";
      }
    } on DioError catch (e) {
      throw (e.message.toString());
    }
  }

  Future<LyricsModal?> trackLyricsGet(int track_id) async {
    try {
      Map<String, String> queryParam = {
        "track_id": track_id.toString(),
        "apikey": Config.musixmatchApiKey
      };
      var response = await Dio().get(
          (Config.apiUrl + endpoint["tracklyricsget"]),
          queryParameters: queryParam);
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.data)['message']['body']
            ['lyrics'] as Map<String, dynamic>;
        return LyricsModal.toJson(data);
      } else {
        throw "Something wrong Please try again";
      }
    } on DioError catch (e) {
      throw (e.message.toString());
    }
  }
}
