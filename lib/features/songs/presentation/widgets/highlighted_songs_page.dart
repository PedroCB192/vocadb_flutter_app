import 'package:flutter/material.dart';
import 'package:vocadb_flutter_app/features/songs/domain/entities/song.dart';
import 'highlighted_song_button.dart';

class HighlightedSongsPage extends StatelessWidget {
  final List<Song> songs;

  const HighlightedSongsPage({super.key, required this.songs});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(), // scroll interno
      padding: const EdgeInsets.all(12),
      itemCount: songs.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
      ),
      itemBuilder: (_, index) {
        return HighlightedSongButton(song: songs[index]);
      },
    );
  }
}
