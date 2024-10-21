part of './../../core/helpers/export_manager/export_manager.dart';

class SurahWidget extends StatelessWidget {
  const SurahWidget({
    super.key,
    required this.surahModel,
    required this.number,
    required this.surahs,
  });
  final SurahModel surahModel;
  final int number;
  final AyatModel surahs;
  @override
  Widget build(BuildContext context) {
    MainCubit mainCubit = MainCubit.get(context);
    return GestureDetector(
      onTap: () {
        navigateTo(
          context,
          AyatScreen(
            surahs: surahs,
            number: number,
          ),
        );
      },
      child: Row(
        children: [
          // Stack(
          //   alignment: Alignment.center,
          //   children: [
          //     SvgPicture.asset(Assets.imagesIconMuslim),
          //     Text(
          //       surahModel.suwar?[number].id?.toString() ?? '',
          //       style: const TextStyle(
          //         color: ColorsManager.kWhiteColor,
          //       ),
          //     ),
          //   ],
          // ),
          // SizedBox(
          //   width: 20.w,
          // ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      surahModel.suwar?[number].name ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: ColorsManager.kGreenColor,
                        fontSize: 20.sp,
                      ),
                    ),
                    Text(
                      surahs.data?.surah?[number].name ?? '',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorsManager.kGreenColor,
                        fontSize: 20.sp,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      surahModel.suwar?[number].makkia?.toString() == '0'
                          ? 'Medinian'
                          : 'Meccan',
                      style: const TextStyle(
                        color: ColorsManager.kWhiteColor,
                        fontSize: 14,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 5,
                      ),
                      width: 5,
                      height: 5,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorsManager.kGreyColor,
                      ),
                    ),
                    Text(
                      '${mainCubit.ayatModel?.data?.surah?[number].ayahs?.length.toString() ?? ''} verses'
                          .toUpperCase(),
                      style: const TextStyle(
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
    );
  }
}
