class Song {
  final int id;
  final String name;
  final String defaultName;
  final String artistString;
  final String? thumbUrl;

  Song({
    required this.id,
    required this.name,
    required this.defaultName,
    required this.artistString,
    this.thumbUrl,
  });
}
