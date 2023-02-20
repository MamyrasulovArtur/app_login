import 'package:get/state_manager.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

import '../../../constants/colors.dart';
import '../../../constants/image_strings.dart';
import '../../../constants/text_strings.dart';
import '../models/model_on_broading.dart';
import '../screens/on_broading/on_broading_page_widget.dart';

class OnBroadingScreenController extends GetxController {
  final controller = LiquidController();

  RxInt currentPage = 0.obs;

  final pages = [
    OnBroadingPage(
      model: OnBroadingModel(
        bgColor: tOnBroadingPage1Color,
        image: tOnBroadingImage1,
        title: tOnBroadingTitle1,
        subTitle: tOnBroadingSubTitle1,
        counterText: tOnBroadingCounter1,
      ),
    ),
    OnBroadingPage(
      model: OnBroadingModel(
        bgColor: tOnBroadingPage2Color,
        image: tOnBroadingImage2,
        title: tOnBroadingTitle2,
        subTitle: tOnBroadingSubTitle2,
        counterText: tOnBroadingCounter2,
      ),
    ),
    OnBroadingPage(
      model: OnBroadingModel(
        bgColor: tOnBroadingPage3Color,
        image: tOnBroadingImage3,
        title: tOnBroadingTitle3,
        subTitle: tOnBroadingSubTitle3,
        counterText: tOnBroadingCounter3,
      ),
    ),
  ];
  void onPageChangeCallback(int activePageIndex) =>
      currentPage.value = activePageIndex;
  void animatedToNextSlide() {
    int nextPage = controller.currentPage + 1;
    controller.animateToPage(page: nextPage);
  }

  void skip() => controller.jumpToPage(page: 2);
}
