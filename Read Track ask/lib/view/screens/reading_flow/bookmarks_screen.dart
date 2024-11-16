import 'package:flutter/material.dart';

import '../../../model/bookmark.dart';
import '../../widgets/bookmark_card.dart';

class BookmarksScreen extends StatefulWidget {
  const BookmarksScreen({super.key, required this.bookmarks});

  final List<Bookmark> bookmarks;

  @override
  State<BookmarksScreen> createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.bookmarks.length,
      itemBuilder: (context, index) {
        Bookmark bookmark = widget.bookmarks[index];
        return BookmarkCard(
          pageNumber: bookmark.pageNumber,
          title: bookmark.title,
        );
      },
    );
  }
}
