import 'package:champions/screens/global_components/app_body.dart';
import 'package:champions/screens/global_components/app_header.dart';
import 'package:champions/screens/global_components/games_instructions.dart';
import 'package:champions/screens/global_components/select_level_bottom_sheet.dart';
import 'package:champions/global_helpers/constants.dart';
import 'package:champions/screens/poststart/password_challenge/password_home.dart';
import 'package:flutter/material.dart';

class PasswordInstructions extends StatelessWidget {
  const PasswordInstructions({super.key});

  static String id = 'PasswordInstructions';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        children: [
          const AppHeader(
            title: AppStrings.passwordTitle,
          ),
          Expanded(
            child: AppBody(
              widget: GamesInstructions(
                image: kPasswordImage,
                instruction1: AppStrings.passwordInstruction1,
                instruction2: AppStrings.passwordInstruction2,
                bullet3: '• ',
                instruction3: AppStrings.passwordInstruction3,
                bullet4: '• ',
                instruction4: AppStrings.passwordInstruction4,
                itemCallBack: () {
                  showModalBottomSheet(
                    elevation: 0,
                    isScrollControlled: true,
                    backgroundColor: kWhiteColor,
                    context: context,
                    builder: (context) => SelectLevelBottomSheet(
                      widgetPush: PasswordHome.id,
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
