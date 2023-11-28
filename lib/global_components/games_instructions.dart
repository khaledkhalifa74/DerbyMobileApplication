import 'package:champions/global_components/primary_button.dart';
import 'package:champions/global_helpers/constants.dart';
import 'package:flutter/material.dart';

class GamesInstructions extends StatelessWidget {
  final String image;
  final String? bullet3;
  final String? bullet4;
  final String instruction1;
  final String instruction2;
  final String? instruction3;
  final String? instruction4;
  final VoidCallback? itemCallBack;

  const GamesInstructions({
    super.key,
    required this.image,
    required this.instruction1,
    required this.instruction2,
    this.instruction3,
    this.instruction4,
    this.bullet3,
    this.bullet4,
    this.itemCallBack,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ListView(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Center(
                child: Image(
                  image: AssetImage(image),
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
                            instruction1,
                            style: Theme.of(context).textTheme.bodyMedium,
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
                            instruction2,
                            style: Theme.of(context).textTheme.bodyMedium,
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
                        Text(bullet3 ?? ''),
                        Expanded(
                          child: Text(
                            instruction3 ?? '',
                            style: Theme.of(context).textTheme.bodyMedium,
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
                        Text(bullet4 ?? ''),
                        Expanded(
                          child: Text(
                            instruction4 ?? '',
                            style: Theme.of(context).textTheme.bodyMedium,
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
        SizedBox(
          height:
          MediaQuery.of(context).size.height * 0.05,
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 48,
          ),
          child: Center(
            child: PrimaryButton(
              text: AppStrings.letsGoBtn,
              itemCallBack: itemCallBack??(){},
            ),
          ),
        ),
      ],
    );
  }
}
