part of '../../../core/helpers/export_manager/export_manager.dart';

class SurahNameWidget extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight * .25,
      child: Stack(
        children: [
          Positioned(
            top: context.screenHeight * .04,
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
                        surahs.data?.surah?[number].name ?? '',
                        style: buildTextStyle(context: context, fontSize: 18),
                      ),
                      Row(
                        children: [
                          Text(
                            surahs.data?.surah?[number].revelationType ?? '',
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
                            '${mainCubit.ayatModel?.data?.surah?[number].ayahs?.length.toString() ?? ''} Verses',
                            style:
                                buildTextStyle(context: context, fontSize: 12),
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
