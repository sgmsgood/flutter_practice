import 'dart:async';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_note_app/domain/model/note.dart';
import 'package:flutter_note_app/domain/repository/note_repository.dart';
import 'package:flutter_note_app/domain/use_case/add_note.dart';
import 'package:flutter_note_app/presentation/add_edit_note/add_edit_note_event.dart';
import 'package:flutter_note_app/presentation/add_edit_note/add_edit_note_ui_event.dart';
import 'package:flutter_note_app/ui/colors.dart';

class AddEditNoteViewModel with ChangeNotifier {
  final NoteRepository repository;

  int _color = roseBud.value;

  int get color => _color;

  final _eventController = StreamController<AddEditNoteUiEvent>();
  Stream<AddEditNoteUiEvent> get eventStream => _eventController.stream;

  AddEditNoteViewModel(this.repository);

  void onEvent(AddEditNoteEvent event) {
    event.when(changeColor: _changeColor, saveNote: _saveNote);
  }

  Future<void> _changeColor(int color) async {
    _color = color;
    notifyListeners();
  }

  Future<void> _saveNote(int? id, String title, String content) async {
    if (id == null) {
      repository.insertNote(
        Note(
          title: title,
          content: content,
          color: _color,
          timestamp: DateTime
              .now()
              .millisecondsSinceEpoch,
        ),
      );
    } else {
      await repository.updateNote(
        Note(
          id: id,
          title: title,
          content: content,
          color: _color,
          timestamp: DateTime
              .now()
              .millisecondsSinceEpoch,
        ),
      );
    }

    _eventController.add(AddEditNoteUiEvent.saveNote());
  }
}
