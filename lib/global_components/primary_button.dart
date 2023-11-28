import 'package:champions/global_helpers/constants.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback itemCallBack;
  final double? height;
  final double? width;
  final bool? isDisabled;

  const PrimaryButton({
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
          onPressed:
              isDisabled != null && isDisabled == true ? null : itemCallBack,
          style: ButtonStyle(
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(
                  vertical: 18,
                ),
              ),
              backgroundColor: MaterialStateProperty.all(isDisabled != null && isDisabled == true
                  ? kDisabledBtnColor
                  : kPrimaryColor,
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
              ),
          ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: kWhiteColor,
                      ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
    );
  }
}