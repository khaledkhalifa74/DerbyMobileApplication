import 'package:champions/global_helpers/constants.dart';
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback itemCallBack;
  final double? height;
  final double? width;
  final bool? isDisabled;

  const SecondaryButton({
    super.key,
    required this.text,
    required this.itemCallBack,
    this.height,
    this.width,
    this.isDisabled,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
      ),
      child: ElevatedButton(
          onPressed: itemCallBack,
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(kSecondaryColor),
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(
                vertical: 18,
              ),
            ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
              ),
            backgroundColor: MaterialStateProperty.all(kWhiteColor),
            side: MaterialStateProperty.all(
                const BorderSide(
                  width: 1,
                  strokeAlign: BorderSide.strokeAlignCenter,
                  color: kSecondaryColor,
            ),
            ),
            elevation: MaterialStateProperty.all(0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ],
          ),
      ),
    );
  }
}
