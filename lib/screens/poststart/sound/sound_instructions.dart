import 'package:champions/screens/global_components/app_body.dart';
import 'package:champions/screens/global_components/app_header.dart';
import 'package:champions/screens/global_components/custom_sound_instructions.dart';
import 'package:champions/screens/global_components/games_instructions.dart';
import 'package:champions/screens/global_components/primary_button.dart';
import 'package:champions/screens/global_components/select_level_bottom_sheet.dart';
import 'package:champions/global_helpers/constants.dart';
import 'package:champions/screens/global_components/warning_item.dart';
import 'package:champions/screens/poststart/stopwatch/stopwatch_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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


