part of '../../../core/helpers/export_manager/export_manager.dart';

class VideoDetailsScreen extends StatelessWidget {
  const VideoDetailsScreen(
      {super.key, required this.number, required this.mainCubit});
  final int number;
  final MainCubit mainCubit;
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Container(
        decoration: backgroundImage(),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          extendBody: true,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: context.screenHeight * .05,
              ),
              SvgPicture.asset(
                Assets.imagesAlBasmala,
              ),
              Expanded(
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
                  itemBuilder: (context, index) {
                    return VideosDetailsWidget(
                      index: index,
                      mainCubit: mainCubit,
                      number: number,
                    );
                  },
                  itemCount: mainCubit
                          .videosModel?.videos?[number].videosVideos?.length ??
                      0,
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(
                      color: ColorsManager.kWhiteColor,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
