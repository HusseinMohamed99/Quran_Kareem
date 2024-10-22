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
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(Assets.imagesIconMuslim),
            Text(
              surahModel.suwar?[number].id?.toString() ?? '',
              style: buildTextStyle(context: context, fontSize: 12),
            ),
          ],
        ),
        SizedBox(
          width: 20.w,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    surahModel.suwar?[number].name ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: buildTextStyle(
                      context: context,
                      fontSize: 16,
                      color: ColorsManager.kGreenColor,
                    ),
                  ),
                  Text(
                    surahs.data?.surah?[number].name ?? '',
                    textAlign: TextAlign.center,
                    style: buildTextStyle(
                      context: context,
                      fontSize: 16,
                      color: ColorsManager.kGreenColor,
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
                    style: buildTextStyle(context: context, fontSize: 11),
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
                    style: buildTextStyle(context: context, fontSize: 11),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
