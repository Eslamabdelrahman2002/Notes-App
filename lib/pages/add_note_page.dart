import 'package:flutter/material.dart';
import 'package:notes_app/components/my_bottom.dart';
import 'package:notes_app/components/my_text_field.dart';
import 'package:notes_app/data/data_source.dart';

import '../model/notes.dart'; // Ensure this path is correct and matches your Note class

class AddNotePage extends StatefulWidget {
  const AddNotePage({Key? key}) : super(key: key);

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  String? _noteText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Add Note")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Note",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            SizedBox(height: 10),
            MyTextField(
              text: "Enter Note Here.....",
              maxLines: 9,
              onChanged: (value) {
                setState(() {
                  _noteText = value;
                });
              },
            ),
            SizedBox(height: 25),
            MyBottom(
              text: "Add",
              onPressed: () async {
                if (_noteText == null || _noteText!.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Note cannot be empty!'),
                      backgroundColor: Colors.red,
                    ),
                  );
                  return;
                }

                try {
                  final newNote = Note(
                    id: DateTime.now()
                        .millisecondsSinceEpoch, // Generate a unique ID
                    title: 'Untitled', // Default value if title is not used
                    content: _noteText!,
                    createdAt: DateTime.now(),
                  );
                  await DataSource.instance.addNotes(newNote); // Use Note here
                  Navigator.pop(context); // Go back to the previous screen
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Failed to add note. Please try again.'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
