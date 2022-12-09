class LyricsModal {
  int? lyrics_id;
  int? explicit;
  String? lyrics_body;
  LyricsModal({this.lyrics_id, this.explicit, this.lyrics_body});
  factory LyricsModal.toJson(Map<String, dynamic> data) {
    return LyricsModal(
      lyrics_id: data["lyrics_id"] ?? '',
      explicit: data["explicit"] ?? '',
      lyrics_body: data["lyrics_body"] ?? '',
    );
  }
}
