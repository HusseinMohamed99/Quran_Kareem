import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moshaf_app/image_assets.dart';
import 'package:moshaf_app/model/riwayat_model.dart';
import 'package:moshaf_app/shared/Colors/color_manager.dart';
import 'package:moshaf_app/shared/cubit/cubit/main_cubit_cubit.dart';
import 'package:moshaf_app/shared/cubit/cubit/main_cubit_state.dart';

class RiwayatScreen extends StatelessWidget {
  const RiwayatScreen({super.key});

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
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            extendBody: true,
            body: SizedBox(
              height: screenHeight,
              width: screenWidth,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: SvgPicture.asset(
                        Assets.imagesGroup,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return RiwayatItem(
                            riwayatModel: mainCubit.riwayatModel!,
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
                        itemCount: mainCubit.riwayatModel!.riwayat!.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}

class RiwayatItem extends StatelessWidget {
  const RiwayatItem(
      {super.key, required this.riwayatModel, required this.index});
  final RiwayatModel riwayatModel;
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
                riwayatModel.riwayat![index].id.toString(),
                style: const TextStyle(
                  color: ColorsManager.kWhiteColor,
                ),
              ),
            ],
          ),
          Expanded(
            child: Text(
              riwayatModel.riwayat![index].name!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: ColorsManager.kGreenColor,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
