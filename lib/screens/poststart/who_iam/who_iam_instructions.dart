import 'package:champions/screens/global_components/app_body.dart';
import 'package:champions/screens/global_components/app_header.dart';
import 'package:champions/screens/global_components/games_instructions.dart';
import 'package:champions/screens/global_components/select_level_bottom_sheet.dart';
import 'package:champions/global_helpers/constants.dart';
import 'package:champions/screens/poststart/who_iam/who_iam_home.dart';
import 'package:flutter/material.dart';

class WhoIamInstructions extends StatelessWidget {
  const WhoIamInstructions({super.key});

  static String id = 'WhoIamInstructions';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        children: [
          const AppHeader(
            title: AppStrings.whoIamTitle,
          ),
          Expanded(
            child: AppBody(
              widget: GamesInstructions(
                image: kWhoIamImage,
                instruction1: AppStrings.whoIamInstruction1,
                instruction2: AppStrings.whoIamInstruction2,
                itemCallBack: () {
                  showModalBottomSheet(
                    elevation: 0,
                    isScrollControlled: true,
                    backgroundColor: kWhiteColor,
                    context: context,
                    builder: (context) => SelectLevelBottomSheet(
                      widgetPush: WhoIamHome.id,
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
