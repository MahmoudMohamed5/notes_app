import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/controller/get_note_cubit/get_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_form_text_field.dart';
import 'package:notes_app/widgets/edit_color_list_view.dart';

class EditNoteForm extends StatefulWidget {
  const EditNoteForm({
    super.key,
    required this.noteModel,
  });
  final NoteModel noteModel;
  @override
  State<EditNoteForm> createState() => _EditNoteFormState();
}

class _EditNoteFormState extends State<EditNoteForm> {
  String? title, body;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          title: "Edit Note",
          icon: Icons.arrow_back,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        const SizedBox(height: 10),
        CustomFormTextField(
          initialValue: widget.noteModel.title,
          onChanged: (value) {
            title = value;
          },
          hintText: "Title",
        ),
        const SizedBox(height: 16),
        CustomFormTextField(
          initialValue: widget.noteModel.body,
          onChanged: (value) {
            body = value;
          },
          hintText: "Content",
          maxLines: 5,
        ),
        const SizedBox(height: 16),
        EditColorListView(
          noteModel: widget.noteModel,
        ),
        const SizedBox(height: 16),
        CustomButton(
          onPressed: () {
            widget.noteModel.title = title ?? widget.noteModel.title;
            widget.noteModel.body = body ?? widget.noteModel.body;
            widget.noteModel.save();
            BlocProvider.of<GetNoteCubit>(context).getNotes();
            Navigator.pop(context);
          },
          text: "update",
        ),
      ],
    );
  }
}
