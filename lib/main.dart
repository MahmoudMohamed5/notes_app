import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/controller/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/controller/get_note_cubit/get_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/simple_bloc_observer.dart';
import 'package:notes_app/utils/constants.dart';
import 'package:notes_app/views/note_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  
  // initialize hive
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  // register adapter
  Hive.registerAdapter(NoteModelAdapter());
  // open a box
  await Hive.openBox<NoteModel>(kBoxNotes);

  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AddNoteCubit>(
          create: (context) => AddNoteCubit(),
        ),
        BlocProvider<GetNoteCubit>(
          create: (context) => GetNoteCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Notes App',
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Poppins',
        ),
        home: const NoteView(),
      ),
    );
  }
}
