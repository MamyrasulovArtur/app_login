import 'package:app_doc_1/src/features/core/models/dashboard_model/categories_model.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';

class DashboardCategories extends StatelessWidget {
  const DashboardCategories({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    final list = DashBoardCategoriesModel.list;
    return SizedBox(
      height: 50,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context, index) => InkWell(
          onTap: list[index].onPress,
          child: SizedBox(
            width: 170.0,
            height: 50.0,
            child: Row(children: [
              Container(
                alignment: Alignment.center,
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                    color: tDarkColor, borderRadius: BorderRadius.circular(10)),
                child: Text(
                  list[index].title,
                  style: textTheme.titleLarge?.apply(color: Colors.white),
                ),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(list[index].heading,
                        style: textTheme.titleLarge,
                        overflow: TextOverflow.ellipsis),
                    Text(list[index].subHeading,
                        style: textTheme.bodyMedium,
                        overflow: TextOverflow.ellipsis)
                  ],
                ),
              )
            ]),
          ),
        ),

        // children: [
        // SizedBox(
        //   width: 170.0,
        //   height: 50.0,
        //   child: Row(children: [
        //     Container(
        //       alignment: Alignment.center,
        //       height: 45,
        //       width: 45,
        //       decoration: BoxDecoration(
        //           color: tDarkColor, borderRadius: BorderRadius.circular(10)),
        //       child: Text(
        //         "JS",
        //         style: textTheme.titleLarge?.apply(color: Colors.white),
        //       ),
        //     ),
        //     Flexible(
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           Text("Java Script",
        //               style: textTheme.titleLarge,
        //               overflow: TextOverflow.ellipsis),
        //           Text(tDashboardBannerSubTitle,
        //               style: textTheme.bodyMedium,
        //               overflow: TextOverflow.ellipsis)
        //         ],
        //       ),
        //     )
        //   ]),
        // ),
        //      ],
      ),
    );
  }
}
