import 'package:flutter/material.dart';
import 'package:vocadb_flutter_app/songs/domain/entities/song.dart';

class HighlightedSongButton extends StatelessWidget {
  final Song song;

  const HighlightedSongButton({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: InkWell(
        onTap: () {
          debugPrint('Song ID: ${song.id}');
        },
        borderRadius: BorderRadius.circular(12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // 🖼 Imagen
              Image.network(
                song.thumbUrl ?? '',
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  color: Colors.grey.shade800,
                  child: const Icon(Icons.music_note, size: 32),
                ),
              ),

              // 🌑 Gradiente inferior
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
                  ),
                ),
              ),

              // 📝 Nombre de la canción
              Positioned(
                left: 6,
                right: 6,
                bottom: 6,
                child: Text(
                  song.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
