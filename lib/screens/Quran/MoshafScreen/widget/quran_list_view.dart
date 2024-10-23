part of './../../../../core/helpers/export_manager/export_manager.dart';

class QuranListView extends StatelessWidget {
  const QuranListView(
      {super.key, required this.state, required this.mainCubit});
  final MainState state;
  final MainCubit mainCubit;
  @override
  Widget build(BuildContext context) {
    if (state is GetQuranLoading || state is GetSurahLoading) {
      return const AdaptiveIndicator();
    } else {
      return Expanded(
        child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                navigateTo(
                  context,
                  AyatScreen(
                    surahs: mainCubit.ayatModel ?? AyatModel(),
                    number: index,
                  ),
                );
              },
              child: SurahWidget(
                surahModel: mainCubit.surahModel ?? SurahModel(),
                number: index,
                surahs: mainCubit.ayatModel ?? AyatModel(),
              ),
            );
          },
          separatorBuilder: (context, index) =>
              const Divider(color: ColorsManager.kWhiteColor),
          itemCount: mainCubit.surahModel?.suwar?.length ?? 0,
        ),
      );
    }
  }
}
