import 'package:champions/global_helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomContact extends StatelessWidget {
  const CustomContact({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppStrings.contactTitle,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: kWhiteColor,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: ()async{
                var url = Uri.parse('https://www.t.me/khaledkhalifa74');
                if(await launchUrl(url)) {
                  throw Exception('Could not launch $url');
                }
              },
              child: SvgPicture.asset(kTelegramIcon),
            ),
            const SizedBox(
              width: 16,
            ),
            GestureDetector(
              onTap: ()async{
                var url = Uri.parse('https://wa.me/+201021797594');
                if(await launchUrl(url)) {
                  throw Exception('Could not launch $url');
                }
              },
              child: SvgPicture.asset(kWhatsappIcon),
            ),
            const SizedBox(
              width: 16,
            ),
            GestureDetector(
              onTap: ()async{
                var url = Uri.parse('https://www.instagram.com/abdullhamed_mohamed/');
                if(await launchUrl(url)) {
                  throw Exception('Could not launch $url');
                }
              },
              child: SvgPicture.asset(kInstagramIcon),
            ),
            const SizedBox(
              width: 16,
            ),
            GestureDetector(
              onTap: ()async{
                var url = Uri.parse('https://twitter.com/RanimMohamedXI');
                if(await launchUrl(url)) {
                  throw Exception('Could not launch $url');
                }
              },
              child: SvgPicture.asset(kXIcon),
            ),
            const SizedBox(
              width: 16,
            ),
            GestureDetector(
              onTap: ()async{
                var url = Uri.parse('https://www.facebook.com/k.khalifa74');
                if(await launchUrl(url)) {
                  throw Exception('Could not launch $url');
                }
              },
              child: SvgPicture.asset(kFacebookIcon),
            ),
          ],
        ),
      ],
    );
  }
}
