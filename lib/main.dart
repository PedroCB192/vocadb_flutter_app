import 'package:flutter/material.dart';
import 'package:vocadb_flutter_app/app/di.dart';
import 'package:vocadb_flutter_app/songs/presentation/pages/song_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SongListPage(controller: AppDI.buildSongController()),
    );
  }
}
