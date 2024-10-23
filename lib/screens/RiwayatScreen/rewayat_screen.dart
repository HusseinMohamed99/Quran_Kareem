part of './../../core/helpers/export_manager/export_manager.dart';

class RiwayatScreen extends StatelessWidget {
  const RiwayatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit()..getRiwayat(),
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
                body: SizedBox(
                  height: context.screenHeight,
                  width: context.screenWidth,
                  child: Center(
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          Assets.imagesGroup,
                          width: 200.w,
                          height: 200.h,
                        ),
                        if (state is GetRiwayatLoading)
                          const AdaptiveIndicator()
                        else
                          Expanded(
                            flex: 1,
                            child: ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return RiwayatWidget(
                                  riwayatModel:
                                      mainCubit.riwayatModel ?? RiwayatModel(),
                                  index: index,
                                );
                              },
                              separatorBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.w),
                                  child: const Divider(
                                    color: ColorsManager.kWhiteColor,
                                  ),
                                );
                              },
                              itemCount:
                                  mainCubit.riwayatModel?.riwayat?.length ?? 0,
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
      ),
    );
  }
}
