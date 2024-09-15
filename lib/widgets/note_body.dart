import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/controller/get_note_cubit/get_note_cubit.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/note_list_view.dart';
import 'package:notes_app/widgets/note_search_delegate.dart';

class NoteBody extends StatefulWidget {
  const NoteBody({
    super.key,
  });

  @override
  State<NoteBody> createState() => _NoteBodyState();
}

class _NoteBodyState extends State<NoteBody> {
  @override
  void initState() {
    BlocProvider.of<GetNoteCubit>(context).getNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Column(
        children: [
          CustomAppBar(
            title: "Notes",
            icon: Icons.search,
            onPressed: () {
              showSearch(
                context: context,
                delegate: NoteSearchDelegate(
                  BlocProvider.of<GetNoteCubit>(context).notes,
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          const NoteListView(),
        ],
      ),
    );
  }
}
