import 'package:flutter/material.dart';
import 'package:vocadb_flutter_app/features/songs/domain/entities/song.dart';
import 'package:vocadb_flutter_app/features/songs/presentation/widgets/posted_song_page.dart';

class PostedSongsPager extends StatefulWidget {
  final List<Song> songs;

  const PostedSongsPager({super.key, required this.songs});

  @override
  State<PostedSongsPager> createState() => _PostedSongsPagerState();
}

class _PostedSongsPagerState extends State<PostedSongsPager> {
  final _controller = PageController(viewportFraction: 0.92);
  int _currentPage = 0;

  static const int itemsPerPage = 4;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pages = <List<Song>>[];

    for (int i = 0; i < widget.songs.length; i += itemsPerPage) {
      pages.add(widget.songs.skip(i).take(itemsPerPage).toList());
    }

    return Column(
      children: [
        SizedBox(
          height: 310,
          child: PageView.builder(
            controller: _controller,
            itemCount: pages.length,
            onPageChanged: (index) {
              setState(() => _currentPage = index);
            },
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: PostedSongsPage(songs: pages[index]),
              );
            },
          ),
        ),

        const SizedBox(height: 12),

        // Pages Indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            pages.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: _currentPage == index ? 10 : 6,
              height: 6,
              decoration: BoxDecoration(
                color: _currentPage == index ? Colors.white : Colors.white38,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
