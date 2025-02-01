import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/services/shared_prefs.dart';
import 'package:shop_flow/core/utils/app_colors.dart';
import 'package:shop_flow/core/utils/app_styles.dart';
import 'package:shop_flow/features/auth/presentation/views/signin_view.dart';
import 'package:shop_flow/features/onboard/presentation/widgets/custom_dots_indicator.dart';
import 'package:shop_flow/features/onboard/presentation/widgets/custom_onboard_button.dart';
import 'package:shop_flow/features/onboard/presentation/widgets/onboard_page_view.dart';

class OnboardViewBody extends StatefulWidget {
  const OnboardViewBody({super.key});

  @override
  State<OnboardViewBody> createState() => _OnboardViewBodyState();
}

class _OnboardViewBodyState extends State<OnboardViewBody> {
  late PageController pageController;
  int currentIndex = 0;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentIndex = pageController.page!.round();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () async {
                    Navigator.pushReplacementNamed(context, SigninView.id);
                    await SharedPrefs.setBool(isOnboardedSeen, true);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Skip',
                      style: AppStyles.bold16,
                    ),
                  ),
                )
              ],
            ),
            Expanded(child: OnboardPageView(pageController: pageController)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomDotsIndicator(activeIndex: currentIndex),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  currentIndex == 2
                      ? SizedBox()
                      : CustomOnboardButton(
                          text: 'Previous',
                          pageController: pageController,
                          currentIndex: currentIndex,
                          onPressed: () {
                            pageController.animateToPage(currentIndex - 1,
                                duration: const Duration(milliseconds: 250),
                                curve: Curves.easeInOut);
                          },
                        ),
                  CustomOnboardButton(
                    text: currentIndex == 2 ? 'Skip' : 'Next',
                    backgroundColor: AppColors.primaryColor,
                    textColor: Colors.white,
                    pageController: pageController,
                    currentIndex: currentIndex,
                    onPressed: () {
                      if (currentIndex == 2) {
                        Navigator.pushReplacementNamed(context, SigninView.id);
                        SharedPrefs.setBool(isOnboardedSeen, true);
                      } else {
                        pageController.animateToPage(currentIndex + 1,
                            duration: const Duration(milliseconds: 250),
                            curve: Curves.easeInOut);
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
