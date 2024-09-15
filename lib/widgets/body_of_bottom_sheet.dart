import 'package:flutter/material.dart';
import 'package:notes_app/widgets/add_note_form.dart';

class BodyOfBottomSheet extends StatelessWidget {
  const BodyOfBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          top: 24,
          left: 24,
          right: 24,
          bottom: MediaQuery.of(context).viewInsets.bottom + 24,
        ),
        child: const AddNoteForm(),
      ),
    );
  }
}
