part of '../../../../core/helpers/export_manager/export_manager.dart';

class SurahNameWidget extends StatefulWidget {
  const SurahNameWidget({
    super.key,
    required this.surahs,
    required this.number,
    required this.mainCubit,
  });

  final AyatModel surahs;
  final int number;
  final MainCubit mainCubit;

  @override
  State<SurahNameWidget> createState() => _SurahNameWidgetState();
}

class _SurahNameWidgetState extends State<SurahNameWidget> {
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
      height: context.screenHeight * .29,
      child: Stack(
        children: [
          Positioned(
            top: context.screenHeight * .08,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: context.screenWidth * .9,
                  height: context.screenHeight * .2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    gradient: const LinearGradient(
                      colors: [
                        ColorsManager.kGreenColor,
                        ColorsManager.kBlueColor,
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: context.screenWidth * .04,
                  child: SvgPicture.asset(
                    Assets.imagesQuran,
                    fit: BoxFit.fitHeight,
                    width: context.screenWidth * .4,
                  ),
                ),
                Positioned(
                  right: context.screenWidth * .04,
                  child: Column(
                    children: [
                      Text(
                        widget.surahs.data?.surah?[widget.number].name ?? '',
                        style: buildTextStyle(context: context, fontSize: 18),
                      ),
                      Row(
                        children: [
                          Text(
                            widget.surahs.data?.surah?[widget.number]
                                    .revelationType ??
                                '',
                            style:
                                buildTextStyle(context: context, fontSize: 12),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 5.w,
                            ),
                            width: 5.w,
                            height: 5.h,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorsManager.kGreyColor,
                            ),
                          ),
                          Text(
                            '${widget.mainCubit.ayatModel?.data?.surah?[widget.number].ayahs?.length.toString() ?? ''} Verses',
                            style:
                                buildTextStyle(context: context, fontSize: 12),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(
                                () {
                                  if (audioPlayer.state !=
                                      PlayerState.playing) {
                                    audioPlayer.play(
                                      UrlSource(
                                        'https://listen.ourquraan.com/Mishary_Alafasy/${(widget.number + 1).toString().padLeft(3, '0')}.mp3',
                                      ),
                                    );
                                  } else {
                                    audioPlayer.stop();
                                  }
                                },
                              );
                            },
                            child: CircleAvatar(
                              radius: 18.r,
                              backgroundColor: ColorsManager.kWhiteColor,
                              child: SvgPicture.asset(
                                Assets.imagesPlay,
                                width: 30.w,
                                height: 30.h,
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            'تشغيل السورة كاملة',
                            style: buildTextStyle(
                              context: context,
                              fontSize: 14,
                              color: ColorsManager.kWhiteColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
