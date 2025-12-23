class ServerException implements Exception {
  final String message;
  ServerException({this.message = 'Server error occurred'});

  @override
  String toString() => message;
}

class NotFoundException implements Exception {
  final String message;
  NotFoundException({this.message = 'Resource not found'});

  @override
  String toString() => message;
}

class NetworkException implements Exception {
  final String message;
  NetworkException({this.message = 'Network error occurred'});

  @override
  String toString() => message;
}
