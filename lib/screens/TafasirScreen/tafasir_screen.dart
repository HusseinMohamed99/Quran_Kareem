part of './../../core/helpers/export_manager/export_manager.dart';

class TafasirScreen extends StatelessWidget {
  const TafasirScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {},
      builder: (context, state) {
        MainCubit mainCubit = MainCubit.get(context);

        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
          child: Container(
            decoration: backgroundImage(),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SizedBox(
                height: context.screenHeight,
                width: context.screenWidth,
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: SvgPicture.asset(
                        Assets.imagesAlQuran,
                        width: 100.w,
                        height: 100.h,
                      ),
                    ),
                    if (state is GetTafasirLoading)
                      const AdaptiveIndicator()
                    else
                      Expanded(
                        child: TafasirWidget(
                          tafasirModel: mainCubit.currentTafasir!,
                          mainCubit: mainCubit,
                        ),
                      ),
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
