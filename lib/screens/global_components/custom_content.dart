import 'package:champions/global_helpers/constants.dart';
import 'package:flutter/material.dart';

class CustomContent extends StatelessWidget {
  final String contentText;
  const CustomContent({
    super.key, required this.contentText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 32,
        left: 32,
        bottom: 16,
      ),
      width: MediaQuery.of(context).size.width,
      decoration: const ShapeDecoration(
        color: kWhiteColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignCenter,
            color: kSecondaryColor,
          ),
          borderRadius:
          BorderRadius.all(Radius.circular(28)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          contentText,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(
            fontWeight: FontWeight.w400,
          ),
          // maxLines: 2,
          textAlign: TextAlign.right,
        ),
      ),
    );
  }
}
