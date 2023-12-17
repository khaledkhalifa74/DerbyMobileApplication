import 'package:champions/global_helpers/constants.dart';
import 'package:champions/screens/global_components/primary_button.dart';
import 'package:champions/screens/global_components/select_level_bottom_sheet.dart';
import 'package:champions/screens/global_components/warning_item.dart';
import 'package:champions/screens/poststart/sound/sound_home.dart';
import 'package:flutter/material.dart';
class CustomSoundInstructions extends StatelessWidget {
  const CustomSoundInstructions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                const Center(
                  child: Image(
                    image: AssetImage(kSoundImage),
                    width: 200,
                    height: 200,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Center(
                  child: Text(
                    AppStrings.instructionTitle,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("• "),
                          Expanded(
                            child: Text(
                              AppStrings.soundInstruction1,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("• "),
                          Expanded(
                            child: Text(
                              AppStrings.soundInstruction2,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const WarningItem(),
        const SizedBox(
          height: 32,
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 48,
          ),
          child: Center(
            child: PrimaryButton(
              text: AppStrings.letsGoBtn,
              itemCallBack: () {
                showModalBottomSheet(
                  elevation: 0,
                  isScrollControlled: true,
                  backgroundColor: kWhiteColor,
                  context: context,
                  builder: (context) => SelectLevelBottomSheet(
                    widgetPush: SoundHome.id,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
