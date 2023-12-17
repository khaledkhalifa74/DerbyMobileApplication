import 'package:champions/screens/global_components/app_body.dart';
import 'package:champions/screens/global_components/app_header.dart';
import 'package:champions/screens/global_components/custom_circular_progress_indicator.dart';
import 'package:champions/screens/global_components/custom_image.dart';
import 'package:champions/screens/global_components/custom_timer.dart';
import 'package:champions/screens/global_components/primary_button.dart';
import 'package:champions/global_helpers/constants.dart';
import 'package:champions/screens/global_components/show_player_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CareerHome extends StatefulWidget {
  const CareerHome({super.key});

  static String id = 'CareerHome';

  @override
  State<CareerHome> createState() => _ActingHomeState();
}

class _ActingHomeState extends State<CareerHome> {
  CollectionReference easy = FireBaseReferences.kEasyCareerRef;
  CollectionReference mid = FireBaseReferences.kMidCareerRef;
  CollectionReference hard = FireBaseReferences.kHardCareerRef;
  int startTime = 30;
  int? start;
  int currentIndex = 0;

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
                  title: AppStrings.careerTitle,
                ),
                Expanded(
                  child: AppBody(
                    widget: Column(
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                  height:
                                  MediaQuery.of(context).size.height * 0.055,
                                ),
                                CustomImage(
                                  // snapshot.data!.docs[currentIndex]
                                  // [AppStrings.careerImageFBTitle],
                                    imageUrl: 'https://firebasestorage.googleapis.com/v0/b/champions-8ca9d.appspot.com/o/team%2Feasy%2FContent.png?alt=media&token=1a7fca98-2ac3-48d7-b87d-8cb1c6c845af',
                                    height: MediaQuery.of(context).size.height * 0.35,
                                    radius: 48,
                                ),
                                SizedBox(
                                  height:
                                  MediaQuery.of(context).size.height * 0.05,
                                ),
                                CustomTimer(
                                  startTime: startTime,
                                  start: start ?? startTime,
                                ),
                                SizedBox(
                                  height:
                                  MediaQuery.of(context).size.height * 0.03,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        PrimaryButton(
                          text: AppStrings.nextPlayerBtn,
                          itemCallBack: () {
                            setState(() {
                              currentIndex = generateRandomNumber(
                                  snapshot.data!.docs.length);
                              start = startTime;
                            });
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 32,
                          ),
                          child: ShowPlayerButton(
                              playerImage: snapshot.data!.docs[currentIndex]
                              [AppStrings.playerImageFBTitle],
                              playerName: snapshot.data!.docs[currentIndex]
                              [AppStrings.playerNameFBTitle],
                              keyColor: snapshot.data!.docs[currentIndex]
                              [AppStrings.playerKeyColorFBTitle],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(child: CustomCircularProgressIndicator(color: kWhiteColor,));
        }
      },
    );
  }
}
