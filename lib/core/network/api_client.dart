// lib/core/network/api_client.dart
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../errors/exceptions.dart';

class ApiClient {
  final http.Client _client;
  final String baseUrl;

  ApiClient({http.Client? client, this.baseUrl = 'https://vocadb.net/api'})
    : _client = client ?? http.Client();

  Future<dynamic> get(
    String endpoint, {
    Map<String, String>? queryParams,
  }) async {
    try {
      final uri = Uri.parse(
        '$baseUrl$endpoint',
      ).replace(queryParameters: queryParams);

      final response = await _client.get(uri).timeout(Duration(seconds: 10));

      return _handleResponse(response);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  dynamic _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 404) {
      throw NotFoundException();
    } else if (response.statusCode >= 500) {
      throw ServerException(message: 'Server error: ${response.statusCode}');
    } else {
      throw ServerException(message: 'Request failed: ${response.statusCode}');
    }
  }

  void dispose() {
    _client.close();
  }
}
