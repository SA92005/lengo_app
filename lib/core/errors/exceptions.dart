abstract class Exceptions implements Exception {
  final String message;

  const Exceptions({required this.message});
}

class ServerException extends Exceptions {
  const ServerException({required super.message});
}

class CacheException extends Exceptions {
  const CacheException({required super.message});
}
