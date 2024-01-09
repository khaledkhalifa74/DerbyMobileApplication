import 'package:champions/screens/global_components/answers_bottom_sheet.dart';
import 'package:champions/screens/global_components/app_body.dart';
import 'package:champions/screens/global_components/app_header.dart';
import 'package:champions/screens/global_components/custom_circular_progress_indicator.dart';
import 'package:champions/screens/global_components/custom_content.dart';
import 'package:champions/screens/global_components/custom_timer.dart';
import 'package:champions/screens/global_components/primary_button.dart';
import 'package:champions/screens/global_components/secondary_button.dart';
import 'package:champions/global_helpers/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StopwatchHome extends StatefulWidget {
  const StopwatchHome({super.key});

  static String id = 'StopwatchHome';

  @override
  State<StopwatchHome> createState() => _StopwatchHomeState();
}

class _StopwatchHomeState extends State<StopwatchHome> {
  CollectionReference easy = FireBaseReferences.kEasyStopwatchRef;
  CollectionReference mid = FireBaseReferences.kMidStopwatchRef;
  CollectionReference hard = FireBaseReferences.kHardStopwatchRef;
  int currentIndex = 0;
  int startTime = 10;
  int? start;

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
                  title: AppStrings.stopwatchTitle,
                ),
                Expanded(
                  child: AppBody(
                    widget: Column(
                      children: [
                        const SizedBox(
                          height: 32,
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: CustomContent(
                              contentText: snapshot.data!.docs[currentIndex]
                                  [AppStrings.questionFBTitle],
                            ),
                          ),
                        ),

                        CustomTimer(
                          startTime: startTime,
                          start: start ?? startTime,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.06,
                        ),
                        SecondaryButton(
                          text: AppStrings.nextQuestionBtn,
                          itemCallBack: () {
                            currentIndex = generateRandomNumber(
                                snapshot.data!.docs.length);
                            start = startTime;
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
                            text: AppStrings.showAnswersBtn,
                            itemCallBack: () {
                              showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: kWhiteColor,
                                context: context,
                                elevation: 0,
                                builder: (context) => AnswersBottomSheet(
                                  player1: snapshot.data!.docs[currentIndex]
                                      [AppStrings.answer1FBTitle],
                                  player2: snapshot.data!.docs[currentIndex]
                                      [AppStrings.answer2FBTitle],
                                  player3: snapshot.data!.docs[currentIndex]
                                      [AppStrings.answer3FBTitle],
                                  player4: snapshot.data!.docs[currentIndex]
                                      [AppStrings.answer4FBTitle],
                                  player5: snapshot.data!.docs[currentIndex]
                                      [AppStrings.answer5FBTitle],
                                  player6: snapshot.data!.docs[currentIndex]
                                      [AppStrings.answer6FBTitle],
                                  player7: snapshot.data!.docs[currentIndex]
                                      [AppStrings.answer7FBTitle],
                                  player8: snapshot.data!.docs[currentIndex]
                                      [AppStrings.answer8FBTitle],
                                  player9: snapshot.data!.docs[currentIndex]
                                      [AppStrings.answer9FBTitle],
                                  player10: snapshot.data!.docs[currentIndex]
                                  [AppStrings.answer10FBTitle],
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
