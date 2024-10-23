part of '../../../core/helpers/export_manager/export_manager.dart';

class MoshafScreen extends StatelessWidget {
  const MoshafScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {},
      builder: (context, state) {
        final mainCubit = MainCubit.get(context);

        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
          child: Container(
            decoration: backgroundImage(),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              extendBody: true,
              body: SizedBox(
                width: context.screenWidth,
                height: context.screenHeight,
                child: Column(
                  children: [
                    SizedBox(height: context.screenHeight * .02),
                    const AlBasmalaBannerWidget(),
                    QuranListView(state: state, mainCubit: mainCubit),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
