import 'package:vocadb_flutter_app/songs/data/datasources/vocadb_song_api.dart';
import 'package:vocadb_flutter_app/songs/data/repositories/song_repository_impl.dart';
import 'package:vocadb_flutter_app/songs/domain/usecases/get_highlighted_song.dart';
import 'package:vocadb_flutter_app/songs/presentation/controllers/song_controller.dart';

class AppDI {
  static SongController buildSongController() {
    // DATA
    final api = VocadbSongApi();

    final repository = SongRepositoryImpl(
      vocadbSongApi: api, // 👈 AQUÍ está el fix
    );

    // DOMAIN
    final getHighlightedSong = GetHighlightedSong(repository);

    // PRESENTATION
    return SongController(getHighlightedSong: getHighlightedSong);
  }
}
