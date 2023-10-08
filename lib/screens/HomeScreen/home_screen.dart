import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:moshaf_app/image_assets.dart';
import 'package:moshaf_app/screens/HomeScreen/MoshafScreen/moshaf_screen.dart';
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
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  Assets.imagesBackground,
                ),
                fit: BoxFit.fitWidth,
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.white,
              extendBody: true,
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                elevation: 0,
                leadingWidth: 70,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      padding: const EdgeInsets.only(left: 10),
                      icon: SvgPicture.asset(Assets.imagesMenu),
                      onPressed: () {},
                    ),
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://img.freepik.com/free-vector/hand-drawn-flat-design-salat-illustration_23-2149286670.jpg?w=740&t=st=1696751993~exp=1696752593~hmac=d7cbf26e44abb6dd97ae45177fabfe8b76b4b958eef8f6a440ed8e26c40058f1'),
                    ),
                  ],
                ),
              ),
              body: SizedBox(
                width: screenWidth,
                height: screenHeight,
                child: SafeArea(
                  bottom: false,
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    primary: true,
                    children: [
                      SizedBox(
                        height: screenHeight * .4,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Positioned(
                              top: screenHeight * .001,
                              left: screenWidth * .2,
                              child: SvgPicture.asset(
                                Assets.imagesLogo,
                                width: screenWidth * .7,
                              ),
                            ),
                            Positioned(
                                top: screenHeight * .15,
                                child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    Container(
                                      width: screenWidth * .9,
                                      height: screenHeight * .2,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(11),
                                          gradient:
                                              const LinearGradient(colors: [
                                            ColorsManager.kGreenColor,
                                            ColorsManager.kBlueColor,
                                          ])),
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
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
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
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const MoshafScreen();
                                  },
                                ),
                              );
                            },
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
            ),
          ),
        );
      },
    );
  }
}
