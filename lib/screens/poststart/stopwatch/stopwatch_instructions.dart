import 'package:champions/screens/global_components/app_body.dart';
import 'package:champions/screens/global_components/app_header.dart';
import 'package:champions/screens/global_components/games_instructions.dart';
import 'package:champions/screens/global_components/select_level_bottom_sheet.dart';
import 'package:champions/global_helpers/constants.dart';
import 'package:champions/screens/poststart/stopwatch/stopwatch_home.dart';
import 'package:flutter/material.dart';

class StopwatchInstructions extends StatelessWidget {
  const StopwatchInstructions({super.key});

  static String id = 'StopwatchInstructions';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        children: [
          const AppHeader(
            title: AppStrings.stopwatchTitle,
          ),
          Expanded(
            child: AppBody(
              widget: GamesInstructions(
                image: kStopwatchImage,
                instruction1: AppStrings.stopwatchInstruction1,
                instruction2: AppStrings.stopwatchInstruction2,
                itemCallBack: () {
                  showModalBottomSheet(
                    elevation: 0,
                    isScrollControlled: true,
                    backgroundColor: kWhiteColor,
                    context: context,
                    builder: (context) => SelectLevelBottomSheet(
                      widgetPush: StopwatchHome.id,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
