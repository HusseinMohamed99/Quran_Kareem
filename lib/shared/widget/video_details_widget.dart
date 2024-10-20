part of './../../core/helpers/export_manager/export_manager.dart';

class VideosDetailsWidget extends StatefulWidget {
  const VideosDetailsWidget(
      {super.key,
      required this.videosModel,
      required this.index,
      required this.number});
  final VideosModel videosModel;
  final int index;
  final int number;

  @override
  State<VideosDetailsWidget> createState() => _VideosDetailsWidgetState();
}

class _VideosDetailsWidgetState extends State<VideosDetailsWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.contentUri(Uri.parse(
      widget.videosModel.videos![widget.number].videosVideos![widget.index]
              .videoUrl ??
          '',
    ))
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(
                  () {
                    _controller.value.isPlaying
                        ? _controller.pause()
                        : _controller.play();
                  },
                );
              },
              child: Center(
                child: _controller.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      )
                    : Image.network(
                        widget.videosModel.videos![widget.number]
                                .videosVideos![widget.index].videoThumbUrl ??
                            '',
                        fit: BoxFit.fitWidth,
                        width: screenWidth,
                        height: screenHeight * .5,
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return const Text(
                            'ooops Error with Image',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 10),
                          );
                        },
                      ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  iconSize: 24,
                  onPressed: () {
                    setState(
                      () {
                        _controller.value.isPlaying
                            ? _controller.pause()
                            : _controller.play();
                      },
                    );
                  },
                  icon: SvgPicture.asset(
                    _controller.value.isPlaying
                        ? Assets.imagesPauseIcon
                        : Assets.imagesIconPlay,
                    width: 24,
                    height: 24,
                    colorFilter: const ColorFilter.mode(
                      ColorsManager.kWhiteColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Share.share(
                        "الفديو: ${widget.videosModel.videos![widget.number].videosVideos![widget.index].videoUrl ?? ''}\n تحميل البرنامج:  https://github.com/HusseinMohamed99/Moshaf_App/releases/download/v1.0.0/QURAN.KAREEM.V4.apk");
                  },
                  icon: SvgPicture.asset(
                    Assets.imagesShare,
                    height: 40,
                    colorFilter: const ColorFilter.mode(
                      ColorsManager.kWhiteColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
