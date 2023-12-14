import 'package:champions/global_helpers/constants.dart';
import 'package:champions/screens/global_components/player_card.dart';
import 'package:champions/screens/global_components/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class ShowPlayerButton extends StatelessWidget {
  const ShowPlayerButton({
    super.key,
    required this.playerImage, required this.playerName, required this.keyColor,
  });

  final String playerImage;
  final String playerName;
  final String keyColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        {
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
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context)
                        .size
                        .height *
                        0.1,
                  ),
                  PlayerCard(
                    playerImage: playerImage,
                    playerName: playerName,
                    keyColor: keyColor,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context)
                        .size
                        .height *
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
        }
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
            strokeAlign:
            BorderSide.strokeAlignCenter,
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
    );
  }
}