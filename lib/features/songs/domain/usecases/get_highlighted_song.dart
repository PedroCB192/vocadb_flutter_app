import 'package:vocadb_flutter_app/features/songs/domain/entities/song.dart';
import 'package:vocadb_flutter_app/features/songs/domain/repositories/song_repository.dart';

class GetHighlightedSong {
  final SongRepository repository;

  GetHighlightedSong(this.repository);

  Future<List<Song>> call() {
    return repository.getHighlightedSong();
  }
}
