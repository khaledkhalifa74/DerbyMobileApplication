import 'package:carousel_slider/carousel_slider.dart';
import 'package:champions/screens/global_components/custom_contact.dart';
import 'package:champions/screens/global_components/home_card.dart';
import 'package:champions/global_helpers/constants.dart';
import 'package:champions/screens/poststart/acting/acting_instructions.dart';
import 'package:champions/screens/poststart/auction/auction_instructions.dart';
import 'package:champions/screens/poststart/password_challenge/password_instructions.dart';
import 'package:champions/screens/poststart/stopwatch/stopwatch_instructions.dart';
import 'package:champions/screens/poststart/team/team_instructions.dart';
import 'package:champions/screens/poststart/who_iam/who_iam_instructions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static String id = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.immersiveSticky,
      overlays: [SystemUiOverlay.top],
    );
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage(kHomeBGImage),
            fit: BoxFit.cover,
          )),
          child: Column(
            children: [
              Expanded(
                  child: ListView(
                    children: [
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.40,
                      ),
                      CarouselSlider(
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
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.123,
                      ),
                      const CustomContact(),
                    ],),
              ),
            ],
          ),
      ),
    );
  }
}

