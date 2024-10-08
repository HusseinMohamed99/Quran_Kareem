import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moshaf_app/image_assets.dart';
import 'package:moshaf_app/model/ayat_model.dart';
import 'package:moshaf_app/model/surah_model.dart';
import 'package:moshaf_app/shared/Colors/color_manager.dart';
import 'package:moshaf_app/shared/cubit/cubit/main_cubit.dart';
import 'package:moshaf_app/shared/cubit/cubit/main_state.dart';
import 'package:moshaf_app/shared/widget/surah_widget.dart';

class MoshafScreen extends StatelessWidget {
  const MoshafScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => MainCubit()
        ..getSurahEN()
        ..getQuran(),
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
                  image: AssetImage(
                    Assets.imagesBackground,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                extendBody: true,
                body: SizedBox(
                  width: screenWidth,
                  height: screenHeight,
                  child: Column(
                    children: [
                      SizedBox(
                        height: screenHeight * .03,
                      ),
                      SizedBox(
                        height: screenHeight * .4,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              top: screenHeight * .001,
                              child: SvgPicture.asset(
                                Assets.imagesLogo,
                                width: screenWidth * .8,
                              ),
                            ),
                            Positioned(
                              top: screenHeight * .20,
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Container(
                                    width: screenWidth * .9,
                                    height: screenHeight * .2,
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
                                  SvgPicture.asset(
                                      Assets.imagesVectorOptimized),
                                  Positioned(
                                    top: screenHeight * .08,
                                    child: SvgPicture.asset(
                                      Assets.imagesAlBasmala,
                                      fit: BoxFit.fitHeight,
                                      width: screenWidth * .6,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (state is GetSurahLoading || state is GetQuranLoading)
                        const Expanded(
                          child: Center(
                            child: CircularProgressIndicator.adaptive(
                              backgroundColor: Colors.amber,
                            ),
                          ),
                        )
                      else
                        Expanded(
                          child: ListView.separated(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              if (mainCubit.surahModel!.suwar!.isEmpty ||
                                  mainCubit.surahModel?.suwar == null) {
                                return const CircularProgressIndicator
                                    .adaptive();
                              } else {
                                return SurahWidget(
                                  surahModel:
                                      mainCubit.surahModel ?? SurahModel(),
                                  number: index,
                                  surahs: mainCubit.ayatModel ?? AyatModel(),
                                );
                              }
                            },
                            separatorBuilder: (context, index) {
                              return const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 25),
                                child: Divider(
                                  color: ColorsManager.kWhiteColor,
                                ),
                              );
                            },
                            itemCount: mainCubit.surahModel?.suwar?.length ?? 0,
                          ),
                        ),
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
