part of './../../core/helpers/export_manager/export_manager.dart';

class MoshafScreen extends StatelessWidget {
  const MoshafScreen({super.key});

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
                width: context.screenWidth,
                height: context.screenHeight,
                child: Column(
                  children: [
                    SizedBox(
                      height: context.screenHeight * .02,
                    ),
                    const AlBasmalaBannerWidget(),
                    if (state is GetQuranLoading || state is GetSurahLoading)
                      const Expanded(
                        child: Center(
                          child: CircularProgressIndicator.adaptive(
                            backgroundColor: Colors.amber,
                          ),
                        ),
                      )
                    else
                      Expanded(
                        child: ListView.separated(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                          ),
                          physics: const BouncingScrollPhysics(),
                          // shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                navigateTo(
                                  context,
                                  AyatScreen(
                                    surahs: mainCubit.ayatModel ?? AyatModel(),
                                    number: index,
                                  ),
                                );
                              },
                              child: SurahWidget(
                                surahModel:
                                    mainCubit.surahModel ?? SurahModel(),
                                number: index,
                                surahs: mainCubit.ayatModel ?? AyatModel(),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const Divider(
                              color: ColorsManager.kWhiteColor,
                            );
                          },
                          itemCount: mainCubit.surahModel?.suwar?.length ?? 0,
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
