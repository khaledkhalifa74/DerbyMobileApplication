import 'dart:math';

import 'package:champions/screens/global_components/app_body.dart';
import 'package:champions/screens/global_components/app_header.dart';
import 'package:champions/screens/global_components/custom_circular_progress_indicator.dart';
import 'package:champions/screens/global_components/players_names_bottom_sheet.dart';
import 'package:champions/screens/global_components/primary_button.dart';
import 'package:champions/screens/global_components/secondary_button.dart';
import 'package:champions/global_helpers/constants.dart';
import 'package:champions/screens/global_components/custom_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TeamHome extends StatefulWidget {
  const TeamHome({super.key});

  static String id = 'TeamHome';

  @override
  State<TeamHome> createState() => _TeamHomeState();
}

class _TeamHomeState extends State<TeamHome> {
  CollectionReference easy = FireBaseReferences.kEasyTeamRef;
  CollectionReference mid = FireBaseReferences.kMidTeamRef;
  CollectionReference hard = FireBaseReferences.kHardTeamRef;
  int currentIndex = Random().nextInt(39);
  //int currentIndex = 0;

  @override
  void initState() {
    randomNumbers = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;
    return StreamBuilder<QuerySnapshot>(
      stream: args == AppStrings.easyId
          ? easy.snapshots()
          : args == AppStrings.midId
              ? mid.snapshots()
              : hard.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            backgroundColor: kPrimaryColor,
            body: Column(
              children: [
                const AppHeader(
                  title: AppStrings.teamTitle,
                ),
                Expanded(
                  child: AppBody(
                    widget: Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 32,
                                ),
                                CustomImage(
                                  imageUrl: snapshot.data!.docs[currentIndex]
                                  [AppStrings.playerImageFBTitle],
                                  height: MediaQuery.of(context).size.height * 0.22,
                                  radius: 28,
                                ),
                                const SizedBox(
                                  height: 32,
                                ),
                                Text(
                                  snapshot.data!.docs[currentIndex]
                                  [AppStrings.playerNameFBTitle],
                                  style:
                                  Theme.of(context).textTheme.headlineMedium,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SecondaryButton(
                          text: AppStrings.nextTeamBtn,
                          itemCallBack: () {
                            // currentIndex++;
                            currentIndex = generateRandomNumber(
                                snapshot.data!.docs.length);
                            setState(() {});
                          },
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 48,
                          ),
                          child: PrimaryButton(
                            text: AppStrings.showPlayersBtn,
                            itemCallBack: () {
                              showModalBottomSheet(
                                elevation: 0,
                                isScrollControlled: true,
                                backgroundColor: kWhiteColor,
                                context: context,
                                builder: (context) => PlayersNamesBottomSheet(
                                  teamName: snapshot.data!.docs[currentIndex]
                                      [AppStrings.playerNameFBTitle],
                                  player1: snapshot.data!.docs[currentIndex]
                                      [AppStrings.player1FBTitle],
                                  player2: snapshot.data!.docs[currentIndex]
                                      [AppStrings.player2FBTitle],
                                  player3: snapshot.data!.docs[currentIndex]
                                      [AppStrings.player3FBTitle],
                                  player4: snapshot.data!.docs[currentIndex]
                                      [AppStrings.player4FBTitle],
                                  player5: snapshot.data!.docs[currentIndex]
                                      [AppStrings.player5FBTitle],
                                  player6: snapshot.data!.docs[currentIndex]
                                      [AppStrings.player6FBTitle],
                                  player7: snapshot.data!.docs[currentIndex]
                                      [AppStrings.player7FBTitle],
                                  player8: snapshot.data!.docs[currentIndex]
                                      [AppStrings.player8FBTitle],
                                  player9: snapshot.data!.docs[currentIndex]
                                      [AppStrings.player9FBTitle],
                                  player10: snapshot.data!.docs[currentIndex]
                                      [AppStrings.player10FBTitle],
                                  player11: snapshot.data!.docs[currentIndex]
                                      [AppStrings.player11FBTitle],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Scaffold(
            backgroundColor: kWhiteColor,
            body: Center(
                child: CustomCircularProgressIndicator(
                  color: kPrimaryColor,
                )),
          );
        }
      },
    );
  }
}
