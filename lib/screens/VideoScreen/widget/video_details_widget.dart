part of '../../../core/helpers/export_manager/export_manager.dart';

class VideosDetailsWidget extends StatefulWidget {
  const VideosDetailsWidget(
      {super.key,
      required this.mainCubit,
      required this.index,
      required this.number});
  final MainCubit mainCubit;
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
      widget.mainCubit.videosModel!.videos![widget.number]
              .videosVideos![widget.index].videoUrl ??
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
    return Column(
      children: [
        BuildVideoItem(
          controller: _controller,
          voidCallback: () {
            setState(
              () {
                _controller.value.isPlaying
                    ? _controller.pause()
                    : _controller.play();
              },
            );
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomVideoIconButton(
              voidCallback: () {
                _controller.value.isPlaying
                    ? _controller.pause()
                    : _controller.play();
              },
              imageIcon: _controller.value.isPlaying
                  ? Assets.imagesPauseIcon
                  : Assets.imagesIconPlay,
            ),
            CustomVideoIconButton(
              voidCallback: () {
                Share.share(
                    "الفديو : ${widget.mainCubit.videosModel!.videos![widget.number].videosVideos![widget.index].videoUrl ?? ''}");
              },
              imageIcon: Assets.imagesShare,
            ),
          ],
        ),
      ],
    );
  }
}
