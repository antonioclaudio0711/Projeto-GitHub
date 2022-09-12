import 'dart:convert';

class Follower {
  Follower({
    required this.login,
  });

  final String login;

  static List<Follower> fromListJson(String json) {
    final decoded = jsonDecode(json) as List<dynamic>;
    return decoded
        .map(
          (e) => Follower.fromJson(e),
        )
        .toList();
  }

  factory Follower.fromJson(Map<dynamic, dynamic> json) {
    return Follower(
      login: json['login'],
    );
  }
}
