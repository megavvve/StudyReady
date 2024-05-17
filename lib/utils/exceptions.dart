class AuthException implements Exception {
  final String message;

  AuthException(this.message);

  @override
  String toString() {
    return 'AuthException: $message';
  }
}

class DataStoreException implements Exception {
  final String message;

  DataStoreException(this.message);

  @override
  String toString() {
    return 'DataStoreException: $message';
  }
}

class DataFetchException implements Exception {
  final String message;

  DataFetchException(this.message);

  @override
  String toString() {
    return 'DataFetchException: $message';
  }
}
