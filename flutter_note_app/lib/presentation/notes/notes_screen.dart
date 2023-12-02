import 'package:flutter/material.dart';
import 'package:flutter_note_app/domain/model/note.dart';
import 'package:flutter_note_app/presentation/notes/add_edit_note_screen.dart';
import 'package:flutter_note_app/presentation/notes/components/note_item.dart';
import 'package:flutter_note_app/presentation/notes/notes_event.dart';
import 'package:flutter_note_app/presentation/notes/notes_view_model.dart';
import 'package:flutter_note_app/ui/colors.dart';
import 'package:provider/provider.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<NotesViewModel>();
    final state = viewModel.state;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Note',
          style: TextStyle(fontSize: 30),
        ),
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.sort)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            bool? isSaved = await Navigator.push(context,
                MaterialPageRoute(builder: (_) => const AddEditNoteScreen()));

            if(isSaved != null && isSaved) {
              viewModel.onEvent(const NotesEvent.loadNotes());
            }
          },
          child: const Icon(Icons.add)),
      body: ListView(
        children: state.notes
            .map(
              (note) => NoteItem(
                note: Note(
                    title: note.title,
                    content: note.content,
                    color: note.color,
                    timestamp: note.timestamp),
              ),
            )
            .toList(),
      ),
    );
  }
}
