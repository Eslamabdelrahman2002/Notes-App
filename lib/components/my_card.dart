import 'package:flutter/material.dart';

import '../model/notes.dart';

class MyCard extends StatelessWidget {
  final Note note;
  final VoidCallback onPressed;
  final VoidCallback onEditPressed;

  const MyCard({
    Key? key,
    required this.note,
    required this.onPressed,
    required this.onEditPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        title: Text(note.title),
        subtitle: Text(note.content),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: onEditPressed,
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}
