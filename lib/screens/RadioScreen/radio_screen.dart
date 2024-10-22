part of './../../core/helpers/export_manager/export_manager.dart';

class RadioScreen extends StatelessWidget {
  const RadioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => MainCubit()..getRadio(),
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
                          child: Image.asset(
                            Assets.imagesRadio,
                          ),
                        ),
                        if (state is GetRadioLoading)
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
                              physics: const PageScrollPhysics(),
                              itemBuilder: (context, index) {
                                return RadioWidget(
                                  radioModel:
                                      mainCubit.radioModel ?? RadioModel(),
                                  index: index,
                                );
                              },
                              itemCount:
                                  mainCubit.radioModel?.radios?.length ?? 0,
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
