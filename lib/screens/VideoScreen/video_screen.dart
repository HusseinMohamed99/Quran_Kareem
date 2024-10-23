part of './../../core/helpers/export_manager/export_manager.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

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
          body: BlocConsumer<MainCubit, MainState>(
            listener: (context, state) {},
            builder: (context, state) {
              MainCubit mainCubit = MainCubit.get(context);
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: context.screenHeight * .05,
                    ),
                    SvgPicture.asset(
                      Assets.imagesLogo,
                      width: 100.w,
                      height: 100.h,
                    ),
                    if (state is GetVideosLoading)
                      const AdaptiveIndicator()
                    else
                      Expanded(
                        flex: 3,
                        child: ListView.separated(
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return VideoListItem(
                              mainCubit: mainCubit,
                              index: index,
                            );
                          },
                          itemCount: mainCubit.videosModel?.videos?.length ?? 0,
                          separatorBuilder: (context, int index) {
                            return SizedBox(
                              height: 20.h,
                            );
                          },
                        ),
                      ),
                    SizedBox(
                      height: context.screenHeight * .02,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
