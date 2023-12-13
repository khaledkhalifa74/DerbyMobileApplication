import 'package:champions/global_helpers/constants.dart';
import 'package:flutter/material.dart';

class AppBody extends StatelessWidget {
  final Widget widget;
  const AppBody({
    super.key, required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.9,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(24),
          topLeft: Radius.circular(24),
        ),
        ),
      child: widget,
    );
  }
}
