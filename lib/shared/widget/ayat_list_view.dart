part of './../../core/helpers/export_manager/export_manager.dart';

class AyatListView extends StatelessWidget {
  const AyatListView({
    super.key,
    required this.mainCubit,
    required this.number,
  });

  final MainCubit mainCubit;
  final int number;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return AyahWidget(
          surahs: mainCubit.ayatModel ?? AyatModel(),
          index: index,
          number: number,
        );
      },
      itemCount: mainCubit.ayatModel?.data?.surah?[number].ayahs?.length ?? 0,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 20.h,
        );
      },
    );
  }
}
