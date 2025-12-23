import 'package:vocadb_flutter_app/features/songs/domain/entities/song.dart';

class SongModel {
  final int id;
  final String name;
  final String defaultName;
  final String artistString;
  final String? thumbUrl;

  SongModel({
    required this.id,
    required this.name,
    required this.defaultName,
    required this.artistString,
    this.thumbUrl,
  });

  factory SongModel.fromJson(Map<String, dynamic> json) {
    return SongModel(
      id: json['id'],
      name: json['name'] ?? '',
      defaultName: json['defaultName'] ?? '',
      artistString: json['artistString'] ?? '',
      thumbUrl: json['mainPicture']?['urlThumb'],
    );
  }

  Song toEntity() {
    return Song(
      id: id,
      name: name,
      defaultName: defaultName,
      artistString: artistString,
      thumbUrl: thumbUrl,
    );
  }
}
