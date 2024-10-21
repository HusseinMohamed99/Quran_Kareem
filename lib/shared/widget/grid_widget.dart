import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moshaf_app/image_assets.dart';
import 'package:moshaf_app/screens/MoshafScreen/moshaf_screen.dart';
import 'package:moshaf_app/screens/RadioScreen/radio_screen.dart';
import 'package:moshaf_app/screens/RecitersScreen/reciters_screen.dart';
import 'package:moshaf_app/screens/RiwayatScreen/rewayat_screen.dart';
import 'package:moshaf_app/screens/TafasirScreen/tafasir_screen.dart';
import 'package:moshaf_app/screens/VideoScreen/video_screen.dart';
import 'package:moshaf_app/shared/Colors/color_manager.dart';
import 'package:moshaf_app/shared/components/navigator.dart';
import 'package:moshaf_app/shared/components/responsive.space.dart';

class GridWidget extends StatelessWidget {
  const GridWidget({
    super.key,
    required this.titleAR,
    required this.titleEN,
    required this.function,
  });
  final String titleAR;
  final String titleEN;
  final void Function() function;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: function,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SvgPicture.asset(
              Assets.imagesLogo,
              height: 100.h,
              width: 100.w,
            ),
            Container(
              width: context.screenWidth,
              height: context.screenHeight * .18,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    ColorsManager.kGreenColor,
                    ColorsManager.kBlueColor.withOpacity(0.2),
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    titleAR,
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: ColorsManager.kWhiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    titleEN,
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: ColorsManager.kWhiteColor,
                      fontWeight: FontWeight.bold,
                    ),
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

class ListOfGridWidget extends StatelessWidget {
  const ListOfGridWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            GridWidget(
              titleAR: 'سورة',
              titleEN: 'Surah',
              function: () {
                navigateTo(context, const MoshafScreen());
              },
            ),
            SizedBox(
              width: 20.w,
            ),
            GridWidget(
              titleAR: 'راديو',
              titleEN: 'Radio',
              function: () {
                navigateTo(context, const RadioScreen());
              },
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          children: [
            GridWidget(
              titleAR: 'روايات',
              titleEN: 'Rewayat',
              function: () {
                navigateTo(context, const RiwayatScreen());
              },
            ),
            SizedBox(
              width: 20.w,
            ),
            GridWidget(
              titleAR: 'تفسير',
              titleEN: 'Tafasir',
              function: () {
                navigateTo(context, const TafasirScreen());
              },
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          children: [
            GridWidget(
              titleAR: 'القراء',
              titleEN: 'Reciters',
              function: () {
                navigateTo(context, const RecitersScreen());
              },
            ),
            SizedBox(
              width: 20.w,
            ),
            GridWidget(
              titleAR: 'فيديوهات',
              titleEN: 'Videos',
              function: () {
                navigateTo(context, const VideoScreen());
              },
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
