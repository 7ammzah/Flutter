import 'package:flutter/material.dart';

import '../../../model/note.dart';
import '../../widgets/note_card.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key, required this.notes});

  final List<Note> notes;

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.notes.length,
      itemBuilder: (context, index) {
        Note note = widget.notes[index];
        return NoteCard(
          pageNumber: note.pageNumber,
          text: note.text,
        );
      },
    );
  }
}
