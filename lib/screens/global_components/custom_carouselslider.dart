import 'package:carousel_slider/carousel_slider.dart';
import 'package:champions/global_helpers/constants.dart';
import 'package:champions/screens/global_components/home_card.dart';
import 'package:champions/screens/poststart/acting/acting_instructions.dart';
import 'package:champions/screens/poststart/auction/auction_instructions.dart';
import 'package:champions/screens/poststart/password_challenge/password_instructions.dart';
import 'package:champions/screens/poststart/stopwatch/stopwatch_instructions.dart';
import 'package:champions/screens/poststart/team/team_instructions.dart';
import 'package:champions/screens/poststart/who_iam/who_iam_instructions.dart';
import 'package:flutter/material.dart';
class CustomCarouselSlider extends StatelessWidget {
  const CustomCarouselSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        HomeCard(
          image: kActingImage,
          text: AppStrings.actingTitle,
          widget: ActingInstructions.id,
        ),
        HomeCard(
          image: kAuctionImage,
          text: AppStrings.auctionTitle,
          widget: AuctionInstructions.id,
        ),
        HomeCard(
          image: kPasswordImage,
          text: AppStrings.passwordTitle,
          widget: PasswordInstructions.id,
        ),
        HomeCard(
          image: kStopwatchImage,
          text: AppStrings.stopwatchTitle,
          widget: StopwatchInstructions.id,
        ),
        HomeCard(
          image: kTeamImage,
          text: AppStrings.teamTitle,
          widget: TeamInstructions.id,
        ),
        HomeCard(
          image: kWhoIamImage,
          text: AppStrings.whoIamTitle,
          widget: WhoIamInstructions.id,
        ),
      ],
      options: CarouselOptions(
        viewportFraction: 0.78,
        height: MediaQuery.of(context).size.height * 0.29,
        clipBehavior: Clip.none,
      ),
    );
  }
}
