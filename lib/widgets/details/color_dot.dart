import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';

class ColorDot extends StatelessWidget {
  const ColorDot({
    super.key,
    required this.filColor,
    this.isSelected = false,
    required this.onChangeCircle,
  });

  final Color filColor;
  final bool isSelected;
  final Function onChangeCircle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChangeCircle(filColor);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding / 2.5,
        ),
        padding: const EdgeInsets.all(3.0),
        height: 24,
        width: 24,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border:
              Border.all(color: isSelected ? kTextColor : Colors.transparent),
        ),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: filColor,
          ),
        ),
      ),
    );
  }
}
