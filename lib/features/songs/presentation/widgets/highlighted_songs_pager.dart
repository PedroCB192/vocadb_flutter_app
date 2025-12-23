import 'package:flutter/material.dart';
import 'package:vocadb_flutter_app/features/songs/domain/entities/song.dart';
import 'highlighted_songs_page.dart';

class HighlightedSongsPager extends StatefulWidget {
  final List<Song> songs;

  const HighlightedSongsPager({super.key, required this.songs});

  @override
  State<HighlightedSongsPager> createState() => _HighlightedSongsPagerState();
}

class _HighlightedSongsPagerState extends State<HighlightedSongsPager> {
  final _controller = PageController();
  int _currentPage = 0;

  static const int itemsPerPage = 9;

  @override
  Widget build(BuildContext context) {
    final pages = <List<Song>>[];

    for (int i = 0; i < widget.songs.length; i += itemsPerPage) {
      pages.add(widget.songs.skip(i).take(itemsPerPage).toList());
    }

    return Column(
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            final spacing = 12.0;
            final padding = 12.0 * 2;

            final itemSize = (width - padding - (spacing * 2)) / 3;
            final gridHeight = (itemSize * 3) + (spacing * 2) + padding;

            return SizedBox(
              height: gridHeight,
              child: PageView.builder(
                controller: _controller,
                itemCount: pages.length,
                onPageChanged: (index) {
                  setState(() => _currentPage = index);
                },
                itemBuilder: (_, index) {
                  return HighlightedSongsPage(songs: pages[index]);
                },
              ),
            );
          },
        ),

        const SizedBox(height: 8),

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
