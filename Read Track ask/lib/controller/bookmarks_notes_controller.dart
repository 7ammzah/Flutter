// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:get/get.dart';

import '../model/bookmark.dart';
import '../model/note.dart';

class BookmarksNotesController extends GetxController {
  final List<Note> notes = List<Note>.empty(growable: true).obs;
  final List<Bookmark> bookmarks = List<Bookmark>.empty(growable: true).obs;

  void addNote(Note note) {
    notes.add(note);
  }

  void editNote(int pageNumber, String text) {
    Note _note = Note(pageNumber: pageNumber, text: text);
    removeNote(pageNumber);
    notes.add(_note);
  }

  void removeNote(int pageNumber) {
    notes.removeWhere((element) => element.pageNumber == pageNumber);
  }

  void removeAllNotes() {
    notes.clear();
  }

  void addBookmark(Bookmark bookmark) {
    bookmarks.add(bookmark);
  }

  void editBookmark(int pageNumber, String title) {
    Bookmark _bookmark = Bookmark(pageNumber: pageNumber, title: title);
    removeBookmark(pageNumber);
    bookmarks.add(_bookmark);
  }

  void removeBookmark(int pageNumber) {
    bookmarks.removeWhere((element) => element.pageNumber == pageNumber);
  }

  void removeAllBookmarks() {
    bookmarks.clear();
  }

  getAllNotes() {
    notes.sort((a, b) => a.pageNumber.compareTo(b.pageNumber));
    return notes;
  }

  getAllBookmarks() {
    bookmarks.sort((a, b) => a.pageNumber.compareTo(b.pageNumber));
    return bookmarks;
  }
}
