import 'package:vocadb_flutter_app/songs/data/datasources/vocadb_song_api.dart';
import 'package:vocadb_flutter_app/songs/data/models/song_model.dart';
import 'package:vocadb_flutter_app/songs/domain/entities/song.dart';
import 'package:vocadb_flutter_app/songs/domain/repositories/song_repository.dart';

class SongRepositoryImpl implements SongRepository {
  final VocadbSongApi vocadbSongApi;

  SongRepositoryImpl({required this.vocadbSongApi});

  @override
  Future<List<Song>> getHighlightedSong() async {
    final songJsonList = await vocadbSongApi.fetchHighlightedSongs();
    return songJsonList
        .map((json) => SongModel.fromJson(json).toEntity())
        .toList();
  }
}
