import 'package:flutter_note_app/domain/model/note.dart';
import 'package:sqflite/sqflite.dart';

class NoteDbHelper {
  Database db;

  final String _tableName = 'Note';

  NoteDbHelper(this.db);

  Future<Note?> getNoteById(int id) async {
    // SELECT * FROM note WHERE id = 1
    final List<Map<String, dynamic>> maps = await db.query(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Note.fromJson(maps.first);
    }

    return null;
  }

  Future<List<Note>> getNotes() async {
    final maps = await db.query(_tableName);

    return maps.map((e) => Note.fromJson(e)).toList();
  }

  Future<void> insertNote(Note note) async {
    await db.insert(_tableName, note.toJson());
  }

  Future<void> updateNote(Note note) async {
    await db.update(_tableName, note.toJson(), where: 'id = ?', whereArgs: [note.id]);
  }

  Future<void> deleteNote(Note note) async {
    await db.delete(_tableName, where: 'id = ?', whereArgs: [note.id]);
  }
}
