import 'package:flutter/material.dart';
import 'package:moshaf_app/model/ayat_model.dart';
import 'package:moshaf_app/shared/cubit/cubit/main_cubit.dart';
import 'package:moshaf_app/shared/widget/ayah_widget.dart';

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
        return const SizedBox(
          height: 60,
        );
      },
    );
  }
}
