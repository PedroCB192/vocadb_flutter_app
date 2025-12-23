import 'package:flutter/material.dart';
import 'package:vocadb_flutter_app/features/songs/domain/entities/song.dart';
import 'package:vocadb_flutter_app/features/songs/presentation/widgets/posted_song_button.dart';

class PostedSongsPage extends StatelessWidget {
  final List<Song> songs;

  const PostedSongsPage({super.key, required this.songs});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      itemCount: songs.length,
      separatorBuilder: (_, __) => const SizedBox(height: 4),
      itemBuilder: (_, index) {
        return PostedSongButton(song: songs[index]);
      },
    );
  }
}
