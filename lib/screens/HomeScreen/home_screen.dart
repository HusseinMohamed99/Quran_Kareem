import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moshaf_app/shared/Colors/color_manager.dart';
import 'package:moshaf_app/shared/components/responsive.space.dart';
import 'package:moshaf_app/shared/cubit/cubit/main_cubit.dart';
import 'package:moshaf_app/shared/cubit/cubit/main_state.dart';
import 'package:moshaf_app/shared/widget/al_basmala_widget.dart';
import 'package:moshaf_app/shared/widget/grid_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit(),
      child: BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {},
        builder: (context, state) {
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
            ),
            child: Scaffold(
              backgroundColor: ColorsManager.kBackgroundColor,
              body: SizedBox(
                width: context.screenWidth,
                height: context.screenHeight,
                child: SafeArea(
                  bottom: false,
                  child: Column(
                    children: [
                      AlBasmalaWidget(
                        screenHeight: context.screenHeight,
                        screenWidth: context.screenWidth,
                      ),
                      Expanded(
                        child: ListView(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          primary: false,
                          children: const [
                            ListOfGridWidget(),
                          ],
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
