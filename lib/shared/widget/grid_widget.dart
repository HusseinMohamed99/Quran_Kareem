part of './../../core/helpers/export_manager/export_manager.dart';

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
                navigateTo(
                  context,
                  BlocProvider(
                    create: (context) => MainCubit()
                      ..getSurahEN()
                      ..getQuran(),
                    child: const MoshafScreen(),
                  ),
                );
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
                navigateTo(
                  context,
                  BlocProvider(
                    create: (context) => MainCubit()..getVideo(),
                    child: const VideoScreen(),
                  ),
                );
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
