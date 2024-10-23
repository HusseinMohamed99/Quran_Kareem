part of './../../core/helpers/export_manager/export_manager.dart';

class RecitersScreen extends StatelessWidget {
  const RecitersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit()..getReciters(),
      child: BlocConsumer<MainCubit, MainState>(
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
                body: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: SvgPicture.asset(
                        Assets.imagesHelal,
                        width: context.screenWidth * .2,
                        height: context.screenHeight * .2,
                      ),
                    ),
                    if (state is GetRecitersLoading)
                      const AdaptiveIndicator()
                    else
                      Expanded(
                        flex: 3,
                        child: ListView.separated(
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return RecitersWidget(
                              recitersModel:
                                  mainCubit.recitersModel ?? RecitersModel(),
                              index: index,
                              mainCubit: mainCubit,
                            );
                          },
                          itemCount:
                              mainCubit.recitersModel?.reciters?.length ?? 0,
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: 20.h,
                            );
                          },
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
