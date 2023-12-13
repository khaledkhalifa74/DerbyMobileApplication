import 'package:champions/screens/global_components/app_body.dart';
import 'package:champions/screens/global_components/app_header.dart';
import 'package:champions/screens/global_components/games_instructions.dart';
import 'package:champions/screens/global_components/select_level_bottom_sheet.dart';
import 'package:champions/global_helpers/constants.dart';
import 'package:champions/screens/poststart/acting/acting_home.dart';
import 'package:flutter/material.dart';

class ActingInstructions extends StatelessWidget {
   const ActingInstructions({super.key});

  static String id = 'ActingInstructions';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        children: [
          const AppHeader(
            title: AppStrings.actingTitle,
          ),
          Expanded(
            child: AppBody(
              widget: GamesInstructions(
                image: kActingImage,
                instruction1: AppStrings.actingInstruction1,
                instruction2: AppStrings.actingInstruction2,
                bullet3: '• ',
                instruction3: AppStrings.actingInstruction3,
                bullet4: '• ',
                instruction4: AppStrings.actingInstruction4,
                itemCallBack: () {
                  showModalBottomSheet(
                    elevation: 0,
                    isScrollControlled: true,
                    backgroundColor: kWhiteColor,
                    context: context,
                    builder: (context) => SelectLevelBottomSheet(
                      widgetPush: ActingHome.id,
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
