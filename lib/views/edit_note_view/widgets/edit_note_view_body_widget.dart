import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/components/custom_app_bar_widget.dart';
import 'package:notes_app/components/custom_textfield.dart';
import 'package:notes_app/components/show_snack_bar.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';

import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view/widgets/edit_note_colors_list_view_widget.dart';

class EditNoteViewBodyWidget extends StatefulWidget {
  const EditNoteViewBodyWidget({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNoteViewBodyWidget> createState() => _EditNoteViewBodyWidgetState();
}

class _EditNoteViewBodyWidgetState extends State<EditNoteViewBodyWidget> {
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          CustomAppBarWidget(
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.subTitle = subTitle ?? widget.note.subTitle;
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
              showSnackBar(context, 'Edited Successfully');
            },
            text: 'Edit Note',
            icon: Icons.check,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextfield(
            onChanged: (value) {
              title = value;
            },
            hintText: widget.note.title,
          ),
          CustomTextfield(
            onChanged: (value) {
              subTitle = value;
            },
            hintText: widget.note.subTitle,
            maxLines: 5,
          ),
          EditNoteColorListView(note: widget.note),
        ],
      ),
    );
  }
}
