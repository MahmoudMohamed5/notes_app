import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/controller/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/utils/constants.dart';
import 'package:notes_app/widgets/color_item.dart';

class ColorListView extends StatefulWidget {
  const ColorListView({
    super.key,
  });

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  int selectedColorIndex = 0;
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
            child: GestureDetector(
              onTap: () {
                selectedColorIndex = index;
                BlocProvider.of<AddNoteCubit>(context).color =
                    kColorPalette[index];
                setState(() {});
              },
              child: ColorItem(
                onTap: () {
                  selectedColorIndex = index;
                  BlocProvider.of<AddNoteCubit>(context).color =
                      kColorPalette[index];
                  setState(() {});
                },
                color: kColorPalette[index],
                isActive: index == selectedColorIndex,
              ),
            ),
          );
        },
      ),
    );
  }
}
