import 'dart:convert';

class Repository {
  Repository({
    required this.name,
  });

  final String name;

  static List<Repository> fromListJson(String json) {
    final decoded = jsonDecode(json) as List<dynamic>;
    return decoded
        .map(
          (e) => Repository.fromJson(e),
        )
        .toList();
  }

  factory Repository.fromJson(Map<dynamic, dynamic> json) {
    return Repository(
      name: json['name'],
    );
  }
}
