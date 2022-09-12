import 'dart:convert';

class ApiError {
  ApiError({
    required this.message,
  });
  final String message;

  factory ApiError.fromJson(String json) {
    final decoded = jsonDecode(json);
    return ApiError(
      message: decoded['message'],
    );
  }
}
