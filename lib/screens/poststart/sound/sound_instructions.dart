import 'package:champions/screens/global_components/app_body.dart';
import 'package:champions/screens/global_components/app_header.dart';
import 'package:champions/screens/global_components/custom_sound_instructions.dart';
import 'package:champions/global_helpers/constants.dart';
import 'package:flutter/material.dart';

class SoundInstructions extends StatelessWidget {
  const SoundInstructions({super.key});

  static String id = 'SoundInstructions';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        children: [
          AppHeader(
            title: AppStrings.soundTitle,
          ),
          Expanded(
            child: AppBody(
              widget: CustomSoundInstructions(),
            ),
          ),
        ],
      ),
    );
  }
}


