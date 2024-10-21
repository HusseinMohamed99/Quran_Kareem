part of './../../core/helpers/export_manager/export_manager.dart';

class AyatScreen extends StatelessWidget {
  const AyatScreen({super.key, required this.surahs, required this.number});
  final AyatModel surahs;
  final int number;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => MainCubit()..getQuran(),
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
                  image: AssetImage(Assets.imagesBackground),
                  fit: BoxFit.fill,
                ),
              ),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                extendBody: true,
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SurahNameWidget(
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                        surahs: surahs,
                        number: number,
                        mainCubit: mainCubit,
                      ),
                      if (state is GetQuranLoading)
                        const Expanded(
                          child: Center(
                            child: CircularProgressIndicator.adaptive(
                              backgroundColor: Colors.amber,
                            ),
                          ),
                        )
                      else
                        Expanded(
                          child: AyatListView(
                              mainCubit: mainCubit, number: number),
                        ),
                      const SizedBox(height: 20),
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
