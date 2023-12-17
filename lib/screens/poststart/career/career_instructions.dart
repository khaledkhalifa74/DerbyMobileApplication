import 'package:champions/screens/global_components/app_body.dart';
import 'package:champions/screens/global_components/app_header.dart';
import 'package:champions/screens/global_components/games_instructions.dart';
import 'package:champions/screens/global_components/select_level_bottom_sheet.dart';
import 'package:champions/global_helpers/constants.dart';
import 'package:champions/screens/poststart/career/career_home.dart';
import 'package:flutter/material.dart';

class CareerInstructions extends StatelessWidget {
  const CareerInstructions({super.key});

  static String id = 'CareerInstructions';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        children: [
          const AppHeader(
            title: AppStrings.careerTitle,
          ),
          Expanded(
            child: AppBody(
              widget: GamesInstructions(
                image: kCareerImage,
                instruction1: AppStrings.careerInstruction1,
                instruction2: AppStrings.careerInstruction2,
                itemCallBack: () {
                  showModalBottomSheet(
                    elevation: 0,
                    isScrollControlled: true,
                    backgroundColor: kWhiteColor,
                    context: context,
                    builder: (context) => SelectLevelBottomSheet(
                      widgetPush: CareerHome.id,
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
