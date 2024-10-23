part of './../../../core/helpers/export_manager/export_manager.dart';

class RadioListViewWidget extends StatefulWidget {
  const RadioListViewWidget(
      {super.key, required this.radioModel, required this.index});
  final RadioModel radioModel;
  final int index;

  @override
  State<RadioListViewWidget> createState() => _RadioListViewWidgetState();
}

class _RadioListViewWidgetState extends State<RadioListViewWidget> {
  late AudioPlayer audioPlayer;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.radioModel.radios![widget.index].name ?? '',
            style: buildTextStyle(context: context, fontSize: 16),
          ),
          SizedBox(
            height: 50.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                iconSize: 24.sp,
                onPressed: () {
                  setState(
                    () {
                      audioPlayer.play(
                        UrlSource(
                          widget.radioModel.radios![widget.index].url ?? '',
                        ),
                      );
                    },
                  );
                },
                icon: SvgPicture.asset(
                  Assets.imagesIconPlay,
                  width: 24.w,
                  height: 24.h,
                  colorFilter: const ColorFilter.mode(
                    ColorsManager.kWhiteColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              IconButton(
                iconSize: 24.sp,
                onPressed: () async {
                  await audioPlayer.pause();
                },
                icon: SvgPicture.asset(
                  Assets.imagesPauseIcon,
                  width: 24.w,
                  height: 24.h,
                  colorFilter: const ColorFilter.mode(
                    ColorsManager.kWhiteColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
