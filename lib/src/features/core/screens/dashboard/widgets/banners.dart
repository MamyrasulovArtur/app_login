import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/image_strings.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';

class DashboardBanners extends StatelessWidget {
  const DashboardBanners({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: isDarkMode ? tDarkColor : tCardBgColor),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Flexible(
                        child: Image(
                      image: AssetImage(tBookmarkIcon),
                      height: 25,
                      width: 25,
                    )),
                    Flexible(
                        child: Image(
                      fit: BoxFit.cover,
                      image: AssetImage(tBannerImage1),
                      height: 120,
                    ))
                  ],
                ),
                const SizedBox(height: 25),
                Text(
                  tDashboardBannerTitle1,
                  style: textTheme.titleLarge,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  tDashboardBannerSubTitle,
                  style: textTheme.bodyMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
        ),
        const SizedBox(width: tDashboardCardPadding),
        Expanded(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: isDarkMode ? tDarkColor : tCardBgColor,
                    borderRadius: BorderRadius.circular(10)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Flexible(
                            child: Image(
                          image: AssetImage(tBookmarkIcon),
                          height: 25,
                          width: 25,
                        )),
                        Flexible(
                            child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage(tBannerImage2),
                          height: 100,
                        ))
                      ],
                    ),
                    const SizedBox(height: 25),
                    Text(
                      tDashboardBannerTitle2,
                      style: textTheme.titleLarge,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      tDashboardBannerSubTitle,
                      style: textTheme.bodyMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () {}, child: const Text(tDashboardButton)),
              )
            ],
          ),
        ),
      ],
    );
  }
}
