import 'package:champions/global_components/app_body.dart';
import 'package:champions/global_components/app_header.dart';
import 'package:champions/global_components/custom_circular_progress_indicator.dart';
import 'package:champions/global_components/custom_content.dart';
import 'package:champions/global_components/player_card.dart';
import 'package:champions/global_components/primary_button.dart';
import 'package:champions/global_components/secondary_button.dart';
import 'package:champions/global_helpers/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WhoIamHome extends StatefulWidget {
  const WhoIamHome({super.key});

  static String id = 'WhoIamHome';

  @override
  State<WhoIamHome> createState() => _WhoIamHomeState();
}

class _WhoIamHomeState extends State<WhoIamHome> {

  CollectionReference easy = FirebaseFirestore.instance
      .collection(AppStrings.whoIamCollection)
      .doc(AppStrings.whoIamDoc)
      .collection(AppStrings.easyWhoIamCollection);

  CollectionReference mid = FirebaseFirestore.instance
      .collection(AppStrings.whoIamCollection)
      .doc(AppStrings.whoIamDoc)
      .collection(AppStrings.midWhoIamCollection);

  CollectionReference hard = FirebaseFirestore.instance
      .collection(AppStrings.whoIamCollection)
      .doc(AppStrings.whoIamDoc)
      .collection(AppStrings.hardWhoIamCollection);

  int currentIndex = 0;
  bool _enabled = true;
  int availableCount = 1;

  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    randomNumbers =[];
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
            ContentModel(content: snapshot.data!.docs[currentIndex][AppStrings.firstClueFBTitle]),
            ContentModel(content: snapshot.data!.docs[currentIndex][AppStrings.secondClueFBTitle]),
            ContentModel(content: snapshot.data!.docs[currentIndex][AppStrings.thirdClueFBTitle]),
            ContentModel(content: snapshot.data!.docs[currentIndex][AppStrings.fourthClueFBTitle]),
            ContentModel(content: snapshot.data!.docs[currentIndex][AppStrings.fifthClueFBTitle]),
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
              _controller.animateTo(_controller.position.maxScrollExtent, duration: const Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
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
                      children: [
                        Expanded(
                          child: ListView(
                            controller: _controller,
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.02,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 32,
                                ),
                                child: Text(
                                  AppStrings.guideTitle,
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.03,
                              ),
                              ListView.builder(
                                physics: const ScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: availableCount,
                                itemBuilder: (context, index) {
                                  return CustomContent(
                                      contentText: items[index].content);
                                },
                              ),
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
                                  availableCount=1;
                                  _enabled=true;
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
                                isDisabled: availableCount==1 ? !_enabled
                                    :!_enabled
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 32,
                                ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                      elevation: 0,
                                      isScrollControlled: true,
                                      backgroundColor: kWhiteColor,
                                      context: context,
                                      builder: (context) => Padding(
                                        padding: const EdgeInsets.only(
                                          top: 32,
                                          bottom: 48,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              AppStrings.thePlayerIs,
                                              style:
                                              Theme.of(context).textTheme.bodyLarge,
                                            ),
                                            SizedBox(
                                              height:
                                              MediaQuery.of(context).size.height *
                                                  0.1,
                                            ),
                                            PlayerCard(
                                              playerImage: snapshot.data!.docs[currentIndex]
                                              [AppStrings.imageFBTitle],
                                              playerName: snapshot.data!.docs[currentIndex]
                                              [AppStrings.nameFBTitle],
                                              keyColor: snapshot.data!.docs[currentIndex]
                                              [AppStrings.keyFBTitle],
                                            ),
                                            const SizedBox(
                                              height: 32,
                                            ),
                                            SizedBox(
                                              height:
                                              MediaQuery.of(context).size.height *
                                                  0.04,
                                            ),
                                            PrimaryButton(
                                              text: AppStrings.okBtn,
                                              itemCallBack: () {
                                                Navigator.pop(context);
                                              },
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                      const EdgeInsets.symmetric(
                                        vertical: 8,
                                        horizontal: 16,
                                      ),
                                    ),
                                    elevation: MaterialStateProperty.all(0),
                                    backgroundColor:
                                    MaterialStateProperty.all(kWhiteColor),
                                    side: MaterialStateProperty.all(
                                      const BorderSide(
                                        width: 1,
                                        strokeAlign: BorderSide.strokeAlignCenter,
                                        color: kSecondaryColor,
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SvgPicture.asset(kShowPlayerIcon),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        AppStrings.showPlayerBtn,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
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
          return const Center(child: CustomCircularProgressIndicator());
        }
      },
    );
  }
}
class ContentModel {
  final String content;

  ContentModel({required this.content});
}
