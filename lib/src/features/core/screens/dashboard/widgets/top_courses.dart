import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/image_strings.dart';
import '../../../../../constants/sizes.dart';

class DashBoardTopCourses extends StatelessWidget {
  const DashBoardTopCourses({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    return SizedBox(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 200,
            child: Padding(
              padding: const EdgeInsets.only(right: 10, top: 5),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: isDarkMode ? tDarkColor : tCardBgColor),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            "Flutter Crash Course",
                            style: textTheme.titleLarge,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const Flexible(
                          child: Image(
                            image: AssetImage(tDashboardImage1),
                            height: 110,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              shape: const CircleBorder()),
                          child: const Icon(Icons.play_arrow),
                        ),
                        const SizedBox(width: tDashboardCardPadding),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("3 Sections",
                                style: textTheme.titleLarge,
                                overflow: TextOverflow.ellipsis),
                            Text("Progromming Languages",
                                style: textTheme.bodyMedium,
                                overflow: TextOverflow.ellipsis),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 200,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: isDarkMode ? tDarkColor : tCardBgColor),
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          "Flutter Crash Course",
                          style: textTheme.titleLarge,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Flexible(
                        child: Image(
                          image: AssetImage(tDashboardImage2),
                          height: 110,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            shape: const CircleBorder()),
                        child: const Icon(Icons.play_arrow),
                      ),
                      const SizedBox(width: tDashboardCardPadding),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("3 Sections",
                              style: textTheme.titleLarge,
                              overflow: TextOverflow.ellipsis),
                          Text("Progromming Languages",
                              style: textTheme.bodyMedium,
                              overflow: TextOverflow.ellipsis),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
