import 'package:app_doc_1/src/constants/colors.dart';
import 'package:app_doc_1/src/constants/image_strings.dart';
import 'package:app_doc_1/src/constants/sizes.dart';
import 'package:app_doc_1/src/constants/text_strings.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu, color: Colors.black),
        title: Text(tAppName, style: textTheme.headlineMedium),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20, top: 7.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: tCardBgColor),
            child: IconButton(
              onPressed: () {},
              icon: const Image(
                image: AssetImage(tUserProfileImage),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDashboardPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(tDashboardTitle, style: textTheme.bodySmall),
              Text(tDashboardHeading, style: textTheme.headlineSmall),
              const SizedBox(height: tDashboardPadding),
              Container(
                decoration: const BoxDecoration(
                    border: Border(left: BorderSide(width: 4.0))),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(tDashboardSearch,
                        style: textTheme.headlineMedium
                            ?.apply(color: Colors.grey.withOpacity(0.5))),
                    const Icon(Icons.mic, size: 25)
                  ],
                ),
              ),
              const SizedBox(height: tDashboardPadding),
            ],
          ),
        ),
      ),
    );
  }
}
