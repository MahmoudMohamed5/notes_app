part of 'get_note_cubit.dart';

sealed class GetNoteState {}

final class GetNoteInitial extends GetNoteState {}

final class GetNoteSuccess extends GetNoteState {
  final List<NoteModel> notes;

  GetNoteSuccess({required this.notes});
}
