import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/controller/get_note_cubit/get_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/note_item.dart';

class BuildResultsSearchItem extends StatelessWidget {
  const BuildResultsSearchItem({
    super.key,
    required this.searchQuery,
    required this.isTitle,
  });
  final String searchQuery;
  final bool isTitle;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetNoteCubit, GetNoteState>(
      builder: (context, state) {
        if (state is GetNoteSuccess && state.notes.isNotEmpty) {
          List<NoteModel> filteredNotes = state.notes
              .where((note) => isTitle
                  ? note.title.toLowerCase().contains(searchQuery.toLowerCase())
                  : note.body.toLowerCase().contains(searchQuery.toLowerCase()))
              .toList();
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: ListView.builder(
              itemCount: filteredNotes.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: NoteItem(
                    noteModel: filteredNotes[index],
                  ),
                );
              },
            ),
          );
        }
        return const Text('state is GetNoteInitial');
      },
    );
  }
}
