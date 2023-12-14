import 'package:cached_network_image/cached_network_image.dart';
import 'package:champions/global_helpers/constants.dart';
import 'package:champions/screens/global_components/custom_circular_progress_indicator.dart';
import 'package:champions/screens/global_components/error_message.dart';
import 'package:flutter/material.dart';
class TeamImage extends StatelessWidget {
  const TeamImage({super.key, required this.imageUrl});
final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height:
      MediaQuery.of(context).size.height * 0.22,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        imageBuilder: (context, imageProvider) =>
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 32,
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height *
                  0.22,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.fill,
                  )),
            ),
        placeholder: (context, url) =>
        const CustomCircularProgressIndicator(
          color: kPrimaryColor,
        ),
        errorWidget: (context, url, error) =>
        const ErrorMessage(),
      ),
    );
  }
}
