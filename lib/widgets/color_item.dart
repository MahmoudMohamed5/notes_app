import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({
    super.key,
    required this.isActive, required this.color, this.onTap,
  });
  final bool isActive;
  final Color color;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:  onTap,
      child: isActive
        ?  CircleAvatar(
            radius: 25,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 23,
              backgroundColor: color,
            ),
          )
        :  CircleAvatar(
            radius: 25,
            backgroundColor: color,
          ),
    );
  }
}
