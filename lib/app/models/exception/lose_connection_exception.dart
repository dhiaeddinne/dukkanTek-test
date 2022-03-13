
class LoseConnectionException implements Exception {
  final String message;
  LoseConnectionException({required this.message});
}