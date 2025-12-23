// lib/app/di.dart
import 'package:vocadb_flutter_app/core/network/api_client.dart';
import 'package:vocadb_flutter_app/features/songs/data/datasources/vocadb_song_api.dart';
import 'package:vocadb_flutter_app/features/songs/data/repositories/song_repository_impl.dart';
import 'package:vocadb_flutter_app/features/songs/domain/usecases/get_highlighted_song.dart';
import 'package:vocadb_flutter_app/features/songs/domain/usecases/get_posted_song.dart';
import 'package:vocadb_flutter_app/features/songs/presentation/controllers/song_controller.dart';

class AppDI {
  // Core - Instancia única compartida
  static final ApiClient _apiClient = ApiClient();

  static SongController buildSongController() {
    // DATA
    final api = VocadbSongApi(apiClient: _apiClient);
    final repository = SongRepositoryImpl(vocadbSongApi: api);

    // DOMAIN
    final getHighlightedSong = GetHighlightedSong(repository);
    final getPostedSong = GetPostedSong(repository);

    // PRESENTATION
    return SongController(
      getHighlightedSong: getHighlightedSong,
      getPostedSong: getPostedSong,
    );
  }
}
