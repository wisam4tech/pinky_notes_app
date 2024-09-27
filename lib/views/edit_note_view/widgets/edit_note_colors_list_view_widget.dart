import 'package:flutter/material.dart';
import 'package:notes_app/components/constants.dart';

import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/notes_view/widgets/colors_list_view_widget.dart';

class EditNoteColorListView extends StatefulWidget {
  const EditNoteColorListView({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNoteColorListView> createState() => _EditNoteColorListState();
}

class _EditNoteColorListState extends State<EditNoteColorListView> {
  late int currentIndex;

  @override
  void initState() {
    currentIndex = kColors.indexOf(
      Color(widget.note.color),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 38 * 2,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: kColors.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(1.5),
              child: GestureDetector(
                onTap: () {
                  currentIndex = index;
                  widget.note.color = kColors[index].value;
                  setState(() {});
                },
                child: ColorItem(
                  color: kColors[index],
                  isActive: currentIndex == index,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
