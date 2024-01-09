import 'package:champions/global_helpers/constants.dart';
import 'package:flutter/material.dart';
class ErrorMessage extends StatelessWidget {
  const ErrorMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.error_outline_rounded,
          size: 50,
          color: kWhiteColor,
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          AppStrings.errorMessage,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: kWhiteColor
          ),
        )
      ],
    );
  }
}
