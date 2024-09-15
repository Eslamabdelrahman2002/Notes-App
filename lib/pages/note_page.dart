import 'package:flutter/material.dart';
import 'package:notes_app/data/data_source.dart';

import '../components/my_card.dart';
import '../model/notes.dart';
import 'add_note_page.dart';
import 'update_note_page.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  Future<void> _loadNotes() async {
    await DataSource.instance.getNotes();
    setState(() {});
  }

  void _deleteNote(int index) async {
    await DataSource.instance.deleteNotes(index);
    _loadNotes();
  }

  void _editNote(Note note) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UpdateNotePage(note: note),
      ),
    );
    _loadNotes();
  }

  @override
  Widget build(BuildContext context) {
    final dataSource = DataSource.instance;

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Notes App")),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 110),
        child: dataSource.notes.isEmpty
            ? Center(child: Text("No notes available"))
            : ListView.separated(
                itemBuilder: (context, index) {
                  return MyCard(
                    note: dataSource.notes[index],
                    onPressed: () {
                      _deleteNote(index);
                    },
                    onEditPressed: () {
                      _editNote(dataSource.notes[index]);
                    },
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 15),
                itemCount: dataSource.notes.length,
              ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey.shade700,
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNotePage()),
          );
          _loadNotes();
        },
        child: Icon(Icons.add, color: Colors.white, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
