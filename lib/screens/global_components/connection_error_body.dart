import 'package:champions/global_helpers/constants.dart';
import 'package:champions/screens/global_components/primary_button.dart';
import 'package:flutter/material.dart';

class ConnectionErrorBody extends StatelessWidget {
  final void Function() onPressed;
  const ConnectionErrorBody({
    super.key, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    kConnectionErrorImage,
                    width: 150,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(AppStrings.connectionErrorMessage1,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: kPrimaryColor,
                          )),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    AppStrings.connectionErrorMessage2,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 32,
              ),
              child: PrimaryButton(
                text: AppStrings.tryAgainBtn,
                itemCallBack: onPressed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
