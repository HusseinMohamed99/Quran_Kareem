import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moshaf_app/image_assets.dart';
import 'package:moshaf_app/model/surah_model.dart';
import 'package:moshaf_app/shared/Colors/color_manager.dart';
import 'package:moshaf_app/shared/cubit/cubit/main_cubit_state.dart';
import 'package:moshaf_app/shared/cubit/cubit/main_cubit_cubit.dart';

class MoshafScreen extends StatelessWidget {
  const MoshafScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocConsumer<MainCubit, MainState>(
      builder: (context, state) {
        MainCubit mainCubit = MainCubit.get(context);

        return Container(
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
                    height: screenHeight * .08,
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
                              SvgPicture.asset(Assets.imagesVector),
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
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return SurahItem(
                          surahModel: mainCubit.surahModel!,
                          index: index,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          child: Divider(
                            color: ColorsManager.kWhiteColor,
                          ),
                        );
                      },
                      itemCount: mainCubit.surahModel!.suwar!.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}

class SurahItem extends StatelessWidget {
  const SurahItem({super.key, required this.surahModel, required this.index});
  final SurahModel surahModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(Assets.imagesIconMuslim),
              Text(
                surahModel.suwar![index].id!.toString(),
                style: const TextStyle(
                  color: ColorsManager.kWhiteColor,
                ),
              ),
            ],
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  surahModel.suwar![index].name!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: ColorsManager.kGreenColor,
                    fontSize: 20,
                  ),
                ),
                Text(
                  surahModel.suwar![index].makkia!.toString() == '0'
                      ? 'Medinian'
                      : 'Meccan',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: ColorsManager.kWhiteColor,
                    fontSize: 14,
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
