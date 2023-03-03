import 'package:app_doc_1/src/constants/sizes.dart';
import 'package:app_doc_1/src/constants/text_strings.dart';
import 'package:flutter/material.dart';

import 'widgets/appbar.dart';
import 'widgets/banners.dart';
import 'widgets/categories.dart';
import 'widgets/search.dart';
import 'widgets/top_courses.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: DashboardAppBar(textTheme: textTheme),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDashboardPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Heading
              Text(tDashboardTitle, style: textTheme.bodySmall),
              Text(tDashboardHeading, style: textTheme.headlineSmall),
              const SizedBox(height: tDashboardPadding),

              // Search Box
              DashboardSearchBox(textTheme: textTheme),
              const SizedBox(height: tDashboardPadding),

              // Categories
              DashboardCategories(textTheme: textTheme),
              const SizedBox(height: tDashboardPadding),

              //Banners
              DashboardBanners(textTheme: textTheme),
              const SizedBox(height: tDashboardCardPadding),

              // Top Courses
              Text(tDashboardTopCourses,
                  style: textTheme.titleLarge?.apply(fontSizeFactor: 1.2)),
              DashBoardTopCourses(textTheme: textTheme),
            ],
          ),
        ),
      ),
    );
  }
}
