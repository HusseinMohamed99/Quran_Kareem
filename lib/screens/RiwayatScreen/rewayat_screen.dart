import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moshaf_app/image_assets.dart';
import 'package:moshaf_app/model/riwayat_model.dart';
import 'package:moshaf_app/shared/Colors/color_manager.dart';
import 'package:moshaf_app/shared/cubit/cubit/main_cubit.dart';
import 'package:moshaf_app/shared/cubit/cubit/main_state.dart';
import 'package:moshaf_app/shared/widget/rewayet_widget.dart';

class RiwayatScreen extends StatelessWidget {
  const RiwayatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => MainCubit()..getRiwayat(),
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
                        if (state is GetRiwayatLoading)
                          const Expanded(
                            child: Center(
                              child: CircularProgressIndicator.adaptive(
                                backgroundColor: Colors.amber,
                              ),
                            ),
                          )
                        else
                          Expanded(
                            flex: 2,
                            child: ListView.separated(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return RiwayatWidget(
                                  riwayatModel:
                                      mainCubit.riwayatModel ?? RiwayatModel(),
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
                              itemCount:
                                  mainCubit.riwayatModel?.riwayat?.length ?? 0,
                            ),
                          ),
                      ],
                    ),
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
