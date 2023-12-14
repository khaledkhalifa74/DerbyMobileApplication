import 'package:champions/screens/global_components/app_body.dart';
import 'package:champions/screens/global_components/app_header.dart';
import 'package:champions/screens/global_components/custom_circular_progress_indicator.dart';
import 'package:champions/screens/global_components/player_card.dart';
import 'package:champions/screens/global_components/primary_button.dart';
import 'package:champions/global_helpers/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AuctionHome extends StatefulWidget {
  const AuctionHome({super.key});

  static String id = 'AuctionHome';

  @override
  State<AuctionHome> createState() => _AuctionHomeState();
}

class _AuctionHomeState extends State<AuctionHome> {
  CollectionReference easy = FireBaseReferences.kEasyAuctionRef;
  CollectionReference mid = FireBaseReferences.kMidAuctionRef;
  CollectionReference hard = FireBaseReferences.kHardAuctionRef;
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
                    title: AppStrings.auctionTitle,
                  ),
                  Expanded(
                    child: AppBody(
                      widget: Column(
                        children: [
                          Expanded(
                            child: ListView(
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                ),
                                PlayerCard(
                                  playerImage: snapshot.data!.docs[currentIndex]
                                      [AppStrings.imageFBTitle],
                                  playerName: snapshot.data!.docs[currentIndex]
                                      [AppStrings.nameFBTitle],
                                  keyColor: snapshot.data!.docs[currentIndex]
                                      [AppStrings.keyFBTitle],
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 24,
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
            return const Center(child: CustomCircularProgressIndicator(color: kWhiteColor,));
          }
        });
  }
}
