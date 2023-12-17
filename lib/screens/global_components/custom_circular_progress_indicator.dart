import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({
    super.key, required this.color,
  });
  final Color color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: Center(
        child: CircularProgressIndicator(
          color: color,
        ),
      ),
    );
  }
}
