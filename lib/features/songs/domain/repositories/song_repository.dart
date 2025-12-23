import 'package:vocadb_flutter_app/features/songs/domain/entities/song.dart';

abstract class SongRepository {
  Future<List<Song>> getHighlightedSong();
  Future<List<Song>> getPostedSong();
}
