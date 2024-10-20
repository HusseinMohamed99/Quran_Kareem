part of './../../core/helpers/export_manager/export_manager.dart';

class VideoDetailsScreen extends StatelessWidget {
  const VideoDetailsScreen(
      {super.key, required this.number, required this.videosModel});
  final int number;
  final VideosModel videosModel;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {},
      builder: (context, state) {
        MainCubit mainCubit = MainCubit.get(context);
        final screenHeight = MediaQuery.of(context).size.height;
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.imagesBackground),
                fit: BoxFit.fill,
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              extendBody: true,
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: screenHeight * .1,
                    ),
                    SvgPicture.asset(
                      Assets.imagesAlQuran,
                    ),
                    Expanded(
                      child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return VideosDetailsWidget(
                            index: index,
                            videosModel: mainCubit.videosModel ?? VideosModel(),
                            number: number,
                          );
                        },
                        itemCount: mainCubit.videosModel?.videos?[number]
                                .videosVideos?.length ??
                            0,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: 40,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
