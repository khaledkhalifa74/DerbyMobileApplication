import 'package:cached_network_image/cached_network_image.dart';
import 'package:champions/global_helpers/constants.dart';
import 'package:champions/screens/global_components/custom_circular_progress_indicator.dart';
import 'package:champions/screens/global_components/error_message.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class CustomImage extends StatefulWidget {
  const CustomImage({
    super.key,
    required this.imageUrl,
    required this.height,
    required this.radius,
  });

  final String imageUrl;
  final double height;
  final double radius;

  @override
  State<CustomImage> createState() => _CustomImageState();
}

class _CustomImageState extends State<CustomImage> {
  TransformationController viewController = TransformationController();

  dynamic initialControllerValue;
  @override

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: widget.height,
      child: InteractiveViewer(
        transformationController: viewController,
        onInteractionStart: (details){
          initialControllerValue = viewController.value;
         // viewController.value = Matrix4.identity();
        },
        onInteractionEnd: (details){
          viewController.value = initialControllerValue;
        },
        // onInteractionUpdate: (details){
        //   viewController.value;
        //   // initialControllerValue = viewController.value;
        //   // viewController.value = initialControllerValue;
        // },
        child: CachedNetworkImage(
          imageUrl: widget.imageUrl,
          imageBuilder: (context, imageProvider) => Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 32,
            ),
            width: MediaQuery.of(context).size.width,
            height: widget.height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(widget.radius),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.fill,
                )),
          ),
          placeholder: (context, url) => const CustomCircularProgressIndicator(
            color: kPrimaryColor,
          ),
          errorWidget: (context, url, error) => const ErrorMessage(),
        ),
      ),
    );
  }
}
