import 'package:champions/screens/global_components/app_body.dart';
import 'package:champions/screens/global_components/app_header.dart';
import 'package:champions/screens/global_components/custom_circular_progress_indicator.dart';
import 'package:champions/screens/global_components/custom_timer.dart';
import 'package:champions/screens/global_components/player_card.dart';
import 'package:champions/screens/global_components/primary_button.dart';
import 'package:champions/global_helpers/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PasswordHome extends StatefulWidget {
  const PasswordHome({super.key});

  static String id = 'PasswordHome';

  @override
  State<PasswordHome> createState() => _PasswordHomeState();
}

class _PasswordHomeState extends State<PasswordHome> {
  CollectionReference easy = FireBaseReferences.kEasyPasswordRef;
  CollectionReference mid = FireBaseReferences.kMidPasswordRef;
  CollectionReference hard = FireBaseReferences.kHardPasswordRef;
  int currentIndex = 0;
  int startTime = 30;
  int? start;

  @override
  void initState() {
    randomNumbers = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;
    return StreamBuilder(
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
                  title: AppStrings.passwordTitle,
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
                                  MediaQuery.of(context).size.height * 0.06,
                                ),
                                PlayerCard(
                                  playerImage: snapshot.data!.docs[currentIndex]
                                  [AppStrings.playerImageFBTitle],
                                  playerName: snapshot.data!.docs[currentIndex]
                                  [AppStrings.playerNameFBTitle],
                                  keyColor: snapshot.data!.docs[currentIndex]
                                  [AppStrings.playerKeyColorFBTitle],
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
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 48,
                          ),
                          child: PrimaryButton(
                            text: AppStrings.nextPlayerBtn,
                            itemCallBack: () {
                              currentIndex = generateRandomNumber(
                                  snapshot.data!.docs.length);
                              start = startTime;
                              setState(() {});
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
