import 'package:cached_network_image/cached_network_image.dart';
import 'package:champions/global_helpers/constants.dart';
import 'package:champions/screens/global_components/custom_circular_progress_indicator.dart';
import 'package:champions/screens/global_components/error_message.dart';
import 'package:flutter/material.dart';
class CustomImage extends StatelessWidget {
  const CustomImage({super.key, required this.imageUrl, required this.height, required this.radius});
final String imageUrl;
final double height;
final double radius;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: height,
      //MediaQuery.of(context).size.height * 0.22,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        imageBuilder: (context, imageProvider) =>
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 32,
              ),
              width: MediaQuery.of(context).size.width,
              height: height,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius),
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
