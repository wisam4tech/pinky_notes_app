import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/components/constants.dart';
import 'package:notes_app/components/simple_bloc_observer.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/notes_view/notes_view.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(NoteModelAdapter());

  await Hive.openBox<NoteModel>(kNotesBox);

  Bloc.observer = SimpleBlocObserver();

  runApp(const PinkyNotesApp());
}

class PinkyNotesApp extends StatelessWidget {
  const PinkyNotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        theme: ThemeData(
          //brightness: Brightness.light,
          fontFamily: 'Poppins',
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          NotesView.id: (context) => const NotesView(),
          //EditNoteView.id: (context) => EditNoteView(),
        },
        initialRoute: NotesView.id,
      ),
    );
  }
}
