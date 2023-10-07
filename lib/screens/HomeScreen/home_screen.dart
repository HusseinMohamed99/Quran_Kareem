import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:moshaf_app/image_assets.dart';
import 'package:moshaf_app/shared/Colors/color_manager.dart';
import 'package:moshaf_app/shared/Cubit/cubit/main_cubit_state.dart';
import 'package:moshaf_app/shared/cubit/cubit/main_cubit_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {},
      builder: (context, state) {
        // MainCubit mainCubit = MainCubit.get(context);
        return Scaffold(
          backgroundColor: ColorsManager.kBlackColor,
          extendBody: true,
          body: SizedBox(
            width: screenWidth,
            height: screenHeight,
            child: const SafeArea(bottom: false, child: Text('')),
          ),
          floatingActionButton: Container(
            padding: const EdgeInsets.all(4),
            margin: const EdgeInsets.only(top: 40),
            width: 71,
            height: 71,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  ColorsManager.kGreenColor.withOpacity(0.2),
                  ColorsManager.kPinkColor.withOpacity(0.2),
                ],
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(4),
              width: 62,
              height: 62,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    ColorsManager.kGreenColor,
                    ColorsManager.kPinkColor,
                  ],
                ),
              ),
              child: RawMaterialButton(
                onPressed: () {},
                shape: const CircleBorder(),
                fillColor: const Color(0xff4a5768),
                child: SvgPicture.asset(Assets.imagesIconHome),
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterDocked,
          bottomNavigationBar: GlassmorphicContainer(
            alignment: Alignment.center,
            width: screenWidth,
            height: 70,
            borderRadius: 0,
            linearGradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                ColorsManager.kWhiteColor.withOpacity(0.1),
                ColorsManager.kWhiteColor.withOpacity(0.1),
              ],
            ),
            border: 0,
            blur: 41,
            borderGradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                ColorsManager.kPinkColor,
                ColorsManager.kGreenColor,
              ],
            ),
            child: BottomAppBar(
                elevation: 0,
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(Assets.imagesIconHome),
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(Assets.imagesIconHome),
                      ),
                    ),
                    const Expanded(child: Text('')),
                    Expanded(
                      child: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(Assets.imagesIconHome),
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(Assets.imagesIconHome),
                      ),
                    ),
                  ],
                )),
          ),
        );
      },
    );
  }
}
