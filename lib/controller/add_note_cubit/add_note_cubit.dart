import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/utils/constants.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  Color color = const Color(0xff65655E);
  addNote(NoteModel noteModel) async {
    noteModel.color = color.value;
    try {
      emit(AddNoteLoading());
      Box<NoteModel> noteBox = Hive.box<NoteModel>(kBoxNotes);
      await noteBox.add(noteModel);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteError(errorMessage: e.toString()));
    }
  }
}
