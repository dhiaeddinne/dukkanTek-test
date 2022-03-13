class GoogleLoginFailedException implements Exception {
  final String message;
  GoogleLoginFailedException({required this.message});
}