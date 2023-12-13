import 'package:champions/screens/global_components/player_name.dart';
import 'package:champions/screens/global_components/primary_button.dart';
import 'package:champions/global_helpers/constants.dart';
import 'package:flutter/material.dart';

class PlayersNamesBottomSheet extends StatelessWidget {
  final String teamName;
  final String player1;
  final String player2;
  final String player3;
  final String player4;
  final String player5;
  final String player6;
  final String player7;
  final String player8;
  final String player9;
  final String player10;
  final String player11;

  const PlayersNamesBottomSheet({
    super.key,
    required this.teamName,
    required this.player1,
    required this.player2,
    required this.player3,
    required this.player4,
    required this.player5,
    required this.player6,
    required this.player7,
    required this.player8,
    required this.player9,
    required this.player10,
    required this.player11,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 32,
        bottom: 40,
      ),
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              teamName,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(
              height: 32,
            ),
            Column(
              children: [
                PlayerName(
                  playerName: player1,
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PlayerName(
                      playerName: player2,
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    PlayerName(
                      playerName:player3,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PlayerName(
                      playerName: player4,
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    PlayerName(
                      playerName: player5,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PlayerName(
                      playerName: player6,
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    PlayerName(
                      playerName: player7,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PlayerName(
                      playerName: player8,
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    PlayerName(
                      playerName: player9,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PlayerName(
                      playerName: player10,
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    PlayerName(
                      playerName: player11,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 24,
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
}
