import '../model/notes.dart';

class DataSource {
  static final DataSource instance = DataSource._privateConstructor();

  DataSource._privateConstructor();

  List<Note> notes = []; // List of Note objects

  Future<void> getNotes() async {
    try {} catch (e) {
      print('Failed to fetch notes: $e');
    }
  }

  Future<void> deleteNotes(int index) async {
    try {
      notes.removeAt(index);
    } catch (e) {
      print('Failed to delete note: $e');
    }
  }

  Future<void> updateNote(Note updatedNote) async {
    try {
      final index = notes.indexWhere((note) => note.id == updatedNote.id);
      if (index != -1) {
        notes[index] = updatedNote;
      } else {
        print('Note not found for update');
      }
    } catch (e) {
      print('Failed to update note: $e');
    }
  }

  Future<void> addNotes(Note newNote) async {
    try {
      notes.add(newNote);
    } catch (e) {
      print('Failed to add note: $e');
    }
  }
}
