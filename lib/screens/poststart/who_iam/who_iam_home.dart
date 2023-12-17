import 'package:champions/screens/global_components/app_body.dart';
import 'package:champions/screens/global_components/app_header.dart';
import 'package:champions/screens/global_components/custom_circular_progress_indicator.dart';
import 'package:champions/screens/global_components/custom_content.dart';
import 'package:champions/screens/global_components/primary_button.dart';
import 'package:champions/screens/global_components/secondary_button.dart';
import 'package:champions/global_helpers/constants.dart';
import 'package:champions/screens/global_components/show_player_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class WhoIamHome extends StatefulWidget {
  const WhoIamHome({super.key});

  static String id = 'WhoIamHome';

  @override
  State<WhoIamHome> createState() => _WhoIamHomeState();
}

class _WhoIamHomeState extends State<WhoIamHome> {
  CollectionReference easy = FireBaseReferences.kEasyWhoIamRef;
  CollectionReference mid = FireBaseReferences.kMidWhoIamRef;
  CollectionReference hard = FireBaseReferences.kHardWhoIamRef;
  int currentIndex = 0;
  bool _enabled = true;
  int availableCount = 1;

  final ScrollController _controller = ScrollController();

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
          List<ContentModel> items = [
            ContentModel(
                content: snapshot.data!.docs[currentIndex]
                    [AppStrings.firstClueFBTitle]),
            ContentModel(
                content: snapshot.data!.docs[currentIndex]
                    [AppStrings.secondClueFBTitle]),
            ContentModel(
                content: snapshot.data!.docs[currentIndex]
                    [AppStrings.thirdClueFBTitle]),
            ContentModel(
                content: snapshot.data!.docs[currentIndex]
                    [AppStrings.fourthClueFBTitle]),
            ContentModel(
                content: snapshot.data!.docs[currentIndex]
                    [AppStrings.fifthClueFBTitle]),
          ];
          void increaseAvailableCount() {
            availableCount++;
            if (availableCount == items.length) {
              _enabled = false;
            }
            setState(() {});
          }

          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (_controller.hasClients) {
              _controller.animateTo(_controller.position.maxScrollExtent,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.fastOutSlowIn);
            } else {
              setState(() {});
            }
          });
          return Scaffold(
            backgroundColor: kPrimaryColor,
            body: Column(
              children: [
                const AppHeader(
                  title: AppStrings.whoIamTitle,
                ),
                Expanded(
                  child: AppBody(
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 24,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 32,
                          ),
                          child: Text(
                            AppStrings.guideTitle,
                            style:
                            Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: CustomScrollView(
                            controller: _controller,
                            slivers: [
                              SliverList(delegate: SliverChildListDelegate(
                                List.generate(availableCount, (index) => CustomContent(
                                    contentText: items[index].content))
                              )),
                            ],
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                width: 1,
                                strokeAlign: BorderSide.strokeAlignInside,
                                color: kSecondaryColor,
                              ),
                            ),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 24,
                              ),
                              SecondaryButton(
                                text: AppStrings.nextPlayerBtn,
                                itemCallBack: () {
                                  currentIndex = generateRandomNumber(
                                      snapshot.data!.docs.length);
                                  availableCount = 1;
                                  _enabled = true;
                                  setState(() {});
                                },
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              PrimaryButton(
                                  text: AppStrings.nextGuideBtn,
                                  itemCallBack: () async {
                                    if (availableCount < items.length) {
                                      increaseAvailableCount();
                                    }
                                  },
                                  isDisabled: availableCount == 1
                                      ? !_enabled
                                      : !_enabled),
                              const SizedBox(
                                height: 24,
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
                              ),
                            ],
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
          return const Center(
              child: CustomCircularProgressIndicator(
            color: kWhiteColor,
          ));
        }
      },
    );
  }
}

class ContentModel {
  final String content;

  ContentModel({required this.content});
}
