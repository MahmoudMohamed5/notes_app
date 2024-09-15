import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/controller/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/controller/get_note_cubit/get_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/color_list_view.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_form_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, body;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomFormTextField(
            onSaved: (value) {
              title = value;
            },
            hintText: "Title",
          ),
          const SizedBox(
            height: 16,
          ),
          CustomFormTextField(
            onSaved: (value) {
              body = value;
            },
            hintText: "Content",
            maxLines: 5,
          ),
          const SizedBox(
            height: 16,
          ),
          const ColorListView(),
          const SizedBox(
            height: 16,
          ),
          BlocConsumer<AddNoteCubit, AddNoteState>(
            listener: (context, state) {},
            builder: (context, state) {
              return CustomButton(
                text: "add",
                isAdd: state is AddNoteLoading ? true : false,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    BlocProvider.of<AddNoteCubit>(context).addNote(
                      NoteModel(
                        title: title!,
                        body: body!,
                        date:
                            '${DateFormat.yMd().format(DateTime.now())} \n ${DateFormat.jm().format(DateTime.now())}',
                        color:
                            BlocProvider.of<AddNoteCubit>(context).color.value,
                      ),
                    );
                    BlocProvider.of<GetNoteCubit>(context).getNotes();
                    Navigator.pop(context);
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              );
            },
          )
        ],
      ),
    );
  }
}
