import 'package:flutter/material.dart';
import 'package:notes_app/data/data_source.dart';

import '../model/notes.dart'; // Ensure this path is correct

class UpdateNotePage extends StatefulWidget {
  final Note note;

  const UpdateNotePage({Key? key, required this.note}) : super(key: key);

  @override
  _UpdateNotePageState createState() => _UpdateNotePageState();
}

class _UpdateNotePageState extends State<UpdateNotePage> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.note.title;
    _contentController.text = widget.note.content;
  }

  void _updateNote() async {
    if (_titleController.text.isEmpty || _contentController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Both title and content must be provided.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final updatedNote = Note(
      id: widget.note.id,
      title: _titleController.text,
      content: _contentController.text,
      createdAt: widget.note.createdAt,
    );

    try {
      await DataSource.instance.updateNote(updatedNote);
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to update note. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Note'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(labelText: 'Content'),
              maxLines: 5,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateNote,
              child: Text('Update Note'),
            ),
          ],
        ),
      ),
    );
  }
}
