import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

import '../modal/lyrics.modal.dart';
import '../modal/track-modal.dart';
import '../service/api-service.dart';

class TrackDetailBlock {
  ApiService _api = new ApiService();
  TrackModal? _modalList;
  LyricsModal? _lyricsModal;
  final Connectivity _connectivity = Connectivity();
  StreamController<TrackDetailScreenData> _trackStreamCtr =
      StreamController<TrackDetailScreenData>();
  StreamSubscription<ConnectivityResult>? internetConnetionSubscription;
  int track_id;
  Stream<TrackDetailScreenData> get getStream => _trackStreamCtr.stream;
  TrackDetailBlock({required this.track_id}) {
    init(ConnectivityResult.none);
    internetConnetionSubscription =
        _connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.none) {
        _modalList = null;
        _trackStreamCtr.addError("Please check internet connection");
      } else {
        init(event);
      }
    });
  }
  init(ConnectivityResult event) async {
    try {
      _trackStreamCtr.add(TrackDetailScreenData(
          modal: null, connectionStatus: event, loading: true));

      _modalList = await _api.trackGet(track_id);
      _lyricsModal = await _api.trackLyricsGet(track_id);
      // print(a);
      if (_modalList != null) {
        _trackStreamCtr.add(TrackDetailScreenData(
            modal: _modalList!,
            connectionStatus: event,
            loading: false,
            lyricsModal: _lyricsModal));
      }
      print(_modalList);
    } catch (err) {
      _modalList = null;
      _trackStreamCtr.addError(err.toString());
    }
  }

  dispose() {
    try {
      _trackStreamCtr.close();
      internetConnetionSubscription!.cancel();
    } catch (err) {}
  }
}
