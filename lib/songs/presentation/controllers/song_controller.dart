import 'package:vocadb_flutter_app/songs/domain/entities/song.dart';
import 'package:vocadb_flutter_app/songs/domain/usecases/get_highlighted_song.dart';

class SongController {
  final GetHighlightedSong getHighlightedSong;

  SongController({required this.getHighlightedSong});

  Future<List<Song>> fetchHighlightedSongs() {
    return getHighlightedSong();
  }
}
