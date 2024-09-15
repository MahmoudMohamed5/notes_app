import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/controller/get_note_cubit/get_note_cubit.dart';
import 'package:notes_app/widgets/note_item.dart';

class NoteListView extends StatelessWidget {
  const NoteListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetNoteCubit, GetNoteState>(
      builder: (context, state) {
        if (state is GetNoteInitial) {
          return const Text('state is GetNoteInitial');
        }
        if (state is GetNoteSuccess && state.notes.isNotEmpty) {
          return Expanded(
            child: ListView.builder(
              itemCount: state.notes.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: NoteItem(
                    noteModel: state.notes[index],
                  ),
                );
              },
            ),
          );
        }

        if (state is GetNoteSuccess && state.notes.isEmpty) {
          return const Expanded(
            child: Center(
              child: Text(
                'Add your first note',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  
                ),
              ),
            ),
          );
        }

        return Text(
          state.toString(),
        );
      },
    );
  }
}
