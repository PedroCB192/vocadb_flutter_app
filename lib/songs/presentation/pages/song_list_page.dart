import 'package:flutter/material.dart';
import 'package:vocadb_flutter_app/songs/presentation/controllers/song_controller.dart';
import '../widgets/highlighted_songs_pager.dart';

class SongListPage extends StatelessWidget {
  final SongController controller;
  const SongListPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Highlighted Songs')),
      body: FutureBuilder(
        future: controller.fetchHighlightedSongs(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError || !snapshot.hasData) {
            return const Center(child: Text('Error loading songs'));
          }

          return HighlightedSongsPager(songs: snapshot.data!);
        },
      ),
    );
  }
}
