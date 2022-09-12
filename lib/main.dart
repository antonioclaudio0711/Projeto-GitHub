import 'package:flutter/material.dart';
import 'package:githubproject/follower_page/cubit/follower_cubit.dart';
import 'package:githubproject/login_page/cubit/search_cubit.dart';
import 'package:githubproject/entry_page/entry_page.dart';
import 'package:githubproject/follower_page/follower_page.dart';
import 'package:githubproject/login_page/login_page.dart';
import 'package:githubproject/repository_page/cubit/repository_cubit.dart';
import 'package:githubproject/repository_page/repository_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MyLoginPage(SearchCubit()),
        '/entrada': (context) => const EntryPage(),
        '/seguidores': (context) => FollowerPage(FollowerCubit()),
        '/repositórios': (context) => RepositoryPage(RepositoryCubit()),
      },
    );
  }
}
