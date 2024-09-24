import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moshaf_app/image_assets.dart';
import 'package:moshaf_app/model/ayat_model.dart';
import 'package:moshaf_app/shared/cubit/cubit/main_cubit.dart';
import 'package:moshaf_app/shared/cubit/cubit/main_state.dart';
import 'package:moshaf_app/shared/widget/ayat_list_view.dart';
import 'package:moshaf_app/shared/widget/surah_name_widget.dart';

class AyatScreen extends StatelessWidget {
  const AyatScreen({super.key, required this.surahs, required this.number});
  final AyatModel surahs;
  final int number;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => MainCubit()..getQuran(),
      child: BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {},
        builder: (context, state) {
          MainCubit mainCubit = MainCubit.get(context);

          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
            ),
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.imagesBackground),
                  fit: BoxFit.fill,
                ),
              ),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                extendBody: true,
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SurahNameWidget(
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                        surahs: surahs,
                        number: number,
                        mainCubit: mainCubit,
                      ),
                      if (state is GetQuranLoading)
                        const Expanded(
                          child: Center(
                            child: CircularProgressIndicator.adaptive(
                              backgroundColor: Colors.amber,
                            ),
                          ),
                        )
                      else
                        Expanded(
                          child: AyatListView(
                              mainCubit: mainCubit, number: number),
                        ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
