part of './../../core/helpers/export_manager/export_manager.dart';

class TafasirScreen extends StatelessWidget {
  const TafasirScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => MainCubit()..getTafasir(),
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
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                Assets.imagesHelal,
                              ),
                              SvgPicture.asset(
                                Assets.imagesAlQuran,
                              ),
                            ],
                          ),
                        ),
                        if (state is GetTafasirLoading)
                          const Expanded(
                            child: Center(
                              child: CircularProgressIndicator.adaptive(
                                backgroundColor: Colors.amber,
                              ),
                            ),
                          )
                        else
                          Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return TafasirWidget(
                                  tafasirModel:
                                      mainCubit.tafasirModel ?? TafasirModel(),
                                  index: index,
                                );
                              },
                              itemCount: mainCubit
                                      .tafasirModel?.tafasir?.soar?.length ??
                                  0,
                            ),
                          )
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
