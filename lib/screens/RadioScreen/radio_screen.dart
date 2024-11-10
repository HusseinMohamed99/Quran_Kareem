part of './../../core/helpers/export_manager/export_manager.dart';

class RadioScreen extends StatelessWidget {
  const RadioScreen({super.key});

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
              extendBody: true,
              body: SizedBox(
                height: context.screenHeight,
                width: context.screenWidth,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const RadioImageWidget(),
                      if (state is GetRadioLoading)
                        const AdaptiveIndicator()
                      else
                        Expanded(
                          child: RadioWidget(
                            radioModel: mainCubit.currentRadio!,
                            mainCubit: mainCubit,
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
    );
  }
}
