part of '../../../../core/helpers/export_manager/export_manager.dart';

class AyahWidget extends StatefulWidget {
  const AyahWidget({
    super.key,
    required this.surahs,
    required this.index,
    required this.number,
  });
  final AyatModel surahs;
  final int index;
  final int number;

  @override
  State<AyahWidget> createState() => _AyahWidgetState();
}

class _AyahWidgetState extends State<AyahWidget> {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(17, 32, 149, 100),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            border: Border.all(
              color: ColorsManager.kBlueColor,
            ),
          ),
          child: Row(
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                width: 30.w,
                height: 30.h,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      ColorsManager.kWhiteColor,
                      ColorsManager.kGreenColor,
                      ColorsManager.kBlueColor,
                    ],
                  ),
                ),
                child: Text(
                  widget.surahs.data!.surah![widget.number].ayahs![widget.index]
                      .numberInSurah
                      .toString(),
                  style: buildTextStyle(
                    context: context,
                    fontSize: 14,
                    color: ColorsManager.kBlackColor,
                  ),
                ),
              ),
              const Spacer(),
              IconButton(
                iconSize: 24.sp,
                onPressed: () {
                  setState(
                    () {
                      if (audioPlayer.state != PlayerState.playing) {
                        audioPlayer.play(
                          UrlSource(
                            widget.surahs.data!.surah![widget.number]
                                    .ayahs![widget.index].audio ??
                                '',
                          ),
                        );
                      } else {
                        audioPlayer.stop();
                      }
                    },
                  );
                },
                icon: SvgPicture.asset(
                  audioPlayer.state == PlayerState.playing
                      ? Assets.imagesPauseIcon
                      : Assets.imagesPlay,
                  width: 24.w,
                  height: 24.h,
                  colorFilter: const ColorFilter.mode(
                    ColorsManager.kGreenColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              IconButton(
                iconSize: 24.sp,
                onPressed: () {
                  Share.share(
                      "الآيه: ${widget.surahs.data!.surah![widget.number].ayahs![widget.index].text ?? ''}\n الصوت:  ${widget.surahs.data!.surah![widget.number].ayahs![widget.index].audio ?? ""}");
                },
                icon: SvgPicture.asset(
                  Assets.imagesShare,
                  width: 24.w,
                  height: 24.h,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          widget.surahs.data!.surah![widget.number].ayahs![widget.index].text ??
              '',
          textAlign: TextAlign.center,
          style: buildTextStyle(context: context, fontSize: 20),
        ),
      ],
    );
  }
}
