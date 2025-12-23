import 'package:vocadb_flutter_app/songs/domain/entities/song.dart';
import 'package:vocadb_flutter_app/songs/domain/usecases/get_highlighted_song.dart';
import 'package:vocadb_flutter_app/songs/domain/usecases/get_posted_song.dart';

class SongController {
  final GetHighlightedSong getHighlightedSong;
  final GetPostedSong getPostedSong;

  SongController({
    required this.getHighlightedSong,
    required this.getPostedSong,
  });

  Future<List<Song>> fetchHighlightedSongs() {
    return getHighlightedSong();
  }

  Future<List<Song>> fetchPostedSongs() {
    return getPostedSong();
  }
}
