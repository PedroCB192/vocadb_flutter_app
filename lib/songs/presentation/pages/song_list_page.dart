import 'package:flutter/material.dart';
import 'package:vocadb_flutter_app/songs/presentation/controllers/song_controller.dart';
import 'package:vocadb_flutter_app/songs/presentation/widgets/posted_song_pager.dart';
import '../widgets/highlighted_songs_pager.dart';

class SongListPage extends StatelessWidget {
  final SongController controller;

  const SongListPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 13, 13, 13),
      appBar: AppBar(
        title: const Text('VocaDB'),
        backgroundColor: const Color.fromARGB(255, 13, 13, 13),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Secction: Highlighted Songs
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text(
                'Highlighted Songs',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            FutureBuilder(
              future: controller.fetchHighlightedSongs(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SizedBox(
                    height: 200,
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                if (snapshot.hasError || !snapshot.hasData) {
                  return const SizedBox(
                    height: 200,
                    child: Center(
                      child: Text(
                        'Error loading highlighted songs',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  );
                }
                return HighlightedSongsPager(songs: snapshot.data!);
              },
            ),

            const SizedBox(height: 24),

            // Secction: Posted Songs
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text(
                'Recent Songs',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            FutureBuilder(
              future: controller.fetchPostedSongs(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SizedBox(
                    height: 350,
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                if (snapshot.hasError) {
                  debugPrint('ERROR POSTED SONGS: ${snapshot.error}');
                  debugPrint('STACK TRACE: ${snapshot.stackTrace}');
                  return SizedBox(
                    height: 350,
                    child: Center(
                      child: Text(
                        'Error: ${snapshot.error}',
                        style: const TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    ),
                  );
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const SizedBox(
                    height: 350,
                    child: Center(
                      child: Text(
                        'No hay canciones',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  );
                }
                return PostedSongsPager(songs: snapshot.data!);
              },
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
