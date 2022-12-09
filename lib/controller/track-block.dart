import 'dart:async';

import 'package:flutter/cupertino.dart';

import 'package:connectivity_plus/connectivity_plus.dart';

import '../modal/track-modal.dart';
import '../service/api-service.dart';

class TrackBlock {
  ApiService _api = new ApiService();
  List<TrackModal>? _modalList;

  final Connectivity _connectivity = Connectivity();

  StreamController<TrackModalScreenData> _trackStreamCtr =
      StreamController<TrackModalScreenData>();

  BuildContext context;
  StreamSubscription<ConnectivityResult>? internetConnetionSubscription;
  TrackBlock({required this.context}) {
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
  Stream<TrackModalScreenData> get getStream => _trackStreamCtr.stream;
  init(ConnectivityResult event) async {
    try {
      _trackStreamCtr.add(TrackModalScreenData(
          modal: [], connectionStatus: event, loading: true));
      _modalList = await this._api.chartTracks();

      if (_modalList != null) {
        _trackStreamCtr.add(TrackModalScreenData(
            modal: _modalList!, connectionStatus: event, loading: false));
      }
    } catch (err) {
      _modalList = null;
      _trackStreamCtr.addError(err.toString());
    }
  }

  void dispose() {
    try {
      _trackStreamCtr.close();
      internetConnetionSubscription!.cancel();
    } catch (err) {}
  }
}
