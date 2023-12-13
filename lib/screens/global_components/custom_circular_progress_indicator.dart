import 'package:champions/global_helpers/constants.dart';
import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 50,
      width: 50,
      child: Center(
        child: CircularProgressIndicator(
          color: kWhiteColor,
        ),
      ),
    );
  }
}
