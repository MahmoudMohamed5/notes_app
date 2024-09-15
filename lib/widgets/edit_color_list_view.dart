import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/utils/constants.dart';
import 'package:notes_app/widgets/color_item.dart';

class EditColorListView extends StatefulWidget {
  const EditColorListView({
    super.key,
    required this.noteModel,
  });

  final NoteModel noteModel;
  @override
  State<EditColorListView> createState() => _EditColorListViewState();
}

class _EditColorListViewState extends State<EditColorListView> {
  late int selectedColorIndex;
  @override
  void initState() {
    selectedColorIndex = kColorPalette.indexOf(Color(widget.noteModel.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: kColorPalette.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ColorItem(
              onTap: () {
                // update selected color
                selectedColorIndex = index;
                // update note color
                widget.noteModel.color = kColorPalette[index].value;
                // save note
                widget.noteModel.save();
                // update state
                setState(() {});
              },
              isActive: index == selectedColorIndex,
              color: kColorPalette[index],
            ),
          );
        },
      ),
    );
  }
}
