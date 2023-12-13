import 'package:champions/screens/global_components/app_body.dart';
import 'package:champions/screens/global_components/app_header.dart';
import 'package:champions/screens/global_components/games_instructions.dart';
import 'package:champions/screens/global_components/select_level_bottom_sheet.dart';
import 'package:champions/global_helpers/constants.dart';
import 'package:champions/screens/poststart/auction/auction_home.dart';
import 'package:flutter/material.dart';

class AuctionInstructions extends StatelessWidget {

  const AuctionInstructions({super.key});

  static String id = 'AuctionInstructions';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        children: [
          const AppHeader(
            title: AppStrings.auctionTitle,
          ),
          Expanded(
            child: AppBody(
              widget: GamesInstructions(
                image: kAuctionImage,
                instruction1: AppStrings.auctionInstruction1,
                instruction2: AppStrings.auctionInstruction2,
                bullet3: '• ',
                instruction3: AppStrings.auctionInstruction3,
                bullet4: '• ',
                instruction4: AppStrings.auctionInstruction4,
                itemCallBack: () {
                  showModalBottomSheet(
                    elevation: 0,
                    isScrollControlled: true,
                    backgroundColor: kWhiteColor,
                    context: context,
                    builder: (context) => SelectLevelBottomSheet(
                      widgetPush: AuctionHome.id,
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
