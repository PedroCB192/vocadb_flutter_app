import 'dart:convert';
import 'package:http/http.dart' as http;

class VocadbSongApi {
  final _client = http.Client();

  Future<List<Map<String, dynamic>>> fetchHighlightedSongs() async {
    final url = Uri.parse(
      'https://vocadb.net/api/songs/highlighted?languagePreference=Romaji&fields=MainPicture',
    );

    final response = await _client.get(url);

    if (response.statusCode != 200) {
      throw Exception('API error ${response.statusCode}');
    }

    final decoded = jsonDecode(response.body);

    final list = decoded as List;

    return list.cast<Map<String, dynamic>>();
  }

  Future<List<Map<String, dynamic>>> fetchPostedSongs() async {
    final url = Uri.parse(
      'https://vocadb.net/api/songs?childTags=false&unifyTypesAndTags=false&childVoicebanks=false&includeMembers=false&onlyWithPvs=true&start=0&maxResults=20&getTotalCount=false&sort=PublishDate&preferAccurateMatches=false&fields=MainPicture&lang=Romaji',
    );

    final response = await _client.get(url);

    if (response.statusCode != 200) {
      throw Exception('API error ${response.statusCode}');
    }

    final decoded = jsonDecode(response.body);

    final list = decoded['items'] as List;

    return list.cast<Map<String, dynamic>>();
  }
}
