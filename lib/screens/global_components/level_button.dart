import 'package:champions/global_helpers/constants.dart';
import 'package:flutter/material.dart';

class LevelButton extends StatelessWidget {
  const LevelButton({
    super.key,
    this.isSelected = false,
    required this.text,
    this.onPressed, required String id,
  });
  final bool isSelected;
  final String text;
  static String? id;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(
          right: 32,
          left: 32,
          bottom: 24,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 20,
        ),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              strokeAlign: BorderSide.strokeAlignCenter,
              color: isSelected
                  ? kPrimaryColor
                  : kSecondaryColor,
            ),
            borderRadius: BorderRadius.circular(28),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style:
              Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
