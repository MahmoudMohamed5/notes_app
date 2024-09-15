import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/utils/constants.dart';

part 'get_note_state.dart';

class GetNoteCubit extends Cubit<GetNoteState> {
  GetNoteCubit() : super(GetNoteInitial());
  late List<NoteModel> notes ;
  getNotes() {
    //open a box
    Box<NoteModel> box = Hive.box<NoteModel>(kBoxNotes);
     notes = box.values.toList();
    emit(GetNoteSuccess(notes: notes));
  }
}
