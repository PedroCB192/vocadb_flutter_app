import 'package:vocadb_flutter_app/features/songs/domain/entities/song.dart';
import 'package:vocadb_flutter_app/features/songs/domain/repositories/song_repository.dart';

class GetPostedSong {
  final SongRepository repository;

  GetPostedSong(this.repository);

  Future<List<Song>> call() async {
    return await repository.getPostedSong();
  }
}
