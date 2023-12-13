import 'package:champions/screens/global_components/app_body.dart';
import 'package:champions/screens/global_components/app_header.dart';
import 'package:champions/screens/global_components/games_instructions.dart';
import 'package:champions/screens/global_components/select_level_bottom_sheet.dart';
import 'package:champions/global_helpers/constants.dart';
import 'package:champions/screens/poststart/team/team_home.dart';
import 'package:flutter/material.dart';

class TeamInstructions extends StatelessWidget {
  const TeamInstructions({super.key});

  static String id = 'TeamInstructions';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        children: [
          const AppHeader(
            title: AppStrings.teamTitle,
          ),
          Expanded(
            child: AppBody(
              widget: GamesInstructions(
                image: kTeamImage,
                instruction1: AppStrings.teamInstruction1,
                instruction2: AppStrings.teamInstruction2,
                bullet3: '• ',
                instruction3: AppStrings.teamInstruction3,
                bullet4: '• ',
                instruction4: AppStrings.teamInstruction4,
                itemCallBack: () {
                  showModalBottomSheet(
                    elevation: 0,
                    isScrollControlled: true,
                    backgroundColor: kWhiteColor,
                    context: context,
                    builder: (context) => SelectLevelBottomSheet(
                      widgetPush: TeamHome.id,
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
