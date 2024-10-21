import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moshaf_app/image_assets.dart';
import 'package:moshaf_app/screens/HomeScreen/home_screen.dart';
import 'package:moshaf_app/shared/Colors/color_manager.dart';
import 'package:moshaf_app/shared/components/custom_outline.dart';
import 'package:moshaf_app/shared/components/upgrade_wrapper.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              Assets.imagesBackground,
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: UpgradeWrapper(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            extendBody: true,
            body: SizedBox(
              height: screenHeight,
              width: screenWidth,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      Assets.imagesOnBoardingLogo,
                      allowDrawingOutsideViewBox: true,
                    ),
                    SizedBox(
                      height: screenHeight <= 600
                          ? screenHeight * 0.07
                          : screenHeight * 0.09,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const HomeScreen();
                            },
                          ),
                        );
                      },
                      child: CustomOutline(
                        strokeWidth: 3,
                        radius: 20,
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            ColorsManager.kBlackColor,
                            ColorsManager.kGreenColor,
                          ],
                        ),
                        width: 160,
                        height: 38,
                        padding: const EdgeInsets.all(3),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                ColorsManager.kBlackColor.withOpacity(0.5),
                                ColorsManager.kGreenColor.withOpacity(0.5),
                              ],
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Get Started',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: screenHeight <= 600 ? 11 : 15,
                                fontWeight: FontWeight.w700,
                                color: ColorsManager.kWhiteColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
