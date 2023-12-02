import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter_note_app/domain/model/note.dart';
import 'package:flutter_note_app/domain/repository/note_repository.dart';
import 'package:flutter_note_app/presentation/notes/notes_event.dart';
import 'package:flutter_note_app/presentation/notes/notes_state.dart';

class NotesViewModel with ChangeNotifier {
  final NoteRepository repository;

  NotesState _state = NotesState();

  NotesState get state => _state;

  Note? _recentlyDeleteNote;

  NotesViewModel(this.repository) {
    _loadNotes();
  }

  void onEvent(NotesEvent event) {
    event.when(loadNotes: _loadNotes, deleteNote: _deleteNote, restoreNote: _restoreNote);
  }

  Future<void> _loadNotes() async {
    List<Note> notes = await repository.getNotes();
    _state = state.copyWith(notes: notes);
    notifyListeners();
  }

  Future<void> _deleteNote(Note note) async {
    await repository.deleteNote(note);
    await _loadNotes();
  }

  Future<void> _restoreNote() async {
    if(_recentlyDeleteNote != null) {
      await repository.insertNote(_recentlyDeleteNote!);
      _recentlyDeleteNote = null;

      _loadNotes();
    }
  }
}