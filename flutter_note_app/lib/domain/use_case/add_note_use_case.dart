import 'package:flutter_note_app/domain/model/note.dart';
import 'package:flutter_note_app/domain/repository/note_repository.dart';

class AddNoteUseCase {
  final NoteRepository repository;

  AddNoteUseCase(this.repository);

  Future<void> call(Note note) async{
    print("!!--->>> note::: ${note.title} / ${note.timestamp}");
    await repository.insertNote(note);
  }
}