import 'package:flutter/material.dart';
import 'package:notes_app/widgets/body_of_bottom_sheet.dart';
import 'package:notes_app/widgets/note_body.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () { 
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (builder) {
              return const BodyOfBottomSheet();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: const SafeArea(
        child: NoteBody(),
      ),
    );
  }
}
