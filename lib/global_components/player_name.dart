import 'package:champions/global_helpers/constants.dart';
import 'package:flutter/material.dart';

class PlayerName extends StatelessWidget {
  final String playerName;
  const PlayerName({
    super.key, required this.playerName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      width: MediaQuery.of(context).size.width * 0.39,
      decoration: const ShapeDecoration(
        color: kWhiteColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignCenter,
            color: kSecondaryColor,
          ),
          borderRadius: BorderRadius.all(Radius.circular(28)),
        ),
      ),
      child: Center(
        child: Text(
          playerName,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }
}