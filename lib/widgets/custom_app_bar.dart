import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.onPressed,
    this.icon,
  });
  final String title;
  final void Function()? onPressed;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 30,
          ),
        ),
        const Spacer(),
        CustomIcon(
          icon: icon,
          onPressed: onPressed,
        )
      ],
    );
  }
}
