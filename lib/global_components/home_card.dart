import 'package:champions/global_helpers/constants.dart';
import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final String image;
  final String text;
  final String widget;

  const HomeCard({
    super.key,
    required this.image,
    required this.text,
    required this.widget,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, widget),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.69,
            height: MediaQuery.of(context).size.height * 0.29,
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(48),
            ),
          ),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * 0.05,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * 0.14,
            width: 250,
            height: 250,
            child: Image.asset(
              image,
            ),
          ),
        ],
      ),
    );
  }
}
class TransitionAnimation extends PageRouteBuilder {
  final Widget page;

  TransitionAnimation(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: const Duration(milliseconds: 1500),
          reverseTransitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
                parent: animation,
                curve: Curves.linearToEaseOut,
                reverseCurve: Curves.easeOutSine,
            );
            return ScaleTransition(
              scale: animation,
              alignment: Alignment.center,
              child: child,
            );
          },
        );
}
