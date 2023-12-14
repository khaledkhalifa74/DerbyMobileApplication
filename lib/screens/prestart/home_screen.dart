import 'package:champions/screens/global_components/custom_carouselslider.dart';
import 'package:champions/screens/global_components/custom_contact.dart';
import 'package:champions/global_helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static String id = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.immersiveSticky,
      overlays: [SystemUiOverlay.top],
    );
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage(kHomeBGImage),
            fit: BoxFit.cover,
          )),
          child: Column(
            children: [
              Expanded(
                  child: ListView(
                    children: [
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.40,
                      ),
                      const CustomCarouselSlider(),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.123,
                      ),
                      const CustomContact(),
                    ],),
              ),
            ],
          ),
      ),
    );
  }
}

