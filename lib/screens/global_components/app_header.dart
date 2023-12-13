import 'package:champions/global_helpers/constants.dart';
import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  final String title;

  const AppHeader({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          GestureDetector(
            onTap: (){
               Navigator.pop(context);
            },
            child: Row(
              children: [
                const SizedBox(
                  width: 32,
                ),
                const Icon(
                  Icons.arrow_back_rounded,
                  color: kWhiteColor,
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
        ],
      ),
    );
  }
}
