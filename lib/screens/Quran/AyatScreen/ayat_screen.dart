part of '../../../core/helpers/export_manager/export_manager.dart';

class AyatScreen extends StatelessWidget {
  const AyatScreen({super.key, required this.surahs, required this.number});
  final AyatModel surahs;
  final int number;

  @override
  Widget build(BuildContext context) {
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
              decoration: backgroundImage(),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                extendBody: true,
                body: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SurahNameWidget(
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
                      SizedBox(height: 20.h),
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
