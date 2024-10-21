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
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.imagesBackground),
            fit: BoxFit.fill,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          extendBody: true,
          body: BlocConsumer<MainCubit, MainState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              MainCubit mainCubit = MainCubit.get(context);
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            Assets.imagesHelal,
                          ),
                          SvgPicture.asset(
                            Assets.imagesAlQuran,
                          ),
                        ],
                      ),
                    ),
                    if (state is GetVideosLoading)
                      const Expanded(
                        child: Center(
                          child: CircularProgressIndicator.adaptive(
                            backgroundColor: Colors.amber,
                          ),
                        ),
                      )
                    else
                      Expanded(
                        child: ListView.separated(
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                navigateTo(
                                  context,
                                  BlocProvider(
                                    create: (context) =>
                                        MainCubit()..getVideo(),
                                    child: VideoDetailsScreen(
                                      videosModel: mainCubit.videosModel ??
                                          VideosModel(),
                                      number: index,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(17, 32, 149, 100),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  border: Border.all(
                                    color: ColorsManager.kBlueColor,
                                  ),
                                ),
                                child: Text(
                                  mainCubit.videosModel?.videos?[index]
                                          .reciterName ??
                                      '',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: ColorsManager.kWhiteColor,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: mainCubit.videosModel?.videos?.length ?? 0,
                          separatorBuilder: (context, int index) {
                            return const SizedBox(
                              height: 40,
                            );
                          },
                        ),
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
