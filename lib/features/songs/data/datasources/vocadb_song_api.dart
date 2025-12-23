// lib/features/songs/data/datasources/vocadb_song_api.dart
import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_endpoints.dart';

class VocadbSongApi {
  final ApiClient _apiClient;

  VocadbSongApi({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<List<Map<String, dynamic>>> fetchHighlightedSongs() async {
    final data = await _apiClient.get(
      ApiEndpoints.highlightedSongs,
      queryParams: ApiEndpoints.defaultSongParams,
    );

    final list = data as List;
    return list.cast<Map<String, dynamic>>();
  }

  Future<List<Map<String, dynamic>>> fetchPostedSongs({
    int start = 0,
    int maxResults = 20,
    String sort = 'PublishDate',
  }) async {
    final queryParams = {
      ...ApiEndpoints.defaultListParams,
      ...ApiEndpoints.defaultSongParams,
      'start': start.toString(),
      'maxResults': maxResults.toString(),
      'sort': sort,
    };

    final data = await _apiClient.get(
      ApiEndpoints.songs,
      queryParams: queryParams,
    );

    final list = data['items'] as List;
    return list.cast<Map<String, dynamic>>();
  }
}
