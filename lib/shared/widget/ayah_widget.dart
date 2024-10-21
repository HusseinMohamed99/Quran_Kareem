part of './../../core/helpers/export_manager/export_manager.dart';

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
                  color: ColorsManager.kGreenColor,
                ),
                child: Text(
                  widget.surahs.data!.surah![widget.number].ayahs![widget.index]
                      .numberInSurah
                      .toString(),
                  style: TextStyle(
                    color: ColorsManager.kBlackColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  Share.share(
                      "الآيه: ${widget.surahs.data!.surah![widget.number].ayahs![widget.index].text ?? ''}\n الصوت:  ${widget.surahs.data!.surah![widget.number].ayahs![widget.index].audio ?? ""} \n تحميل البرنامج:  https://github.com/HusseinMohamed99/Moshaf_App/releases/download/v1.0.0/QURAN.KAREEM.V4.apk");
                },
                icon: SvgPicture.asset(Assets.imagesShare),
              ),
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
                onPressed: () {},
                icon: SvgPicture.asset(Assets.imagesSave),
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        Text(
          widget.surahs.data!.surah![widget.number].ayahs![widget.index].text ??
              '',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: ColorsManager.kWhiteColor,
            fontSize: 20.sp,
          ),
        ),
      ],
    );
  }
}
